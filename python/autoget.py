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

Currently supports git, mercurial and subversion repositories.
'''
from __future__ import unicode_literals, division, print_function

from collections import namedtuple
from subprocess import check_call, CalledProcessError
import yaml
import os
import httplib
import json
import re
import logging
import sys


sys.path.append(os.path.dirname(__file__))


import list_hg_files as lshg
import list_git_files as lsgit
import list_svn_files as lssvn
import list_github_files as lsgh
from vimorg import getdb, get_file_list, check_candidate_with_file_list


logger = logging.getLogger('autoget')


MAX_ATTEMPTS = 5


def dump_json(obj, F):
    '''Dump object to JSON in a VCS- and human-friendly way

    VCS-friendly implies having newlines and dictionary key sorting, without spaces after commas.
    Human-friendly implies using indentation and spaces after colons.
    '''
    return json.dump(obj, F, indent=2, sort_keys=True, separators=(',', ': '))


def dump_json_nr_set(st, F):
    '''Dump set() to json as a sorted list in a VCS- and human-friendly way

    set() is supposed to contain only string integer keys (i.e. integers represented as strings). 
    For the definition of VCS- and human-friendly check out dump_json above.
    '''
    dump_json(list(sorted(st, key=int)), F)


class cached_property(object):
    '''cached_property decorator

    Found somewhere on the internet. Uses __dict__ to cache properties into it.
    '''
    def __init__(self, func):
        self.func = func

    def __get__(self, instance, cls=None):
        result = instance.__dict__[self.func.__name__] = self.func(instance)
        return result


github_url              = re.compile(r'github\.com/([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:\.git)?')
vundle_github_url       = re.compile('\\b(?:Neo)?Bundle\\b\\s*[\'"]([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:.git)?[\'"]')
vundle_github_url_2     = re.compile('\\b[Bb]undle\\b(?:\s+\\w+)?\s+`?[\'"]?([0-9a-zA-Z\-_]+)/([0-9a-zA-Z\-_.]+)(?:.git)?[\'"]?')
gist_url                = re.compile(r'gist\.github\.com/(\d+)')
bitbucket_mercurial_url = re.compile(r'\bhg\b[^\n]*bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)')
bitbucket_git_url       = re.compile(r'\bgit\b[^\n]*bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)|bitbucket\.org/([0-9a-zA-Z_.]+)/([0-9a-zA-Z\-_.]+)\.git')
bitbucket_noscm_url     = re.compile(r'bitbucket\.org/([0-9a-zA-Z_]+)/([0-9a-zA-Z\-_.]+)')
bitbucket_site_url      = re.compile(r'([0-9a-zA-Z_]+)\.bitbucket\.org/([0-9a-zA-Z\-_.]+)')
codegoogle_url          = re.compile(r'code\.google\.com/([pr])/([^/\s]+)')
mercurial_url           = re.compile(r'hg\s+clone\s+(\S+)')
mercurial_url_2         = re.compile(r'\b(?:(?i)hg|mercurial)\b.*\b(\w+(?:\+\w+)*://\S+)')
git_url                 = re.compile(r'git\s+clone\s+(\S+)')
subversion_url          = re.compile(r'svn\s+(?:checkout|co)\s+(\S+)')


class NotLoggedError(Exception):
    pass


def novimext(s):
    '''Strip .vim extension from the given string'''
    if s.endswith('.vim'):
        return s[:-4]
    else:
        return s


def novimprefix(s):
    '''Strip vim- prefix from the given string'''
    if s.startswith('vim-'):
        return s[4:]
    else:
        return s


class Match(object):
    '''Base class for all matches'''
    def __init__(self, match, voinfo):
        self.match = match
        self.voinfo = voinfo

    @cached_property
    def key(self):
        name = self.name
        # TODO Also compare author names
        # TODO Give less common matches priority (if there are github and bitbucket mirrors 90% that 
        #      author has development on bitbucket, but has to use github as a mirror to be 
        #      Vundle-friendly)
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
    '''Matches github.com/{author}/{repo} URLs

    Uses github API to get list of files.'''
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
    def files(self):
        if self.scm_url.startswith('git://github.com/vim-scripts'):
            self.error('removing candidate: vim-scripts repositories are not used by VAM')
            raise NotLoggedError
        return set(lsgh.list_github_files(self.repo_path))


class VundleGithubMatch(GithubMatch):
    '''Matches “Vundle '{author}/{repo}'” strings'''
    re = vundle_github_url


class VundleGithubMatch2(GithubMatch):
    '''Matches strings like “[add] bundle for {author}/{repo}”'''
    re = vundle_github_url_2


class GistMatch(GithubMatch):
    '''Matches gist github URLs

    Uses github API as well, but a different portion of it.'''
    re = gist_url

    scm = 'git'

    def __init__(self, *args, **kwargs):
        Match.__init__(self, *args, **kwargs)
        self.name = self.match.group(1)
        self.scm_url = 'git://gist.github.com/' + self.name
        self.url = 'https://gist.github.com/' + self.name

    @cached_property
    def files(self):
        return set(lsgh.list_gist_files(self.name))


class VCSMatch(Match):
    '''Base class for strings like “svn checkout {url}”/“hg clone {url}”/etc'''
    def __init__(self, *args, **kwargs):
        super(VCSMatch, self).__init__(*args, **kwargs)
        self.scm_url = self.match.group(1)
        self.name = self.scm_url.rpartition('/')[-1]
        self.url = self.scm_url


class MercurialMatch(VCSMatch):
    '''Matches “hg clone {url}”'''
    re = mercurial_url

    scm = 'hg'

    @cached_property
    def files(self):
        global remote_parser
        parsing_result = remote_parser.parse_url(self.scm_url, 'tip')
        return set(next(iter(parsing_result['tips'])).files)


class MercurialMatch2(MercurialMatch):
    '''Matches strings like “mercurial [repository is located at] {url}”'''
    re = mercurial_url_2

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(MercurialMatch2, self).__init__(*args, **kwargs)
        for attr in ('scm_url', 'name', 'url'):
            setattr(self, attr, getattr(self, attr).rstrip('.,!?'))


class BitbucketMercurialMatch(MercurialMatch):
    '''Matches strings like “hg clone https://bitbucket.org/{author}/{repo}”'''
    re = bitbucket_mercurial_url

    scm = 'hg'

    def __init__(self, *args, **kwargs):
        super(BitbucketMercurialMatch, self).__init__(*args, **kwargs)
        self.name = self.match.group(2)
        self.scm_url = 'https://bitbucket.org/' + self.match.group(1) + '/' + self.name
        self.url = self.scm_url


