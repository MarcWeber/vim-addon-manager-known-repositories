#!/usr/bin/env python
# vim: fileencoding=utf-8

from subvertpy.ra import RemoteAccess, DIRENT_KIND
from subvertpy import NODE_DIR

class NoFilesError(Exception):
    pass

def _list_svn_files(conn, path=''):
    dirents, frev, props = conn.get_dir(path, -1, DIRENT_KIND)
    for fname, props in dirents.items():
        new_path = (path + '/' if path else '') + fname
        contains = False
        if props['kind'] == NODE_DIR:
            for full_fname in _list_svn_files(conn, new_path):
                yield full_fname
        else:
            yield new_path

def list_svn_files(url):
    conn = RemoteAccess(url)
    try:
        return _list_svn_files(conn)
    except NoFilesError:
        return []

# vim: tw=100 ft=python ts=4 sts=4 sw=4
