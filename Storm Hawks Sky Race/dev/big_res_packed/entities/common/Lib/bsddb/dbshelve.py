# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/dbshelve.py
# Compiled at: 2008-12-16 09:37:56
"""Manage shelves of pickled objects using bsddb database files for the
storage.
"""
import cPickle
try:
    from UserDict import DictMixin
except ImportError:

    class DictMixin:
        pass


import db

def open(filename, flags=db.DB_CREATE, mode=432, filetype=db.DB_HASH, dbenv=None, dbname=None):
    """
    A simple factory function for compatibility with the standard
    shleve.py module.  It can be used like this, where key is a string
    and data is a pickleable object:

        from bsddb import dbshelve
        db = dbshelve.open(filename)

        db[key] = data

        db.close()
    """
    if type(flags) == type(''):
        sflag = flags
        if sflag == 'r':
            flags = db.DB_RDONLY
        elif sflag == 'rw':
            flags = 0
        elif sflag == 'w':
            flags = db.DB_CREATE
        elif sflag == 'c':
            flags = db.DB_CREATE
        elif sflag == 'n':
            flags = db.DB_TRUNCATE | db.DB_CREATE
        else:
            raise db.DBError, "flags should be one of 'r', 'w', 'c' or 'n' or use the bsddb.db.DB_* flags"
    d = DBShelf(dbenv)
    d.open(filename, dbname, filetype, flags, mode)
    return d


class DBShelveError(db.DBError):
    pass


class DBShelf(DictMixin):
    """A shelf to hold pickled objects, built upon a bsddb DB object.  It
    automatically pickles/unpickles data objects going to/from the DB.
    """

    def __init__(self, dbenv=None):
        self.db = db.DB(dbenv)
        self.binary = 1

    def __del__(self):
        self.close()

    def __getattr__(self, name):
        """Many methods we can just pass through to the DB object.
        (See below)
        """
        return getattr(self.db, name)

    def __len__(self):
        return len(self.db)

    def __getitem__(self, key):
        data = self.db[key]
        return cPickle.loads(data)

    def __setitem__(self, key, value):
        data = cPickle.dumps(value, self.binary)
        self.db[key] = data

    def __delitem__(self, key):
        del self.db[key]

    def keys(self, txn=None):
        if txn != None:
            return self.db.keys(txn)
        else:
            return self.db.keys()
        return

    def items(self, txn=None):
        if txn != None:
            items = self.db.items(txn)
        else:
            items = self.db.items()
        newitems = []
        for (k, v) in items:
            newitems.append((k, cPickle.loads(v)))

        return newitems

    def values(self, txn=None):
        if txn != None:
            values = self.db.values(txn)
        else:
            values = self.db.values()
        return map(cPickle.loads, values)

    def __append(self, value, txn=None):
        data = cPickle.dumps(value, self.binary)
        return self.db.append(data, txn)

    def append(self, value, txn=None):
        if self.get_type() == db.DB_RECNO:
            return self.__append(value, txn=txn)
        raise DBShelveError, 'append() only supported when dbshelve opened with filetype=dbshelve.db.DB_RECNO'

    def associate(self, secondaryDB, callback, flags=0):

        def _shelf_callback(priKey, priData, realCallback=callback):
            data = cPickle.loads(priData)
            return realCallback(priKey, data)

        return self.db.associate(secondaryDB, _shelf_callback, flags)

    def get(self, *args, **kw):
        data = apply(self.db.get, args, kw)
        try:
            return cPickle.loads(data)
        except (TypeError, cPickle.UnpicklingError):
            return data

    def get_both(self, key, value, txn=None, flags=0):
        data = cPickle.dumps(value, self.binary)
        data = self.db.get(key, data, txn, flags)
        return cPickle.loads(data)

    def cursor(self, txn=None, flags=0):
        c = DBShelfCursor(self.db.cursor(txn, flags))
        c.binary = self.binary
        return c

    def put(self, key, value, txn=None, flags=0):
        data = cPickle.dumps(value, self.binary)
        return self.db.put(key, data, txn, flags)

    def join(self, cursorList, flags=0):
        raise NotImplementedError


class DBShelfCursor:
    """
    """

    def __init__(self, cursor):
        self.dbc = cursor

    def __del__(self):
        self.close()

    def __getattr__(self, name):
        """Some methods we can just pass through to the cursor object.  (See below)"""
        return getattr(self.dbc, name)

    def dup(self, flags=0):
        return DBShelfCursor(self.dbc.dup(flags))

    def put(self, key, value, flags=0):
        data = cPickle.dumps(value, self.binary)
        return self.dbc.put(key, data, flags)

    def get(self, *args):
        count = len(args)
        method = getattr(self, 'get_%d' % count)
        apply(method, args)

    def get_1(self, flags):
        rec = self.dbc.get(flags)
        return self._extract(rec)

    def get_2(self, key, flags):
        rec = self.dbc.get(key, flags)
        return self._extract(rec)

    def get_3(self, key, value, flags):
        data = cPickle.dumps(value, self.binary)
        rec = self.dbc.get(key, flags)
        return self._extract(rec)

    def current(self, flags=0):
        return self.get_1(flags | db.DB_CURRENT)

    def first(self, flags=0):
        return self.get_1(flags | db.DB_FIRST)

    def last(self, flags=0):
        return self.get_1(flags | db.DB_LAST)

    def next(self, flags=0):
        return self.get_1(flags | db.DB_NEXT)

    def prev(self, flags=0):
        return self.get_1(flags | db.DB_PREV)

    def consume(self, flags=0):
        return self.get_1(flags | db.DB_CONSUME)

    def next_dup(self, flags=0):
        return self.get_1(flags | db.DB_NEXT_DUP)

    def next_nodup(self, flags=0):
        return self.get_1(flags | db.DB_NEXT_NODUP)

    def prev_nodup(self, flags=0):
        return self.get_1(flags | db.DB_PREV_NODUP)

    def get_both(self, key, value, flags=0):
        data = cPickle.dumps(value, self.binary)
        rec = self.dbc.get_both(key, flags)
        return self._extract(rec)

    def set(self, key, flags=0):
        rec = self.dbc.set(key, flags)
        return self._extract(rec)

    def set_range(self, key, flags=0):
        rec = self.dbc.set_range(key, flags)
        return self._extract(rec)

    def set_recno(self, recno, flags=0):
        rec = self.dbc.set_recno(recno, flags)
        return self._extract(rec)

    set_both = get_both

    def _extract(self, rec):
        if rec is None:
            return
        else:
            (key, data) = rec
            return (key, cPickle.loads(data))
        return