class BitbucketMatch(Match):
    '''Matches URLs bitbucket.org/{author}/{repo}'''
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
            self.files = set(lsgit.list_git_files(self.scm_url))
            self.scm = 'git'
        else:
            self.files = set(next(iter(parsing_result['tips'])).files)
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
    '''Matches URLs like {author}.bitbucket.org/{repo}'''
    re = bitbucket_site_url


class CodeGoogleMatch(Match):
    '''Matches code.google.com/(p|r)/{project}'''
    re = codegoogle_url

    def __init__(self, *args, **kwargs):
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
            try:
                self.info('Checking whether {0} is a git repository'.format(self.scm_url))
                self.files = set(lsgit.list_git_files(self.scm_url, allow_depth=False))
                self.scm = 'git'
            except Exception as e:
                self.info('Checking whether {0} is a subversion repository'.format(self.scm_url))
                # FIXME detect directory
                # Plugin for which detection is useful: #2805
                self.scm_url = 'http://' + self.name + '.googlecode.com/svn'
                self.files = set(lssvn.list_svn_files(self.scm_url))
                self.info('Subversion files: {0!r}'.format(self.files))
                trunkfiles = {tf[6:] for tf in self.files if tf.startswith('trunk/')}
                if trunkfiles:
                    self.scm_url += '/trunk'
                    self.files = trunkfiles
                    self.info('Found trunk/ directory, leaving only files in there: {0!r}'.format(self.files))
                self.scm = 'svn'
        else:
            self.files = set(next(iter(parsing_result['tips'])).files)
            self.scm = 'hg'


    @cached_property
    def files(self):
        self._check_scm()
        return self.files

    @cached_property
    def scm(self):
        self._check_scm()
        return self.scm


class SubversionMatch(VCSMatch):
    '''Matches “svn checkout {url}”'''
    re = subversion_url

    scm = 'svn'

    @cached_property
    def files(self):
        return set(lssvn.list_svn_files(self.scm_url))


class GitMatch(VCSMatch):
    '''Matches “git checkout {url}”'''
    re = git_url

    scm = 'git'

    @cached_property
    def files(self):
        try:
            return set(lsgit.list_git_files(self.scm_url))
        except Exception as e:
            logger.exception(e)
            return lsgit.list_git_files(self.scm_url, allow_depth=False)


