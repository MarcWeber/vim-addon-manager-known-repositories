#!/usr/bin/env python
from __future__ import unicode_literals, division, print_function

from github import Github
from collections import namedtuple
from subprocess import check_call, CalledProcessError
import codecs
import yaml
import os
import urllib
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

try:
    import lzma
except ImportError:
    from backports import lzma


sys.path.append(os.path.dirname(__file__))


import list_hg_files as lshg
import list_git_files as lsgit


logger = logging.getLogger('autoget')


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


def guess_fix_dir(voinfo):
    if voinfo['script_type'] in ('syntax', 'indent', 'ftplugin'):
        return voinfo['script_type']
    elif voinfo['script_type'] == 'color scheme':
        return 'colors'
    else:
        return 'plugin'


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
        return tarfile.TarFile(fileobj=AF).getnames()

    @staticmethod
    def tgz(AF):
        # gz requires tell
        return tarfile.TarFile(fileobj=io.BytesIO(AF.read()), format='gz').getnames()

    @staticmethod
    def tbz(AF):
        return tarfile.TarFile(fileobj=io.BytesIO(AF.read()), format='bz2').getnames()
    tbz2 = tbz

    @staticmethod
    def txz(AF):
        return tarfile.TarFile(fileobj=FileListers.xz(AF)).getnames()

    @staticmethod
    def zip(AF):
        # ZipFile requires seek
        return zipfile.ZipFile(io.BytesIO(AF.read())).namelist()

    @staticmethod
    def vmb(AF):
        af = iter(AF)
        while not next(af).startswith('finish'):
            pass

        files = []
        filere = re.compile('^\S+')
        try:
            while True:
                files.append(filere.match(next(af)).group(0))
                numlines = int(next(af))
                while numlines:
                    next(af)
                    numlines -= 1
        except StopIteration:
            pass
        return files

    vba = vmb


def get_file_list(voinfo):
    rinfo = voinfo['releases'][0]
    aname = rinfo['package']
    aurl = 'http://www.vim.org/scripts/download_script.php?src_id='+rinfo['src_id']
    ext = get_ext(aname).lower()
    if ext == 'vim':
        return [guess_fix_dir(voinfo) + '/' + aname]
    elif ext in FileListers.__dict__:
        AF = urllib.urlopen(aurl)
        r = getattr(FileListers, ext)(AF)
        while not isinstance(r, list):
            aname = aname[:-1-len(ext)]
            AF = r
            ext = get_ext(aname)
            r = getattr(FileListers, ext)(AF)
        return r
    else:
        raise ValueError('Unknown extension')


expected_extensions = set(('vim', 'txt', 'py', 'pl', 'lua', 'pm'))
def check_candidate_with_file_list(vofiles, files, prefix=None):
    nummatches = 0
    nummatches2 = 0
    numfiles = 0
    numfiles2 = 0
    nomatches = set()
    files = set(files)
    for fname in vofiles:
        if fname.endswith('/'):
            continue
        ext = get_ext(fname)
        isexp = ext in expected_extensions
        if fname in files:
            if isexp:
                nummatches += 1
            else:
                nummatches2 += 1
        else:
            nomatches.add(fname)
        if isexp:
            numfiles += 1
        else:
            numfiles2 += 1
    if nummatches == numfiles and nummatches2 == numfiles2:
        return (prefix, 100)
    elif nummatches == numfiles and (nummatches2 or not numfiles2):
        return (prefix, 90)
    else:
        vofileparts = [fname.partition('/') for fname in vofiles]
        leadingdir = vofileparts[0][0]
        if (leadingdir
                and all((part[0] == leadingdir for part in vofileparts[1:]))
                and all((part[1] for part in vofileparts))):
            return check_candidate_with_file_list(
                [part[-1] for part in vofileparts],
                files,
                leadingdir,
            )
        else:
            return (prefix, 0)


github_url              = re.compile(r'github\.com/([a-zA-Z\-_]+)/([a-zA-Z\-_.]+)(?:\.git)?')
vundle_github_url       = re.compile('\\b(?:Neo)?Bundle\\b\\s*\'([a-zA-Z\-_]+)/([a-zA-Z\-_.]+)(?:.git)?\'')
gist_url                = re.compile(r'gist\.github\.com/(\d+)')
bitbucket_mercurial_url = re.compile(r'\bhg\b[^\n]*bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_.]+)')
bitbucket_git_url       = re.compile(r'\bgit\b[^\n]*bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_.]+)|bitbucket\.org/([a-zA-Z_.]+)/([a-zA-Z\-_.]+)\.git')
bitbucket_noscm_url     = re.compile(r'bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_]+)')
googlecode_url          = re.compile(r'code\.google\.com/p/([^/\s]+)')
mercurial_url           = re.compile(r'hg\s+clone\s+(\S+)')
git_url                 = re.compile(r'git\s+clone\s+(\S+)')


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


