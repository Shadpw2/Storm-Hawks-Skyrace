# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/glob.py
# Compiled at: 2008-12-16 09:37:44
"""Filename globbing utility."""
import os, fnmatch, re
__all__ = [
 'glob', 'iglob']

def glob(pathname):
    """Return a list of paths matching a pathname pattern.

    The pattern may contain simple shell-style wildcards a la fnmatch.

    """
    return list(iglob(pathname))


def iglob(pathname):
    """Return a list of paths matching a pathname pattern.

    The pattern may contain simple shell-style wildcards a la fnmatch.

    """
    if not has_magic(pathname):
        if os.path.lexists(pathname):
            yield pathname
        return
    (dirname, basename) = os.path.split(pathname)
    if not dirname:
        for name in glob1(os.curdir, basename):
            yield name

        return
    if has_magic(dirname):
        dirs = iglob(dirname)
    else:
        dirs = [
         dirname]
    if has_magic(basename):
        glob_in_dir = glob1
    else:
        glob_in_dir = glob0
    for dirname in dirs:
        for name in glob_in_dir(dirname, basename):
            yield os.path.join(dirname, name)


def glob1(dirname, pattern):
    if not dirname:
        dirname = os.curdir
    try:
        names = os.listdir(dirname)
    except os.error:
        return []

    if pattern[0] != '.':
        names = filter((lambda x: x[0] != '.'), names)
    return fnmatch.filter(names, pattern)


def glob0(dirname, basename):
    if basename == '':
        if os.path.isdir(dirname):
            return [
             basename]
    elif os.path.lexists(os.path.join(dirname, basename)):
        return [
         basename]
    return []


magic_check = re.compile('[*?[]')

def has_magic(s):
    return magic_check.search(s) is not None