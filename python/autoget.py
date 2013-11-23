#!/usr/bin/env python
# vim:fileencoding=utf-8
'''
Utility that generates SCM URLs based on comparison of file lists generated
from www.vim.org archives and repository URLs found in script descriptions
or installation details found on www.vim.org.

Found SCM URLs are saved in ./db/scm_generated.json.
List of script numbers which were checked, but with no result, is saved in
./db/not_found.json.
List of script numbers which should not be processed for some reason can be
found in ./db/omitted.json.

It uses these files and ./db/scmsources.vim to determine which scripts
should not be rechecked.

Vim.org archive URLs and plugin descriptions are obtained from dump found at
http://www.vim.org/script-info.php. If there is file ./script-info.json it is
used instead.

Currently supports only git and mercurial repositories.
'''
from __future__ import unicode_literals, division, print_function

from github import Github, GithubException
from collections import namedtuple
from subprocess import check_call, CalledProcessError
import codecs
import yaml
import os
import urllib
import httplib
import json
import re
import logging
import sys
import locale

import bz2
import gzip
import tarfile
import zipfile
import io

import magic

try:
    import lzma
except ImportError:
    from backports import lzma


sys.path.append(os.path.dirname(__file__))


import list_hg_files as lshg
import list_git_files as lsgit


logger = logging.getLogger('autoget')


MAX_ATTEMPTS = 5


def dump_json(obj, F):
    return json.dump(obj, F, indent=2, sort_keys=True, separators=(',', ': '))


def dump_json_nr_set(st, F):
    dump_json(list(sorted(st, key=int)), F)


class cached_property(object):
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, cls=None):
        result = instance.__dict__[self.func.__name__] = self.func(instance)
        return result


def getdb():
    if os.path.isfile('script-info.json'):
        logger.info('Using file script-info.json')
        with codecs.open('script-info.json', 'r', encoding='utf-8') as F:
            return json.load(F)
    else:
        logger.info('Processing http://www.vim.org/script-info.php')
        return json.load(urllib.urlopen('http://www.vim.org/script-info.php'))


def get_ext(fname):
    return fname.rpartition('.')[-1]


def get_patchinfo_fix_dirs(ret={}):
    if ret:
        return ret
    else:
        with open(os.path.join('.', 'db', 'patchinfo.vim')) as PIF:
            start_section = b'"▶1 '
            in_section = 0
            line_re = re.compile(r"(\d+).*: '([^']+)'")
            for line in PIF:
                if line.startswith(start_section):
                    if line.startswith(start_section + b'Type corrections'):
                        in_section = 2
                    elif line.startswith(start_section + b'Fixing target directories'):
                        in_section = 1
                    else:
                        if in_section:
                            break
                        in_section = 0
                    continue
                if in_section:
                    match = line_re.search(line)
                    if match:
                        d = match.group(2)
                        ret[match.group(1)] = d if in_section == 1 else _guess_fix_dir(d)
        return ret


def _guess_fix_dir(script_type):
    if script_type in ('syntax', 'indent', 'ftplugin'):
        return script_type
    elif script_type == 'color scheme':
        return 'colors'
    else:
        return 'plugin'


def guess_fix_dir(voinfo):
    patchinfo_fix_dirs = get_patchinfo_fix_dirs()
    try:
        return patchinfo_fix_dirs[voinfo['script_id']]
    except KeyError:
        return _guess_fix_dir(voinfo['script_type'])


def get_voinfo_hash(voinfo):
    return hash(voinfo.get('description',     '') + voinfo.get('install_details', ''))


def get_tar_names(tf):
    for ti in tf:
        if not ti.isdir():
            yield ti.name


