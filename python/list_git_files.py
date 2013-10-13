#!/usr/bin/env python
# vim: fileencoding=utf-8

from tempfile import mkdtemp
from subprocess import check_call, check_output
import os
from shutil import rmtree


def list_git_files(url):
    tmpdir = mkdtemp(suffix='.git')
    try:
        check_call(['git', 'clone', '--depth=1', '--', url, tmpdir])
        if os.path.isdir(tmpdir):
            return check_output(['git', '--git-dir=' + os.path.join(tmpdir, '.git'),
                                         '--work-tree=' + tmpdir,
                                         'ls-files', '-z']).split('\0')
        else:
            raise IOError('Failed to clone {0}: {1} not found'.format(url, tmpdir))
    finally:
        if os.path.isdir(tmpdir):
            rmtree(tmpdir)

# vim: tw=100 ft=python ts=4 sts=4 sw=4