class GithubMatch(Match):
    re = github_url

    scm = 'git'

    def __init__(self, *args, **kwargs):
        super(GithubMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.repo_path = self.match.group(1) + '/' + self.name
        self.scm_url = 'git://github.com/' + self.repo_path
        self.url = 'https://github.com/' + self.repo_path

    @cached_property
    def repo(self):
        global gh
        return gh.get_repo(self.repo_path)

    def list_files(self, dir=None):
        for f in self.repo.get_dir_contents(dir or '/'):
            name = (dir + '/' + f.name if dir else f.name)
            if f.type == 'file':
                yield name
            elif f.type == 'dir':
                for subf in self.list_files(name):
                    yield subf

    @cached_property
    def files(self):
        try:
            return self.list_files()
        except Exception as e:
            self.exception(e)
            u = urllib.urlopen(self.url)
            new_url = u.geturl()
            if new_url != full_repo_url:
                return GithubMatch(self.re.match(new_url), self.voinfo).files
            else:
                raise ValueError('Failed to get information from ' + repr(new_url))


class VundleGithubMatch(GithubMatch):
    re = vundle_github_url


class GistMatch(GithubMatch):
    re = gist_url

    scm = 'git'

    def __init__(self, *args, **kwargs):
        super(GistMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(1)
        self.scm_url = 'git://gist.github.com/' + self.name
        self.url = 'https://gist.github.com/' + self.name

    @cached_property
    def repo(self):
        global gh
        return gh.get_gist(self.name)

    @cached_property
    def files(self):
        return list(self.repo.files())


class MercurialMatch(Match):
    re = mercurial_url

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(MercurialMatch, self).__init__(*args, **kwargs)
        self.scm_url = self.match.group(1)
        self.name = self.scm_url.rpartition('/')[-1]

    @cached_property
    def files(self):
        global remote_parser
        parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        return list(next(iter(parsing_result['tips'])).files)


class BitbucketMercurialMatch(MercurialMatch):
    re = bitbucket_mercurial_url

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(BitbucketMercurialMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.scm_url = 'https://bitbucket.org/' + self.match.group(1) + '/' + self.name


class BitbucketMatch(Match):
    re = bitbucket_noscm_url

    def __init__(self, *args, **kwargs):
        global remote_parser
        super(BitbucketMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.scm_url = 'https://bitbucket.org/' + self.match.group(1) + '/' + self.name
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
    GistMatch,
    MercurialMatch,
    BitbucketMercurialMatch,
    BitbucketMatch,
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
                    yield C(match, voinfo)


def find_repo_candidate(voinfo):
    vofiles = get_file_list(voinfo)
    logger.info('>> vim.org files: ' + repr(vofiles))
    candidates = sorted(find_repo_candidates(voinfo), key=lambda o: o.key)
    best_candidate = None
    for candidate in candidates:
        logger.info('>> Checking candidate {0}: {1}'.format(candidate.__class__.__name__,
                                                            candidate.match.group(0)))
        prefix, key2 = check_candidate_with_file_list(vofiles, candidate.files)
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
    logger.setLevel(logging.INFO)
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

    try:
        with open(scm_generated_name) as SGF:
            scm_generated = json.load(SGF)
            scmnrs.update(scm_generated)
    except IOError:
        scm_generated = {}


    try:
        with open(not_found_name) as NF:
            not_found = set(json.load(NF))
            scmnrs.update(not_found)
    except IOError:
        not_found = set()

    with open(os.path.expanduser('~/.settings/passwords.yaml')) as PF:
        passwords = yaml.load(PF)
        user, password = iter(passwords['github.com'][0].items()).next()
    gh = GithubLazy(user, password)

    db = getdb()

    if len(sys.argv) > 1:
        if len(sys.argv) == 2 and sys.argv[1].startswith('-'):
            i = int(sys.argv[1])
            _keys = reversed(sorted(db, key=int))
            keys = []
            while i:
                keys.append(next(_keys))
                i += 1
        else:
            keys = sys.argv[1:]
            not_found -= set(keys)
    else:
        keys = reversed(sorted(db, key=int))

    with lshg.MercurialRemoteParser() as remote_parser:
        for key in keys:
            logger.info('Considering key {0}'.format(key))
            if key not in scmnrs:
                voinfo = db[key]
                logger.info('> Checking plugin {script_name} (vimscript #{script_id})'
                            .format(**voinfo))
                try:
                    candidate = find_repo_candidate(voinfo)
                    if candidate:
                        scm_generated[key] = {'type': candidate.scm, 'url': candidate.scm_url}
                        logger.info('> Recording found candidate for {0}: {1}'
                                    .format(key, scm_generated[key]))
                    else:
                        not_found.add(key)
                except Exception as e:
                    logger.exception(e)

    with open(scm_generated_name, 'w') as SGF:
        dump_json(scm_generated, SGF)

    with open(not_found_name, 'w') as NF:
        dump_json_nr_set(list(not_found), NF)

# vim: tw=100 ft=python fenc=utf-8 ts=4 sts=4 sw=4