# Namespace
class FileListers:
    @staticmethod
    def gz(AF):
        # GzipFile requires tell
        return gzip.GzipFile(fileobj=io.BytesIO(AF.read()))

    @staticmethod
    def bz2(AF):
        return io.BytesIO(bz2.decompress(AF.read()))

    @staticmethod
    def lzma(AF):
        return lzma.LZMAFile(AF)

    @staticmethod
    def xz(AF):
        return lzma.LZMAFile(AF)

    @staticmethod
    def tar(AF):
        # tar requires tell on its own
        return set(get_tar_names(tarfile.TarFile(fileobj=io.BytesIO(AF.read()))))

    @staticmethod
    def tgz(AF):
        # gz requires tell
        return set(get_tar_names(tarfile.TarFile(fileobj=FileListers.gz(AF), format='gz')))

    @staticmethod
    def tbz(AF):
        return set(get_tar_names(tarfile.TarFile(fileobj=FileListers.bz2(AF), format='bz2')))
    tbz2 = tbz

    @staticmethod
    def txz(AF):
        return set(get_tar_names(tarfile.TarFile(fileobj=FileListers.xz(AF))))

    @staticmethod
    def zip(AF):
        # ZipFile requires seek
        return set(zipfile.ZipFile(io.BytesIO(AF.read())).namelist())

    @staticmethod
    def vmb(AF):
        af = iter(AF)
        while not next(af).startswith('finish'):
            pass

        files = set()
        filere = re.compile('^\S+')
        try:
            while True:
                files.add(filere.match(next(af)).group(0))
                numlines = int(next(af))
                while numlines:
                    next(af)
                    numlines -= 1
        except StopIteration:
            pass
        return files

    vba = vmb


mime_to_ext = {
    'application/x-gzip': 'gz',
    'application/x-tar': 'tar',
}

_magic = None

def find_mime(AF):
    global _magic
    if not _magic:
        _magic = magic.open(magic.MAGIC_MIME_TYPE)
        _magic.load('/usr/share/misc/magic.mgc')
    af = AF.read()
    return io.BytesIO(af), mime_to_ext[_magic.buffer(af)]


def get_result(AF, ext, aname, had_to_guess=False):
    try:
        ret = getattr(FileListers, ext)(AF)
    except Exception as e:
        # It may appear that archive has wrong extension (e.g. like in script #4734 that reports 
        # being .tar file while it is actually .tar.gz). Thus here is catch-all rule.
        # TODO: Maybe add patchinfo_generated.json which will contain archive name corrections for 
        #       such cases.
        logger.exception(e)
        if not had_to_guess:
            AF.seek(0)
            AF, ext = find_mime(AF)
            ret = get_result(AF, ext, aname, True)
            had_to_guess = True
        else:
            raise
    if not isinstance(ret, set):
        if had_to_guess:
            AF, ext = find_mime(ret)
            return get_result(AF, ext, None, had_to_guess)
        else:
            aname = aname[:-1-len(ext)]
            ext = get_ext(aname).lower()
            return get_result(ret, ext, aname, had_to_guess)
    else:
        return ret


def get_file_list(voinfo):
    rinfo = voinfo['releases'][0]
    aname = rinfo['package']
    aurl = 'http://www.vim.org/scripts/download_script.php?src_id='+rinfo['src_id']
    ext = get_ext(aname).lower()
    logger.info('>>> Processing archive %s (ext %s)' % (aname, ext))
    if ext == 'vim':
        return [guess_fix_dir(voinfo) + '/' + aname]
    elif ext in FileListers.__dict__:
        return get_result(io.BytesIO(urllib.urlopen(aurl).read()), ext, aname)
    else:
        raise ValueError('Unknown extension')


# Only directories that may be automatically loaded by vim are listed below.
specialdirs = {'plugin', 'ftplugin', 'syntax', 'indent', 'after'}

def isvimvofile(fname):
    return ((fname.endswith('.vim') and fname.partition('/')[0] in specialdirs))
           #or (fname.endswith('.py') and
           #    (fname.startswith('pythonx/')
           #        or fname.startswith('python2/')
           #        or fname.startswith('python3/'))))


expected_extensions = {'vim', 'txt', 'py', 'pl', 'lua', 'pm', 'rb'}
def isexpected(fname):
    # Second condition blocks files like .hg_archival.txt
    return ((get_ext(fname) in expected_extensions)
            and not fname.startswith('.hg')
            and not fname.startswith('.git')
            and not 'README' in fname)


