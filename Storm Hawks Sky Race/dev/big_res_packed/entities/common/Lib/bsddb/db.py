# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/db.py
# Compiled at: 2008-12-16 09:37:55
if __name__.startswith('bsddb3.'):
    from ._pybsddb import *
    from _pybsddb import __version__
else:
    from ._bsddb import *
    from _bsddb import __version__
if version() < (3, 2, 0):
    raise ImportError, 'correct BerkeleyDB symbols not found.  Perhaps python was statically linked with an older version?'