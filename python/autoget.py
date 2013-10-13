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


class cached_property(object):
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, cls=None):
        result = instance.__dict__[self.func.__name__] = self.func(instance)
        return result


def getdb():
    if os.path.isfile('script-info.json'):
        with codecs.open('script-info.json', 'r', encoding='utf-8') as F:
            return json.load(F)
    else:
        return json.load(urllib.urlopen('http://www.vim.org/script-info.php'))


def get_ext(fname):
    return fname.rpartition('.')[-1]


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
        return [aname]
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
        if all((part[0] == leadingdir for part in vofileparts[1:])):
            return check_candidate_with_file_list(
                [part[-1] for part in vofileparts],
                files,
                leadingdir,
            )
        else:
            return (prefix, 0)


github_url              = re.compile(r'github\.com/([^/\s]+)/([a-zA-Z\-_]+)(?:\.git)?')
gist_url                = re.compile(r'gist\.github\.com/(\d+)')
bitbucket_mercurial_url = re.compile(r'\bhg\b[^\n]*bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_]+)')
bitbucket_git_url       = re.compile(r'\bgit\b[^\n]*bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_]+)|bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_]+)\.git')
bitbucket_noscm_url     = re.compile(r'bitbucket\.org/([a-zA-Z_]+)/([a-zA-Z\-_]+)')
googlecode_url          = re.compile(r'code\.google\.com/p/([^/\s]+)')
mercurial_url           = re.compile(r'hg\s+clone\s+(\S+)')


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

    @property
    def name(self):
        return None

    @property
    def files(self):
        return []

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

    def __cmp__(self, other):
        if not isinstance(other, Match):
            raise NotImplementedError
        return cmp(self.key, other.key)


class GithubMatch(Match):
    re = github_url

    scm = 'git'

    @property
    def name(self):
        return self.match.group(2)

    @property
    def repo_path(self):
        return self.match.group(1) + '/' + self.name

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

    @property
    def url(self):
        return 'https://github.com/' + self.repo_path

    @property
    def scm_url(self):
        return 'git://github.com/' + self.repo_path

    @cached_property
    def files(self):
        try:
            return self.list_files()
        except Exception as e:
            logging.exception(e)
            u = urllib.urlopen(self.url)
            new_url = u.geturl()
            if new_url != full_repo_url:
                return GithubMatch(self.re.match(new_url), self.voinfo).files
            else:
                raise ValueError('Failed to get information from ' + repr(new_url))


class GistMatch(GithubMatch):
    re = gist_url

    scm = 'git'

    @cached_property
    def repo(self):
        global gh
        return gh.get_gist(self.match.group(1))

    @property
    def scm_url(self):
        return 'git://gist.github.com/' + self.match.group(1)

    @cached_property
    def files(self):
        return list(self.repo.files())


class MercurialMatch(Match):
    re = mercurial_url

    scm = 'hg'

    @property
    def scm_url(self):
        return self.match.group(1)

    @cached_property
    def files(self):
        global remote_parser
        parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        return list(next(iter(parsing_result['tips'])).files)


class BitbucketMercurialMatch(MercurialMatch):
    re = bitbucket_mercurial_url

    scm = 'hg'

    @property
    def scm_url(self):
        return 'https://bitbucket.org/' + self.match.group(1) + '/' + self.match.group(2)


class BitbucketMatch(Match):
    re = bitbucket_noscm_url

    def __init__(self, *args, **kwargs):
        global remote_parser
        super(BitbucketMatch, self).__init__(*args, **kwargs)
        self.scm_url = 'https://bitbucket.org/' + self.match.group(1) + '/' + self.match.group(2)
        try:
            parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        except Exception as e:
            print('{0} is probably not a mercurial URL: {1}'.format(self.scm_url, e))
            self._files = []
        else:
            self._files = list(next(iter(parsing_result['tips'])).files)
            self.scm = 'hg'

    @property
    def files(self):
        return self._files


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
                print('Key {0} was not found in voinfo of script {script_name}'
                        .format(key, **voinfo))
                continue
            for match in C.re.finditer(string):
                if not match.group(0) in foundstrings:
                    foundstrings.add(match.group(0))
                    yield C(match, voinfo)


def find_repo_candidate(voinfo):
    candidates = sorted(find_repo_candidates(voinfo), key=lambda o: o.key)
    vofiles = get_file_list(voinfo)
    best_candidate = None
    for candidate in candidates:
        print('Checking candidate {0}: {1}'.format(candidate.__class__.__name__,
                                                   candidate.match.group(0)))
        prefix, key2 = check_candidate_with_file_list(vofiles, candidate.files)
        candidate.prefix = prefix
        if key2 == 100:
            print ('Found candidate {0}: {1} (100)'.format(candidate.__class__.__name__,
                                                           candidate.match.group(0)))
            return candidate
        elif key2 and (not best_candidate or key2 > best_candidate.key2):
            best_candidate = candidate
            best_candidate.key2 = key2
    if best_candidate:
        print('Found candidate {0}: {1} ({2})'.format(
                                                best_candidate.__class__.__name__,
                                                best_candidate.match.group(0),
                                                best_candidate.key2))
    return best_candidate

if __name__ == '__main__':
    scmnrs = set()
    with open(os.path.join(os.path.dirname(os.path.dirname(__file__)),'db','scmsources.vim')) as SF:
        scmnr_re = re.compile(r'^let scmnr\.(\d+)')
        for line in SF:
            match = scmnr_re.match(line)
            if match:
                scmnrs.add(match.group(1))

    scm_generated_name = os.path.join(os.path.dirname(os.path.dirname(__file__)),
                                      'db', 'scm_generated.json')

    not_found_name = os.path.join(os.path.dirname(os.path.dirname(__file__)),
                                  'db', 'not_found.json')

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

    with lshg.MercurialRemoteParser() as remote_parser:
        db = getdb()
        for key in reversed(sorted(db, key=int)):
            if key not in scmnrs:
                voinfo = db[key]
                print(('Checking plugin {script_name} (vimscript #{script_id})'.format(**voinfo))
                        .encode(locale.getpreferredencoding() or 'ascii', 'xmlcharrefreplace'))
                try:
                    candidate = find_repo_candidate(voinfo)
                    if candidate:
                        scm_generated[key] = {'type': candidate.scm, 'url': candidate.scm_url}
                        print(key, scm_generated[key])
                    else:
                        not_found.add(key)
                except Exception as e:
                    print('Failed to process plugin {script_name}: {0}'.format(e, **voinfo))

    with open(scm_generated_name, 'w') as SGF:
        json.dump(scm_generated, SGF)

    with open(not_found_name, 'w') as NF:
        json.dump(list(not_found), NF)

# vim: tw=100 ft=python fenc=utf-8 ts=4 sts=4 sw=4
