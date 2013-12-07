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

import yaml
import os
import json
import re
import logging
import sys
import argparse
from functools import partial
import pickle

sys.path.append(os.path.dirname(__file__))

import list_hg_files as lshg
import list_github_files as lsgh

from vimorg import (getdb, get_file_list, compare_file_lists, get_voinfo_hash,
                    update_vo_cache, get_vo_cache)
from vomatch import (NotLoggedError, update_scm_cache, get_scm_cache, find_repo_candidate,
                     set_remote_parser, scm_matches, get_scm_file_list)

logger = logging.getLogger('autoget')


cache_name = os.path.join('.', 'cache.pickle')
scmsources_name = os.path.join('.', 'db', 'scmsources.vim')
scm_generated_name = os.path.join('.', 'db', 'scm_generated.json')
not_found_name = os.path.join('.', 'db', 'not_found.json')
omitted_name = os.path.join('.', 'db', 'omitted.json')
description_hashes_name = os.path.join('.', 'db', 'description_hashes.json')


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


def process_voinfo(scm_generated, found, not_found, description_hashes, key, voinfo, recheck=False):
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


def process_scmsources(return_scmnrs=True):
    scmnrs = set()
    scmnr_lines = []
    with open(scmsources_name) as SF:
        scmnr_re = re.compile(r'^let scmnr\.(\d+)')
        for line in SF:
            match = scmnr_re.match(line)
            if match:
                scmnrs.add(match.group(1))
                scmnr_lines.append(line)
    return scmnrs if return_scmnrs else scmnr_lines


def main():
    scmnrs = process_scmsources()

    omitted       = load_scmnrs_json(scmnrs, omitted_name)
    found = scmnrs.copy()
    scm_generated = load_scmnrs_json(scmnrs, scm_generated_name)
    not_found     = load_scmnrs_json(scmnrs, not_found_name, set)

    if not args.no_descriptions:
        try:
            with open(description_hashes_name) as DHF:
                description_hashes = json.load(DHF)
        except IOError:
            description_hashes = {}
    else:
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

    _process_voinfo = partial(process_voinfo, scm_generated,found,not_found,description_hashes)
    with lshg.MercurialRemoteParser() as remote_parser:
        set_remote_parser(remote_parser)
        if args.recheck:
            for key in scm_generated:
                _process_voinfo(key, db[key], recheck=True)
        else:
            for key in keys:
                if not args.force and key in scmnrs:
                    if args.all_last:
                        break
                    else:
                        continue
                logger.info('Considering key {0}'.format(key))
                _process_voinfo(key, db[key])

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
                        _process_voinfo(key, voinfo)

    return scm_generated, not_found, description_hashes


def write(msg):
    '''Write msg to sys.stdout, encoding it to utf-8

    If msg contains newline this function also calls .flush().'''
    sys.stdout.write(msg.encode('utf-8'))
    if '\n' in msg:
        sys.stdout.flush()


def prnt(msg):
    '''Like write(), but adds newline to the end of the message'''
    return write(msg + '\n')


def annotate_scmsources():
    url_regex = re.compile('^(.*)$')
    line_regex_strict = re.compile(r"^let\s+scmnr\.(\d+)\s*=\s*\{'type':\s*'(\w+)',\s*'url':\s*'([^']+)'\s*\}\s*")
    line_snr_regex = re.compile(r'(\d+)')
    line_url_regex = re.compile(r"'url': '([^']+)'")
    line_scm_regex = re.compile(r"'type': '([^']+)'")
    prnt ('┌ X if line contains information besides repository URL and SCM used')
    prnt ('│┌ ? or ! if line failes to be parsed by regular expressions')
    prnt ('││┌ A if scm type is unknown')
    prnt ('│││┌ F if match failes')
    prnt ('││││┌ O if match deduced from the description is different, M if there are no')
    prnt ('│││││┌ E if exception occurred, C if printing candidate on this line')
    prnt ('┴┴┴┴┴┴┬─────────────────────────────────────────────────────────────────────────')
    with lshg.MercurialRemoteParser() as remote_parser:
        set_remote_parser(remote_parser)
        for line in process_scmsources(False):
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
                    prefix, key2 = compare_file_lists(vofiles, files)
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


if __name__ == '__main__':
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
    p.add_argument('-c', '--use-cache', action='store_const', const=True,
            help='use cache with vim.org archive contents and contents of various SCM sources. '
                 'Cache will be stored in ./cache.pickle')
    p.add_argument('-w', '--write-cache', action='store_const', const=True,
            help='update cache at exit, but do not use it')
    p.add_argument('-i', '--interrupt-write', action='store_const', const=True,
            help='do writes (cache and database updates) after KeyboardInterrupt')

    args = p.parse_args()

    if (args.interrupt_write and (args.dry_run and not args.use_cache)):
        raise ValueError('Nothing to write on interrupt: you should either omit --dry-run or '
                'use --use-cache')

    if (args.dry_run and args.annotate_scmsources):
        raise ValueError('--dry-run is doing nothing for --annotate-scmsources')

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

    if args.use_cache or args.write_cache:
        try:
            with open(cache_name) as CF:
                scm_cache, vo_cache = pickle.load(CF)
                if args.use_cache:
                    update_scm_cache(scm_cache)
                    update_vo_cache(vo_cache)
        except IOError:
            pass

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.DEBUG if args.debug else logging.INFO)
    handler = logging.StreamHandler()
    root_logger.addHandler(handler)

    db = getdb()

    with open(os.path.expanduser('~/.settings/passwords.yaml')) as PF:
        passwords = yaml.load(PF)
        user, password = iter(passwords['github.com'][0].items()).next()
    lsgh.init_gh(user, password)

    ret = 0
    write_cache = False
    write_db = False
    try:
        if args.annotate_scmsources:
            if args.interrupt_write:
                write_cache = True
            annotate_scmsources()
            write_cache = True
        else:
            if args.interrupt_write:
                write_cache = True
                write_db = True
            scm_generated, not_found, description_hashes = main()
            write_cache = True
            write_db = True
    except Exception as e:
        logger.exception(e)
        ret = 1
    except KeyboardInterrupt:
        pass

    if write_cache and (args.use_cache or args.write_cache):
        if args.use_cache:
            scm_cache = get_scm_cache()
            vo_cache = get_vo_cache()
        else:
            scm_cache.update(get_scm_cache())
            vo_cache.update(get_vo_cache())
        with open(cache_name, 'w') as CF:
            pickle.dump((scm_cache, vo_cache), CF)

    if write_db and not args.dry_run:
        with open(scm_generated_name, 'w') as SGF:
            dump_json(scm_generated, SGF)

        with open(not_found_name, 'w') as NF:
            dump_json_nr_set(list(not_found), NF)

        if not args.no_descriptions:
            with open(description_hashes_name, 'w') as DHF:
                dump_json(description_hashes, DHF)

    sys.exit(ret)


# vim: tw=100 ft=python fenc=utf-8 ts=4 sts=4 sw=4