candidate_classes = (
    GithubMatch,
    VundleGithubMatch,
    VundleGithubMatch2,
    GistMatch,
    CodeGoogleMatch,
    BitbucketMercurialMatch,
    GitMatch,
    MercurialMatch,
    MercurialMatch2,
    SubversionMatch,
    BitbucketMatch,
    BitbucketSiteMatch,
)


def find_repo_candidates(voinfo):
    '''Process all Match subclasses recorded above

    Uses MatchSubclass.re to find URLs that are candidates to be repository URLs and yields 
    instances of used MatchSubclass.
    '''
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

def get_scm_file_list(candidate):
    '''Returns candidate.files, cached; cache key is candidate.scm_url'''
    url = candidate.scm_url
    try:
        files = _checked_URLs[url]
        logger.debug('>>> Obtained files from cache for URL {0}'.format(url))
    except KeyError:
        files = set(candidate.files)
        _checked_URLs[url] = files
    return files


def find_repo_candidate(voinfo, vofiles=None):
    '''Find repository URL for the given plugin

    Iterates for all candidates returned by find_repo_candidates and returns first candidate with 
    best score found.'''
    global _checked_URLs
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
            files = get_scm_file_list(candidate)
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


def load_scmnrs_json(scmnrs, fname, typ=dict):
    '''Load json file, recording its contents into scmnrs

    If file is not present instance of typ is returned. If file is present loaded object is 
    converted to the given typ.
    '''
    try:
        with open(fname) as F:
            ret = json.load(F)
            scmnrs.update(ret)
            return typ(ret)
    except IOError:
        return typ()


def candidate_to_sg(candidate):
    '''Convert candidate to dictionary suitable for recording into scm_generated.json'''
    return {'type': candidate.scm, 'url': candidate.scm_url}


def process_voinfo(scm_generated, found, not_found, voinfo, recheck=False):
    '''Process given plugin

    If ``recheck`` is ``True`` then it only prints to stderr whether something changed.

    If ``recheck`` is ``False`` then it records found URL in scm_generated and puts corresponding 
    plugin number into ``found``. If no URL was found it records plugin number into ``not_found``.
    '''
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