# Directories corresponding to plugin types on www.vim.org
vodirs = {'plugin', 'colors', 'ftplugin', 'indent', 'syntax'}
def check_candidate_with_file_list(vofiles, files, prefix=None):
    expvofiles = {fname for fname in vofiles if isexpected(fname)}
    vimvofiles = {fname for fname in expvofiles if isvimvofile(fname)}
    vimfiles = {fname for fname in files if isvimvofile(fname)}
    if vofiles <= files:
        if vimvofiles < vimfiles and len(vimfiles) - len(vimvofiles) > 5:
            logger.info('>>>> Rejected because there are significant files not present in archive: '
                    '%s'
                    % (repr(vimfiles - vimvofiles)))
            return (prefix, 0)
        logger.info('>>>> Accepted with score 100 because all files '
                'are contained in the repository')
        return (prefix, 100)
    elif expvofiles and expvofiles <= files:
        if vimvofiles < vimfiles and len(vimfiles) - len(vimvofiles) > 5:
            logger.info('>>>> Rejected because there are significant files not present in archive: '
                    '%s'
                    % (repr(vimfiles - vimvofiles)))
            return (prefix, 0)
        logger.info('>>>> Accepted with score 90 because all files that are considered significant '
                'are contained in the repository: %s. Missing insignificant files: %s.'
                % (repr(expvofiles), repr(vofiles - files)))
        return (prefix, 90)
    else:
        vofileparts = [fname.partition('/') for fname in vofiles]
        leadingdir = vofileparts[0][0]
        if (leadingdir
                and leadingdir not in vodirs
                and all((part[0] == leadingdir for part in vofileparts[1:]))
                and all((part[1] for part in vofileparts))):
            logger.info('>>>> Trying to match with leading path component removed: %s'
                    % leadingdir)
            return check_candidate_with_file_list(
                {part[-1] for part in vofileparts},
                files,
                leadingdir,
            )
        else:
            # TODO Detect the need in vamkr#AddCopyHook
            # TODO Detect the need in fixing target directory (example: script #4769 which has 
            #      a single .vim file “archive” that has to be put under autoload/airline/themes as 
            #      listed in db/patchinfo.vim). Add this in patchinfo_generated.json.
            logger.info('>>>> Rejected because not all significant files were found '
                    'in the repository: %s' % repr(expvofiles - files))
            return (prefix, 0)


github_url              = re.compile(r'github\.com/([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:\.git)?')
vundle_github_url       = re.compile('\\b(?:Neo)?Bundle\\b\\s*[\'"]([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:.git)?[\'"]')
gist_url                = re.compile(r'gist\.github\.com/(\d+)')
bitbucket_mercurial_url = re.compile(r'\bhg\b[^\n]*bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)')
bitbucket_git_url       = re.compile(r'\bgit\b[^\n]*bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)|bitbucket\.org/([0-9a-zA-Z_.]+)/([0-9a-zA-Z\-_.]+)\.git')
bitbucket_noscm_url     = re.compile(r'bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)')
bitbucket_site_url      = re.compile(r'([0-9a-zA-Z_]+)\.bitbucket\.org/([0-9a-zA-Z\-_.]+)')
codegoogle_url          = re.compile(r'code\.google\.com/([pr])/([^/\s]+)')
mercurial_url           = re.compile(r'hg\s+clone\s+(\S+)')
mercurial_url_2         = re.compile(r'\b(?:(?i)hg|mercurial)\b.*\b(\w+(?:\+\w+)*://\S+)')
git_url                 = re.compile(r'git\s+clone\s+(\S+)')


class NotLoggedError(Exception):
    pass


def novimext(s):
    if s.endswith('.vim'):
        return s[:-4]
    else:
        return s


def novimprefix(s):
    if s.startswith('vim-'):
        return s[4:]
    else:
        return s


class Match(object):
    def __init__(self, match, voinfo):
        self.match = match
        self.voinfo = voinfo

    @cached_property
    def key(self):
        name = self.name
        # TODO Also compare author names
        try:
            voname = self.voinfo['script_name']
        except KeyError:
            return 0
        if not name or not voname:
            return 0
        elif name == voname:
            return 10
        elif name.lower() == voname.lower():
            return 9
        elif novimext(name) == novimext(voname):
            return 9
        elif novimext(name.lower()) == novimext(voname.lower()):
            return 8
        elif novimprefix(name) == novimprefix(voname):
            return 7
        elif novimprefix(name.lower()) == novimprefix(voname.lower()):
            return 6
        else:
            name = novimext(novimprefix(name.lower()))
            voname = novimext(novimprefix(voname.lower()))
            if name == voname:
                return 5
            elif name.startswith(voname) or voname.startswith(name):
                return 4
            elif name.endswith(voname) or voname.endswith(name):
                return 4
            elif name in voname:
                return 3
            elif voname in name:
                return 2
            else:
                return -1

    for level in ('info', 'warning', 'error', 'critical'):
        exec(('def {0}(self, msg):\n'+
              '   return logger.{0}(">>> " + msg)\n').format(level))

    def exception(self, e):
        logger.exception(e)

    def __cmp__(self, other):
        if not isinstance(other, Match):
            raise NotImplementedError
        return cmp(self.key, other.key)

    def __repr__(self):
        return ('<%s: %s (from match %s)>'
                % (type(self).__name__, self.url, self.match.group(0)))


