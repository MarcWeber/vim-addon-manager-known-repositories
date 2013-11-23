#!/usr/bin/env python
# vim: fileencoding=utf-8

from subvertpy.ra import RemoteAccess

class NoFilesError(Exception):
    pass

def _list_svn_files(conn, path=''):
    dirents, frev, props = conn.get_dir(path, -1)
    for fname in dirents:
        new_path = (path + '/' if path else '') + fname
        contains = False
        for full_fname in _list_svn_files(conn, new_path):
            contains = True
            yield full_fname
        if not contains:
            yield new_path

def list_svn_files(url):
    conn = RemoteAccess(url)
    try:
        return _list_svn_files(conn)
    except NoFilesError:
        return []

# vim: tw=100 ft=python ts=4 sts=4 sw=4