if __name__ == '__main__':
    import argparse
    from functools import partial
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
    p.add_argument('-A', '--annotate-scmsources', action='store_const', const=True,
            help='annotate db/scmsources.vim: shows which URLs can be deduced by autoget.py')
    p.add_argument('-x', '--no-extra-check', action='store_const', const=True,
            help='when annotating, do not check lines that contain extra information')
    p.add_argument('-p', '--print-other-candidate', action='store_const', const=True,
            help='when annotating, print candidates that were found')

    args = p.parse_args()

    if (args.no_extra_check or args.print_other_candidate) and not args.annotate_scmsources:
        raise ValueError('--print-other-candidate and --no-extra-check can only be used with '
                '--annotate-scmsources')

    if (len(filter(None,
        [args.sids, args.last, args.all_last, args.recheck, args.annotate_scmsources])) > 1):
        raise ValueError('You may specify only one of sids, --recheck, --last, --all-last, '
                '--annotate-scmsources at the time')

    if (args.all_last and args.force):
        raise ValueError('You may not specify both --force and --all-last')

    if (args.sids or args.recheck or args.last):
        args.no_descriptions = True

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG if args.debug else logging.INFO)
    handler = logging.StreamHandler()
    root_logger.addHandler(handler)
    scmnrs = set()
    scmsources_name = os.path.join('.', 'db', 'scmsources.vim')
    scmnr_lines = []
    with open(scmsources_name) as SF:
        scmnr_re = re.compile(r'^let scmnr\.(\d+)')
        for line in SF:
            match = scmnr_re.match(line)
            if match:
                scmnrs.add(match.group(1))
                scmnr_lines.append(line)

    scm_generated_name = os.path.join('.', 'db', 'scm_generated.json')
    not_found_name = os.path.join('.', 'db', 'not_found.json')
    omitted_name = os.path.join('.', 'db', 'omitted.json')
    description_hashes_name = os.path.join('.', 'db', 'description_hashes.json')

    omitted       = load_scmnrs_json(scmnrs, omitted_name)
    found = scmnrs.copy()
    scm_generated = load_scmnrs_json(scmnrs, scm_generated_name)
    not_found     = load_scmnrs_json(scmnrs, not_found_name, set)

    db = getdb()

    with open(os.path.expanduser('~/.settings/passwords.yaml')) as PF:
        passwords = yaml.load(PF)
        user, password = iter(passwords['github.com'][0].items()).next()
    lsgh.init_gh(user, password)

    if args.annotate_scmsources:
        scm_matches = {
            'svn': SubversionMatch,
            'git': GitMatch,
            'hg':  MercurialMatch,
        }
        url_regex = re.compile('^(.*)$')
        line_regex_strict = re.compile(r"^let\s+scmnr\.(\d+)\s*=\s*\{'type':\s*'(\w+)',\s*'url':\s*'([^']+)'\s*\}\s*")
        line_snr_regex = re.compile(r'(\d+)')
        line_url_regex = re.compile(r"'url': '([^']+)'")
        line_scm_regex = re.compile(r"'type': '([^']+)'")
        def write(msg):
            sys.stdout.write(msg.encode('utf-8'))
            if '\n' in msg:
                sys.stdout.flush()
        def prnt(msg):
            return write(msg + '\n')
        prnt ('┌ X if line contains information besides repository URL and SCM used')
        prnt ('│┌ ? or ! if line failes to be parsed by regular expressions')
        prnt ('││┌ A if scm type is unknown')
        prnt ('│││┌ F if match failes')
        prnt ('││││┌ O if match deduced from the description is different, M if there are no')
        prnt ('│││││┌ E if exception occurred, C if printing candidate on this line')
        prnt ('┴┴┴┴┴┴┬─────────────────────────────────────────────────────────────────────────')
        with lshg.MercurialRemoteParser() as remote_parser:
            for line in reversed(scmnr_lines):
                try:
                    numcolumns = 5
                    best_candidate = None
                    line = line.decode('utf-8')
                    logger.info('Checking line ' + line)
                    match = line_regex_strict.match(line)
                    if match:
                        write('  ')
                        numcolumns -= 2
                        snr, scm, url = match.groups()
                    else:
                        write('X')
                        numcolumns -= 1
                        if args.no_extra_check:
                            raise NotLoggedError
                        snr = line_snr_regex.search(line)
                        scm = line_scm_regex.search(line)
                        url = line_url_regex.search(line)
                        if snr:
                            snr = snr.group(1)
                        if scm:
                            scm = scm.group(1)
                        if url:
                            url = url.group(1)
                        if not snr:
                            write('!')
                            numcolumns -= 1
                            raise ValueError('snr key not found')
                        if not scm:
                            write('?A')
                            numcolumns -= 2
                            url = None
                        elif not url:
                            write('?-')
                            numcolumns -= 2
                            scm = None
                        else:
                            write(' ')
                            numcolumns -= 1
                    if scm not in scm_matches:
                        write('A')
                        numcolumns -= 1
                        url = None
                        scm = None
                    else:
                        write(' ')
                        numcolumns -= 1

                    voinfo = db[snr]
                    vofiles = set(get_file_list(voinfo))
                    if url:
                        match = url_regex.match(url)
                        candidate = scm_matches[scm](match, voinfo)
                        files = get_scm_file_list(candidate)
                        prefix, key2 = check_candidate_with_file_list(vofiles, files)
                        write(' ' if key2 else 'F')
                        numcolumns -= 1
                    else:
                        write('-')
                        numcolumns -= 1

                    best_candidate = find_repo_candidate(voinfo, vofiles)
                    if not best_candidate:
                        write('M')
                        numcolumns -= 1
                    elif not (url and best_candidate.scm_url == url and best_candidate.scm == scm):
                        write('O')
                        numcolumns -= 1
                    else:
                        write(' ')
                        numcolumns -= 1
                        best_candidate = None
                    write(' ')
                    numcolumns -= 1
                except Exception as e:
                    if not isinstance(e, NotLoggedError):
                        logger.exception(e)
                    write(('-' * numcolumns) + 'E')
                finally:
                    # XXX line ends with \n, thus not writing `+ '\n'` here.
                    write('│' + line)
                    if best_candidate and args.print_other_candidate:
                        write("-----C│let scmnr.%-4u = {'type': '%s', 'url': '%s'}\n"
                                % (int(snr), best_candidate.scm, best_candidate.scm_url))
        sys.exit(0)

    if not args.no_descriptions:
        try:
            with open(description_hashes_name) as DHF:
                description_hashes = json.load(DHF)
        except IOError:
            description_hashes = {}

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

    process_voinfo = partial(process_voinfo, scm_generated, found, not_found)
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