class GithubMatch(Match):
    re = github_url

    scm = 'git'

    def __init__(self, *args, **kwargs):
        super(GithubMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.repo_path = self.match.group(1) + '/' + self.name
        if self.repo_path.endswith('.git'):
            self.repo_path = self.repo_path[:-4]
        self.url = 'https://github.com/' + self.repo_path
        self._check_redirects()

    def _check_redirects(self, attempt=0):
        c = httplib.HTTPSConnection('github.com')
        c.request('HEAD', '/' + self.repo_path)
        r = c.getresponse()
        if r.status == httplib.MOVED_PERMANENTLY:
            new_url = r.msg['location']
            assert new_url.startswith('https://github.com/')
            if new_url != self.url:
                self.info('Found redirect to %s' % new_url)
                self.url = new_url
                self.repo_path = self.url[len('https://github.com/'):]
                self.name = self.repo_path.rpartition('/')[-1]
        elif 400 <= r.status < 500:
            self.error('Cannot use this match: request failed with code %u (%s)'
                       % (r.status, httplib.responses[r.status]))
            raise NotLoggedError
        elif 500 <= r.status:
            if attempt < MAX_ATTEMPTS:
                self.error('Retrying: request failed with code %u (%s)'
                           % (r.status, httplib.responses[r.status]))
                self._check_redirects(attempt + 1)
            else:
                self.error('Cannot use this match: request failed with code %u (%s), attempt %u'
                           % (r.status, httplib.responses[r.status], attempt))

        self.scm_url = 'git://github.com/' + self.repo_path

    @cached_property
    def repo(self):
        global gh
        return gh.get_repo(self.repo_path)

    def list_files(self, dir=None, attempt=0):
        try:
            for f in self.repo.get_dir_contents(dir or '/'):
                name = (dir + '/' + f.name if dir else f.name)
                if f.type == 'file':
                    yield name
                elif f.type == 'dir':
                    for subf in self.list_files(name):
                        yield subf
        except GithubException as e:
            if 500 <= e.status:
                if attempt < MAX_ATTEMPTS:
                    self.error('Received exception, retrying: %s' % repr(e))
                    for fname in self.list_files(dir, attempt + 1):
                        yield fname
                else:
                    raise
            else:
                raise

    @cached_property
    def files(self):
        if self.scm_url.startswith('git://github.com/vim-scripts'):
            self.error('removing candidate: vim-scripts repositories are not used by VAM')
            raise NotLoggedError
        return set(self.list_files())


class VundleGithubMatch(GithubMatch):
    re = vundle_github_url


class VundleGithubMatch2(GithubMatch):
    re = re.compile('\\b[Bb]undle\\b(?:\s+\\w+)?\s+`?[\'"]?([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:.git)?[\'"]?')


class GistMatch(GithubMatch):
    re = gist_url

    scm = 'git'

    def __init__(self, *args, **kwargs):
        Match.__init__(self, *args, **kwargs)
        self.name = self.match.group(1)
        self.scm_url = 'git://gist.github.com/' + self.name
        self.url = 'https://gist.github.com/' + self.name

    @cached_property
    def repo(self):
        global gh
        return gh.get_gist(self.name)

    @cached_property
    def files(self):
        return set(self.repo.files)


class MercurialMatch(Match):
    re = mercurial_url

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(MercurialMatch, self).__init__(*args, **kwargs)
        self.scm_url = self.match.group(1)
        self.name = self.scm_url.rpartition('/')[-1]
        self.url = self.scm_url

    @cached_property
    def files(self):
        global remote_parser
        parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        return set(next(iter(parsing_result['tips'])).files)


class MercurialMatch2(MercurialMatch):
    re = mercurial_url_2

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(MercurialMatch2, self).__init__(*args, **kwargs)
        for attr in ('scm_url', 'name', 'url'):
            setattr(self, attr, getattr(self, attr).rstrip('.,!?'))


class BitbucketMercurialMatch(MercurialMatch):
    re = bitbucket_mercurial_url

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(BitbucketMercurialMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.scm_url = 'https://bitbucket.org/' + self.match.group(1) + '/' + self.name
        self.url = self.scm_url


class BitbucketMatch(Match):
    re = bitbucket_noscm_url

    def __init__(self, *args, **kwargs):
        global remote_parser
        super(BitbucketMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.repo_path = self.match.group(1) + '/' + self.name
        self.scm_url = 'https://bitbucket.org/' + self.repo_path
        self.url = self.scm_url

    def _check_scm(self):
        self._check_presence()
        try:
            self.info('Checking whether {0} is a mercurial repository'.format(self.scm_url))
            parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        except Exception as e:
            self.info('Checking whether {0} is a git repository'.format(self.scm_url))
            self.files = lsgit.list_git_files(self.scm_url)
            self.scm = 'git'
        else:
            self.files = list(next(iter(parsing_result['tips'])).files)
            self.scm = 'hg'

    @cached_property
    def files(self):
        self._check_scm()
        return self.files

    @cached_property
    def scm(self):
        self._check_scm()
        return self.scm

    def _check_presence(self, attempt=0):
        c = httplib.HTTPSConnection('bitbucket.org')
        c.request('HEAD', '/' + self.repo_path)
        r = c.getresponse()
        if 400 <= r.status < 500:
            self.error('Cannot use this match: request failed with code %u (%s)'
                       % (r.status, httplib.responses[r.status]))
            raise NotLoggedError
        elif 500 <= r.status:
            if attempt < MAX_ATTEMPTS:
                self.error('Retrying: request failed with code %u (%s)'
                           % (r.status, httplib.responses[r.status]))
                self._check_presence(attempt + 1)
            else:
                self.error('Cannot use this match: request failed with code %u (%s), attempt %u'
                           % (r.status, httplib.responses[r.status], attempt))


class BitbucketSiteMatch(BitbucketMatch):
    re = bitbucket_site_url


class CodeGoogleMatch(Match):
    re = codegoogle_url

    def __init__(self, *args, **kwargs):
        global remote_parser
        super(CodeGoogleMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        urlpart = self.match.group(1) + '/' + self.match.group(2)
        url = 'http://code.google.com/' + urlpart
        self.scm_url = url
        self.url = url

    def _check_scm(self):
        try:
            self.info('Checking whether {0} is a mercurial repository'.format(self.scm_url))
            parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        except Exception as e:
            # TODO Check for git
            raise
        else:
            self.files = list(next(iter(parsing_result['tips'])).files)
            self.scm = 'hg'

    @cached_property
    def files(self):
        self._check_scm()
        return self.files

    @cached_property
    def scm(self):
        self._check_scm()
        return self.scm


class GithubLazy(object):
    __slots__ = ('user', 'password', 'gh')

    def __init__(self, user, password):
        self.user = user
        self.password = password

    def __getattr__(self, attr):
        if attr == 'gh':
            self.gh = Github(self.user, self.password)
            return self.gh
        else:
            return getattr(self.gh, attr)


candidate_classes = (
    GithubMatch,
    VundleGithubMatch,
    VundleGithubMatch2,
    GistMatch,
    CodeGoogleMatch,
    BitbucketMercurialMatch,
    MercurialMatch,
    MercurialMatch2,
    BitbucketMatch,
    BitbucketSiteMatch,
)


def find_repo_candidates(voinfo):
    foundstrings = set()
    for C in candidate_classes:
        for key in ('install_details', 'description'):
            try:
                string = voinfo[key]
            except KeyError:
                logger.error('>> Key {0} was not found in voinfo of script {script_name}'
                             .format(key, **voinfo))
                continue
            for match in C.re.finditer(string):
                if not match.group(0) in foundstrings:
                    foundstrings.add(match.group(0))
                    try:
                        yield C(match, voinfo)
                    except NotLoggedError:
                        pass


_checked_URLs = {}


def find_repo_candidate(voinfo):
    global _checked_URLs
    vofiles = None
    candidates = sorted(find_repo_candidates(voinfo), key=lambda o: o.key, reverse=True)
    best_candidate = None
    already_checked = set()
    for candidate in candidates:
        if vofiles is None:
            vofiles = get_file_list(voinfo)
            vofiles = {fname for fname in vofiles if not fname.endswith('/')}
            logger.info('>> vim.org files: ' + repr(vofiles))
        url = candidate.url
        if url in already_checked:
            logger.debug('>>> Omitting {0} because it was already checked'.format(url))
            continue
        already_checked.add(url)
        logger.info('>> Checking candidate {0} with key {1}: {2}'.format(
            candidate.__class__.__name__,
            candidate.key,
            candidate.match.group(0)
        ))
        try:
            try:
                files = _checked_URLs[url]
                logger.debug('>>> Obtained files from cache for URL {0}'.format(url))
            except KeyError:
                files = set(candidate.files)
                _checked_URLs[url] = files
            logger.info('>>> Repository files: {0!r}'.format(files))
            prefix, key2 = check_candidate_with_file_list(vofiles, files)
        except NotLoggedError:
            pass
        except Exception as e:
            logger.exception(e)
        else:
            candidate.prefix = prefix
            if key2 == 100:
                logger.info('>> Found candidate {0}: {1} (100)'.format(candidate.__class__.__name__,
                                                                    candidate.match.group(0)))
                return candidate
            elif key2 and (not best_candidate or key2 > best_candidate.key2):
                best_candidate = candidate
                best_candidate.key2 = key2
    if best_candidate:
        logger.info('Found candidate {0}: {1} ({2})'.format(
                                                best_candidate.__class__.__name__,
                                                best_candidate.match.group(0),
                                                best_candidate.key2))
    return best_candidate

if __name__ == '__main__':
    import argparse
    p = argparse.ArgumentParser(
            description=__doc__.partition('\n\n')[0],
            epilog=__doc__.partition('\n\n')[-1],
            formatter_class=argparse.RawDescriptionHelpFormatter
        )
    p.add_argument('-n', '--dry-run', action='store_const', const=True,
            help='do not edit any files')
    p.add_argument('-l', '--last', metavar='N', type=int,
            help='process only last N script numbers. Implies -D')
    p.add_argument('-a', '--all-last', action='store_const', const=True,
            help='process scripts in reversed order until already processed script was not found')
    p.add_argument('-D', '--no-descriptions', action='store_const', const=True,
            help='do not check description hashes')
    p.add_argument('-R', '--recheck', action='store_const', const=True,
            help='recheck URLs found in scm_generated.json and report the result. '
                 'Does not modify scm_generated.json. Implies -D')
    p.add_argument('-f', '--force', action='store_const', const=True,
            help='do not check whether given numbers were already processed')
    p.add_argument('sids', nargs='*', metavar='SID',
            help='process only this script. May be passed more then once. Also see --force. '
                 'Implies -D')
    p.add_argument('-d', '--debug', action='store_const', const=True,
            help='enable a few more messages')

    args = p.parse_args()

    if ((args.sids and args.last)
            or (args.sids and args.all_last)
            or (args.last and args.all_last)):
        raise ValueError('You may specify only one of SID, --last or --all-last')

    if (args.all_last and args.force):
        raise ValueError('You may not specify both --force and --all-last')

    if (args.recheck and (args.sids or args.last or args.all_last)):
        raise ValueError('You may not specify --recheck and --sids, --last or --all-last at '
                'the time')

    if (args.sids or args.recheck or args.last):
        args.no_descriptions = True

    logger.setLevel(logging.DEBUG if args.debug else logging.INFO)
    handler = logging.StreamHandler()
    logger.addHandler(handler)
    scmnrs = set()
    with open(os.path.join('.', 'db', 'scmsources.vim')) as SF:
        scmnr_re = re.compile(r'^let scmnr\.(\d+)')
        for line in SF:
            match = scmnr_re.match(line)
            if match:
                scmnrs.add(match.group(1))

    scm_generated_name = os.path.join('.', 'db', 'scm_generated.json')
    not_found_name = os.path.join('.', 'db', 'not_found.json')
    omitted_name = os.path.join('.', 'db', 'omitted.json')
    description_hashes_name = os.path.join('.', 'db', 'description_hashes.json')

    def load_scmnrs_json(fname, typ=dict):
        global scmnrs
        try:
            with open(fname) as F:
                ret = json.load(F)
                scmnrs.update(ret)
                return typ(ret)
        except IOError:
            return typ()

    omitted       = load_scmnrs_json(omitted_name)
    found = scmnrs.copy()
    scm_generated = load_scmnrs_json(scm_generated_name)
    not_found     = load_scmnrs_json(not_found_name, set)

    if not args.no_descriptions:
        try:
            with open(description_hashes_name) as DHF:
                description_hashes = json.load(DHF)
        except IOError:
            description_hashes = {}

    with open(os.path.expanduser('~/.settings/passwords.yaml')) as PF:
        passwords = yaml.load(PF)
        user, password = iter(passwords['github.com'][0].items()).next()
    gh = GithubLazy(user, password)

    db = getdb()

    if args.sids:
        keys = args.sids
        not_found -= set(keys)
    elif args.last:
        i = args.last
        _keys = reversed(sorted(db, key=int))
        keys = []
        while i:
            keys.append(next(_keys))
            i -= 1
    else:
        keys = reversed(sorted(db, key=int))

    def candidate_to_sg(candidate):
        return {'type': candidate.scm, 'url': candidate.scm_url}

    def process_voinfo(voinfo, recheck=False):
        global scm_generated
        global found
        global not_found
        logger.info('> Checking plugin {script_name} (vimscript #{script_id})'
                    .format(**voinfo))
        try:
            candidate = find_repo_candidate(voinfo)
            if recheck:
                desc = '%s : %s' % (voinfo['script_id'], voinfo['script_name'])
                if candidate:
                    c_sg = candidate_to_sg(candidate)
                    s_sg = scm_generated[voinfo['script_id']]
                    if c_sg == s_sg:
                        print ('== ' + desc)
                    else:
                        logger.info('> {0!r} (new) /= {1!r} (old)'.format(c_sg, s_sg))
                        print ('/= ' + desc)
                else:
                    print ('no ' + desc)
            else:
                if candidate:
                    scm_generated[key] = candidate_to_sg(candidate)
                    logger.info('> Recording found candidate for {0}: {1}'
                                .format(key, scm_generated[key]))
                    not_found.discard(key)
                else:
                    logger.info('> Recording failure to find candidates for {0}'.format(key))
                    not_found.add(key)
                found.add(key)
                if not args.no_descriptions:
                    description_hashes[key] = get_voinfo_hash(voinfo)
        except Exception as e:
            logger.exception(e)

    with lshg.MercurialRemoteParser() as remote_parser:
        if args.recheck:
            for key in scm_generated:
                process_voinfo(db[key], recheck=True)
        else:
            for key in keys:
                if not args.force and key in scmnrs:
                    if args.all_last:
                        break
                    else:
                        continue
                logger.info('Considering key {0}'.format(key))
                process_voinfo(db[key])

            if not args.no_descriptions:
                logger.info('Starting descriptions check')
                for key in keys:
                    voinfo = db[key]
                    changed = False
                    if key not in description_hashes:
                        h = get_voinfo_hash(voinfo)
                        description_hashes[key] = h
                        changed = True
                    if key in found:
                        continue
                    if not changed:
                        h = get_voinfo_hash(voinfo)
                        changed = (h != description_hashes.get(key))
                        if changed:
                            logger.info('Hash for key {0} changed, checking it'.format(key))
                            description_hashes[key] = h
                    else:
                        logger.info('New hash for key {0}'.format(key))
                    if changed:
                        process_voinfo(voinfo)

    if not args.dry_run:
        with open(scm_generated_name, 'w') as SGF:
            dump_json(scm_generated, SGF)

        with open(not_found_name, 'w') as NF:
            dump_json_nr_set(list(not_found), NF)

        if not args.no_descriptions:
            with open(description_hashes_name, 'w') as DHF:
                dump_json(description_hashes, DHF)

# vim: tw=100 ft=python fenc=utf-8 ts=4 sts=4 sw=4
