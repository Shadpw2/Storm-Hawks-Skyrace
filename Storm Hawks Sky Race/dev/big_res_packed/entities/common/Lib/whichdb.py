# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/whichdb.py
# Compiled at: 2008-12-16 09:37:55
"""Guess which db package to use to open a db file."""
import os, struct, sys
try:
    import dbm
    _dbmerror = dbm.error
except ImportError:
    dbm = None
    _dbmerror = IOError

def whichdb(filename):
    """Guess which db package to use to open a db file.

    Return values:

    - None if the database file can't be read;
    - empty string if the file can be read but can't be recognized
    - the module name (e.g. "dbm" or "gdbm") if recognized.

    Importing the given module may still fail, and opening the
    database using that module may still fail.
    """
    try:
        f = open(filename + os.extsep + 'pag', 'rb')
        f.close()
        if not (dbm.library == 'GNU gdbm' and sys.platform == 'os2emx'):
            f = open(filename + os.extsep + 'dir', 'rb')
            f.close()
        return 'dbm'
    except IOError:
        try:
            f = open(filename + os.extsep + 'db', 'rb')
            f.close()
            if dbm is not None:
                d = dbm.open(filename)
                d.close()
                return 'dbm'
        except (IOError, _dbmerror):
            pass

    try:
        os.stat(filename + os.extsep + 'dat')
        size = os.stat(filename + os.extsep + 'dir').st_size
        if size == 0:
            return 'dumbdbm'
        f = open(filename + os.extsep + 'dir', 'rb')
        try:
            if f.read(1) in ("'", '"'):
                return 'dumbdbm'
        finally:
            f.close()

    except (OSError, IOError):
        pass

    try:
        f = open(filename, 'rb')
    except IOError:
        return

    s16 = f.read(16)
    f.close()
    s = s16[0:4]
    if len(s) != 4:
        return ''
    try:
        (magic,) = struct.unpack('=l', s)
    except struct.error:
        return ''

    if magic == 324508366:
        return 'gdbm'
    if magic in (398689, 1628767744):
        return 'bsddb185'
    try:
        (magic,) = struct.unpack('=l', s16[-4:])
    except struct.error:
        return ''

    if magic in (398689, 1628767744):
        return 'dbhash'
    return ''


if __name__ == '__main__':
    for filename in sys.argv[1:]:
        print whichdb(filename) or 'UNKNOWN', filename