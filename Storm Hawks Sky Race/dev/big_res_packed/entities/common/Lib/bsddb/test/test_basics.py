# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_basics.py
# Compiled at: 2008-12-16 09:37:57
"""
Basic TestCases for BTree and hash DBs, with and without a DBEnv, with
various DB flags, etc.
"""
import os, sys, errno, shutil, string, tempfile
from pprint import pprint
import unittest, time
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

from test_all import verbose
DASH = '-'

class VersionTestCase(unittest.TestCase):

    def test00_version(self):
        info = db.version()
        if verbose:
            print '\n', '-=' * 20
            print 'bsddb.db.version(): %s' % (info,)
            print db.DB_VERSION_STRING
            print '-=' * 20
        assert info == (db.DB_VERSION_MAJOR, db.DB_VERSION_MINOR,
         db.DB_VERSION_PATCH)


class BasicTestCase(unittest.TestCase):
    dbtype = db.DB_UNKNOWN
    dbopenflags = 0
    dbsetflags = 0
    dbmode = 432
    dbname = None
    useEnv = 0
    envflags = 0
    envsetflags = 0
    _numKeys = 1002

    def setUp(self):
        if self.useEnv:
            homeDir = os.path.join(os.path.dirname(sys.argv[0]), 'db_home')
            self.homeDir = homeDir
            try:
                shutil.rmtree(homeDir)
            except OSError, e:
                if e.errno not in (errno.ENOENT, errno.ESRCH):
                    raise
            else:
                os.mkdir(homeDir)
                try:
                    self.env = db.DBEnv()
                    self.env.set_lg_max(1048576)
                    self.env.set_tx_max(30)
                    self.env.set_tx_timestamp(int(time.time()))
                    self.env.set_flags(self.envsetflags, 1)
                    self.env.open(homeDir, self.envflags | db.DB_CREATE)
                    tempfile.tempdir = homeDir
                    self.filename = os.path.split(tempfile.mktemp())[1]
                    tempfile.tempdir = None
                except:
                    shutil.rmtree(homeDir)
                    raise

        else:
            self.env = None
            self.filename = tempfile.mktemp()
        self.d = db.DB(self.env)
        self.d.set_flags(self.dbsetflags)
        if self.dbname:
            self.d.open(self.filename, self.dbname, self.dbtype, self.dbopenflags | db.DB_CREATE, self.dbmode)
        else:
            self.d.open(self.filename, mode=self.dbmode, dbtype=self.dbtype, flags=self.dbopenflags | db.DB_CREATE)
        self.populateDB()
        return

    def tearDown(self):
        self.d.close()
        if self.env is not None:
            self.env.close()
            shutil.rmtree(self.homeDir)
        else:
            os.remove(self.filename)
        return

    def populateDB(self, _txn=None):
        d = self.d
        for x in range(self._numKeys / 2):
            key = '%04d' % (self._numKeys - x)
            data = self.makeData(key)
            d.put(key, data, _txn)

        d.put('empty value', '', _txn)
        for x in range(self._numKeys / 2 - 1):
            key = '%04d' % x
            data = self.makeData(key)
            d.put(key, data, _txn)

        if _txn:
            _txn.commit()
        num = len(d)
        if verbose:
            print 'created %d records' % num

    def makeData(self, key):
        return DASH.join([key] * 5)

    def test01_GetsAndPuts(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test01_GetsAndPuts...' % self.__class__.__name__
        for key in ['0001', '0100', '0400', '0700', '0999']:
            data = d.get(key)
            if verbose:
                print data

        assert d.get('0321') == '0321-0321-0321-0321-0321'
        assert d.get('abcd') == None
        try:
            d.delete('abcd')
        except db.DBNotFoundError, val:
            assert val[0] == db.DB_NOTFOUND
            if verbose:
                print val
        else:
            self.fail('expected exception')

        d.put('abcd', 'a new record')
        assert d.get('abcd') == 'a new record'
        d.put('abcd', 'same key')
        if self.dbsetflags & db.DB_DUP:
            assert d.get('abcd') == 'a new record'
        else:
            assert d.get('abcd') == 'same key'
        try:
            d.put('abcd', 'this should fail', flags=db.DB_NOOVERWRITE)
        except db.DBKeyExistError, val:
            assert val[0] == db.DB_KEYEXIST
            if verbose:
                print val
        else:
            self.fail('expected exception')

        if self.dbsetflags & db.DB_DUP:
            assert d.get('abcd') == 'a new record'
        else:
            assert d.get('abcd') == 'same key'
        d.sync()
        d.close()
        del d
        self.d = db.DB(self.env)
        if self.dbname:
            self.d.open(self.filename, self.dbname)
        else:
            self.d.open(self.filename)
        d = self.d
        assert d.get('0321') == '0321-0321-0321-0321-0321'
        if self.dbsetflags & db.DB_DUP:
            assert d.get('abcd') == 'a new record'
        else:
            assert d.get('abcd') == 'same key'
        rec = d.get_both('0555', '0555-0555-0555-0555-0555')
        if verbose:
            print rec
        assert d.get_both('0555', 'bad data') == None
        data = d.get('bad key', 'bad data')
        assert data == 'bad data'
        data = d.get('bad key', self)
        assert data == self
        s = d.stat()
        assert type(s) == type({})
        if verbose:
            print 'd.stat() returned this dictionary:'
            pprint(s)
        return

    def test02_DictionaryMethods(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test02_DictionaryMethods...' % self.__class__.__name__
        for key in ['0002', '0101', '0401', '0701', '0998']:
            data = d[key]
            assert data == self.makeData(key)
            if verbose:
                print data

        assert len(d) == self._numKeys
        keys = d.keys()
        assert len(keys) == self._numKeys
        assert type(keys) == type([])
        d['new record'] = 'a new record'
        assert len(d) == self._numKeys + 1
        keys = d.keys()
        assert len(keys) == self._numKeys + 1
        d['new record'] = 'a replacement record'
        assert len(d) == self._numKeys + 1
        keys = d.keys()
        assert len(keys) == self._numKeys + 1
        if verbose:
            print 'the first 10 keys are:'
            pprint(keys[:10])
        assert d['new record'] == 'a replacement record'
        assert d.has_key('0001') == 1
        assert d.has_key('spam') == 0
        items = d.items()
        assert len(items) == self._numKeys + 1
        assert type(items) == type([])
        assert type(items[0]) == type(())
        assert len(items[0]) == 2
        if verbose:
            print 'the first 10 items are:'
            pprint(items[:10])
        values = d.values()
        assert len(values) == self._numKeys + 1
        assert type(values) == type([])
        if verbose:
            print 'the first 10 values are:'
            pprint(values[:10])

    def test03_SimpleCursorStuff(self, get_raises_error=0, set_raises_error=0):
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test03_SimpleCursorStuff (get_error %s, set_error %s)...' % (
             self.__class__.__name__, get_raises_error, set_raises_error)
        if self.env and self.dbopenflags & db.DB_AUTO_COMMIT:
            txn = self.env.txn_begin()
        else:
            txn = None
        c = self.d.cursor(txn=txn)
        rec = c.first()
        count = 0
        while rec is not None:
            count = count + 1
            if verbose and count % 100 == 0:
                print rec
            try:
                rec = c.next()
            except db.DBNotFoundError, val:
                if get_raises_error:
                    assert val[0] == db.DB_NOTFOUND
                    if verbose:
                        print val
                    rec = None
                else:
                    self.fail('unexpected DBNotFoundError')

            assert c.get_current_size() == len(c.current()[1]), '%s != len(%r)' % (c.get_current_size(), c.current()[1])

        assert count == self._numKeys
        rec = c.last()
        count = 0
        while rec is not None:
            count = count + 1
            if verbose and count % 100 == 0:
                print rec
            try:
                rec = c.prev()
            except db.DBNotFoundError, val:
                if get_raises_error:
                    assert val[0] == db.DB_NOTFOUND
                    if verbose:
                        print val
                    rec = None
                else:
                    self.fail('unexpected DBNotFoundError')

        assert count == self._numKeys
        rec = c.set('0505')
        rec2 = c.current()
        assert rec == rec2
        assert rec[0] == '0505'
        assert rec[1] == self.makeData('0505')
        assert c.get_current_size() == len(rec[1])
        rec = c.set('empty value')
        assert rec[1] == ''
        assert c.get_current_size() == 0
        try:
            n = c.set('bad key')
        except db.DBNotFoundError, val:
            assert val[0] == db.DB_NOTFOUND
            if verbose:
                print val
        else:
            if set_raises_error:
                self.fail('expected exception')
            if n != None:
                self.fail('expected None: %r' % (n,))

        rec = c.get_both('0404', self.makeData('0404'))
        assert rec == ('0404', self.makeData('0404'))
        try:
            n = c.get_both('0404', 'bad data')
        except db.DBNotFoundError, val:
            assert val[0] == db.DB_NOTFOUND
            if verbose:
                print val
        else:
            if get_raises_error:
                self.fail('expected exception')
            if n != None:
                self.fail('expected None: %r' % (n,))

        if self.d.get_type() == db.DB_BTREE:
            rec = c.set_range('011')
            if verbose:
                print "searched for '011', found: ", rec
            rec = c.set_range('011', dlen=0, doff=0)
            if verbose:
                print "searched (partial) for '011', found: ", rec
            if rec[1] != '':
                self.fail('expected empty data portion')
            ev = c.set_range('empty value')
            if verbose:
                print "search for 'empty value' returned", ev
            if ev[1] != '':
                self.fail('empty value lookup failed')
        c.set('0499')
        c.delete()
        try:
            rec = c.current()
        except db.DBKeyEmptyError, val:
            if get_raises_error:
                assert val[0] == db.DB_KEYEMPTY
                if verbose:
                    print val
            else:
                self.fail('unexpected DBKeyEmptyError')
        else:
            if get_raises_error:
                self.fail('DBKeyEmptyError exception expected')

        c.next()
        c2 = c.dup(db.DB_POSITION)
        assert c.current() == c2.current()
        c2.put('', 'a new value', db.DB_CURRENT)
        assert c.current() == c2.current()
        assert c.current()[1] == 'a new value'
        c2.put('', 'er', db.DB_CURRENT, dlen=0, doff=5)
        assert c2.current()[1] == 'a newer value'
        c.close()
        c2.close()
        if txn:
            txn.commit()
        methods_to_test = {'current': (), 
           'delete': (), 
           'dup': (
                 db.DB_POSITION,), 
           'first': (), 
           'get': (0, ), 
           'next': (), 
           'prev': (), 
           'last': (), 
           'put': (
                 '', 'spam', db.DB_CURRENT), 
           'set': ('0505', )}
        for (method, args) in methods_to_test.items():
            try:
                if verbose:
                    print "attempting to use a closed cursor's %s method" % method
                apply(getattr(c, method), args)
            except db.DBError, val:
                assert val[0] == 0
                if verbose:
                    print val
            else:
                self.fail("no exception raised when using a buggy cursor's%s method" % method)

        oldcursor = self.d.cursor(txn=txn)
        self.d.close()
        del oldcursor
        return

    def test03b_SimpleCursorWithoutGetReturnsNone0(self):
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test03b_SimpleCursorStuffWithoutGetReturnsNone...' % self.__class__.__name__
        old = self.d.set_get_returns_none(0)
        assert old == 2
        self.test03_SimpleCursorStuff(get_raises_error=1, set_raises_error=1)

    def test03b_SimpleCursorWithGetReturnsNone1(self):
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test03b_SimpleCursorStuffWithoutGetReturnsNone...' % self.__class__.__name__
        old = self.d.set_get_returns_none(1)
        self.test03_SimpleCursorStuff(get_raises_error=0, set_raises_error=1)

    def test03c_SimpleCursorGetReturnsNone2(self):
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test03c_SimpleCursorStuffWithoutSetReturnsNone...' % self.__class__.__name__
        old = self.d.set_get_returns_none(1)
        assert old == 2
        old = self.d.set_get_returns_none(2)
        assert old == 1
        self.test03_SimpleCursorStuff(get_raises_error=0, set_raises_error=0)

    def test04_PartialGetAndPut(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test04_PartialGetAndPut...' % self.__class__.__name__
        key = 'partialTest'
        data = '1' * 1000 + '2' * 1000
        d.put(key, data)
        assert d.get(key) == data
        assert d.get(key, dlen=20, doff=990) == '1111111111' + '2222222222'
        d.put('partialtest2', '1' * 30000 + 'robin')
        assert d.get('partialtest2', dlen=5, doff=30000) == 'robin'
        if self.dbsetflags != db.DB_DUP:
            d.put(key, '0000', dlen=2000, doff=0)
            assert d.get(key) == '0000'
            d.put(key, '1111', dlen=1, doff=2)
            assert d.get(key) == '0011110'

    def test05_GetSize(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test05_GetSize...' % self.__class__.__name__
        for i in range(1, 50000, 500):
            key = 'size%s' % i
            d.put(key, '1' * i)
            assert d.get_size(key) == i

    def test06_Truncate(self):
        if db.version() < (3, 3):
            return
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test99_Truncate...' % self.__class__.__name__
        d.put('abcde', 'ABCDE')
        num = d.truncate()
        assert num >= 1, 'truncate returned <= 0 on non-empty database'
        num = d.truncate()
        assert num == 0, 'truncate on empty DB returned nonzero (%r)' % (num,)


class BasicBTreeTestCase(BasicTestCase):
    dbtype = db.DB_BTREE


class BasicHashTestCase(BasicTestCase):
    dbtype = db.DB_HASH


class BasicBTreeWithThreadFlagTestCase(BasicTestCase):
    dbtype = db.DB_BTREE
    dbopenflags = db.DB_THREAD


class BasicHashWithThreadFlagTestCase(BasicTestCase):
    dbtype = db.DB_HASH
    dbopenflags = db.DB_THREAD


class BasicWithEnvTestCase(BasicTestCase):
    dbopenflags = db.DB_THREAD
    useEnv = 1
    envflags = db.DB_THREAD | db.DB_INIT_MPOOL | db.DB_INIT_LOCK

    def test07_EnvRemoveAndRename(self):
        if not self.env:
            return
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test07_EnvRemoveAndRename...' % self.__class__.__name__
        self.d.close()
        newname = self.filename + '.renamed'
        self.env.dbrename(self.filename, None, newname)
        self.env.dbremove(newname)
        return

    if db.version() < (4, 1):
        del test07_EnvRemoveAndRename


class BasicBTreeWithEnvTestCase(BasicWithEnvTestCase):
    dbtype = db.DB_BTREE


class BasicHashWithEnvTestCase(BasicWithEnvTestCase):
    dbtype = db.DB_HASH


class BasicTransactionTestCase(BasicTestCase):
    dbopenflags = db.DB_THREAD | db.DB_AUTO_COMMIT
    useEnv = 1
    envflags = db.DB_THREAD | db.DB_INIT_MPOOL | db.DB_INIT_LOCK | db.DB_INIT_TXN
    envsetflags = db.DB_AUTO_COMMIT

    def tearDown(self):
        self.txn.commit()
        BasicTestCase.tearDown(self)

    def populateDB(self):
        txn = self.env.txn_begin()
        BasicTestCase.populateDB(self, _txn=txn)
        self.txn = self.env.txn_begin()

    def test06_Transactions(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test06_Transactions...' % self.__class__.__name__
        assert d.get('new rec', txn=self.txn) == None
        d.put('new rec', 'this is a new record', self.txn)
        assert d.get('new rec', txn=self.txn) == 'this is a new record'
        self.txn.abort()
        assert d.get('new rec') == None
        self.txn = self.env.txn_begin()
        assert d.get('new rec', txn=self.txn) == None
        d.put('new rec', 'this is a new record', self.txn)
        assert d.get('new rec', txn=self.txn) == 'this is a new record'
        self.txn.commit()
        assert d.get('new rec') == 'this is a new record'
        self.txn = self.env.txn_begin()
        c = d.cursor(self.txn)
        rec = c.first()
        count = 0
        while rec is not None:
            count = count + 1
            if verbose and count % 100 == 0:
                print rec
            rec = c.next()

        assert count == self._numKeys + 1
        c.close()
        self.txn.commit()
        try:
            self.env.txn_checkpoint(0, 0, 0)
        except db.DBIncompleteError:
            pass

        if db.version() >= (4, 0):
            statDict = self.env.log_stat(0)
            assert statDict.has_key('magic')
            assert statDict.has_key('version')
            assert statDict.has_key('cur_file')
            assert statDict.has_key('region_nowait')
        logs = self.env.log_archive(db.DB_ARCH_ABS | db.DB_ARCH_LOG)
        assert logs != None
        for log in logs:
            if verbose:
                print 'log file: ' + log

        if db.version() >= (4, 2):
            logs = self.env.log_archive(db.DB_ARCH_REMOVE)
            assert not logs
        self.txn = self.env.txn_begin()
        return

    def test07_TxnTruncate(self):
        if db.version() < (3, 3):
            return
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test07_TxnTruncate...' % self.__class__.__name__
        d.put('abcde', 'ABCDE')
        txn = self.env.txn_begin()
        num = d.truncate(txn)
        assert num >= 1, 'truncate returned <= 0 on non-empty database'
        num = d.truncate(txn)
        assert num == 0, 'truncate on empty DB returned nonzero (%r)' % (num,)
        txn.commit()

    def test08_TxnLateUse(self):
        txn = self.env.txn_begin()
        txn.abort()
        try:
            txn.abort()
        except db.DBError, e:
            pass
        else:
            raise RuntimeError, 'DBTxn.abort() called after DB_TXN no longer valid w/o an exception'

        txn = self.env.txn_begin()
        txn.commit()
        try:
            txn.commit()
        except db.DBError, e:
            pass
        else:
            raise RuntimeError, 'DBTxn.commit() called after DB_TXN no longer valid w/o an exception'


class BTreeTransactionTestCase(BasicTransactionTestCase):
    dbtype = db.DB_BTREE


class HashTransactionTestCase(BasicTransactionTestCase):
    dbtype = db.DB_HASH


class BTreeRecnoTestCase(BasicTestCase):
    dbtype = db.DB_BTREE
    dbsetflags = db.DB_RECNUM

    def test07_RecnoInBTree(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test07_RecnoInBTree...' % self.__class__.__name__
        rec = d.get(200)
        assert type(rec) == type(())
        assert len(rec) == 2
        if verbose:
            print 'Record #200 is ', rec
        c = d.cursor()
        c.set('0200')
        num = c.get_recno()
        assert type(num) == type(1)
        if verbose:
            print "recno of d['0200'] is ", num
        rec = c.current()
        assert c.set_recno(num) == rec
        c.close()


class BTreeRecnoWithThreadFlagTestCase(BTreeRecnoTestCase):
    dbopenflags = db.DB_THREAD


class BasicDUPTestCase(BasicTestCase):
    dbsetflags = db.DB_DUP

    def test08_DuplicateKeys(self):
        d = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test08_DuplicateKeys...' % self.__class__.__name__
        d.put('dup0', 'before')
        for x in ('The quick brown fox jumped over the lazy dog.').split():
            d.put('dup1', x)

        d.put('dup2', 'after')
        data = d.get('dup1')
        assert data == 'The'
        if verbose:
            print data
        c = d.cursor()
        rec = c.set('dup1')
        assert rec == ('dup1', 'The')
        next = c.next()
        assert next == ('dup1', 'quick')
        rec = c.set('dup1')
        count = c.count()
        assert count == 9
        next_dup = c.next_dup()
        assert next_dup == ('dup1', 'quick')
        rec = c.set('dup1')
        while rec is not None:
            if verbose:
                print rec
            rec = c.next_dup()

        c.set('dup1')
        rec = c.next_nodup()
        assert rec[0] != 'dup1'
        if verbose:
            print rec
        c.close()
        return


class BTreeDUPTestCase(BasicDUPTestCase):
    dbtype = db.DB_BTREE


class HashDUPTestCase(BasicDUPTestCase):
    dbtype = db.DB_HASH


class BTreeDUPWithThreadTestCase(BasicDUPTestCase):
    dbtype = db.DB_BTREE
    dbopenflags = db.DB_THREAD


class HashDUPWithThreadTestCase(BasicDUPTestCase):
    dbtype = db.DB_HASH
    dbopenflags = db.DB_THREAD


class BasicMultiDBTestCase(BasicTestCase):
    dbname = 'first'

    def otherType(self):
        if self.dbtype == db.DB_BTREE:
            return db.DB_HASH
        else:
            return db.DB_BTREE

    def test09_MultiDB(self):
        d1 = self.d
        if verbose:
            print '\n', '-=' * 30
            print 'Running %s.test09_MultiDB...' % self.__class__.__name__
        d2 = db.DB(self.env)
        d2.open(self.filename, 'second', self.dbtype, self.dbopenflags | db.DB_CREATE)
        d3 = db.DB(self.env)
        d3.open(self.filename, 'third', self.otherType(), self.dbopenflags | db.DB_CREATE)
        for x in ('The quick brown fox jumped over the lazy dog').split():
            d2.put(x, self.makeData(x))

        for x in string.letters:
            d3.put(x, x * 70)

        d1.sync()
        d2.sync()
        d3.sync()
        d1.close()
        d2.close()
        d3.close()
        self.d = d1 = d2 = d3 = None
        self.d = d1 = db.DB(self.env)
        d1.open(self.filename, self.dbname, flags=self.dbopenflags)
        d2 = db.DB(self.env)
        d2.open(self.filename, 'second', flags=self.dbopenflags)
        d3 = db.DB(self.env)
        d3.open(self.filename, 'third', flags=self.dbopenflags)
        c1 = d1.cursor()
        c2 = d2.cursor()
        c3 = d3.cursor()
        count = 0
        rec = c1.first()
        while rec is not None:
            count = count + 1
            if verbose and count % 50 == 0:
                print rec
            rec = c1.next()

        assert count == self._numKeys
        count = 0
        rec = c2.first()
        while rec is not None:
            count = count + 1
            if verbose:
                print rec
            rec = c2.next()

        assert count == 9
        count = 0
        rec = c3.first()
        while rec is not None:
            count = count + 1
            if verbose:
                print rec
            rec = c3.next()

        assert count == 52
        c1.close()
        c2.close()
        c3.close()
        d2.close()
        d3.close()
        return


class BTreeMultiDBTestCase(BasicMultiDBTestCase):
    dbtype = db.DB_BTREE
    dbopenflags = db.DB_THREAD
    useEnv = 1
    envflags = db.DB_THREAD | db.DB_INIT_MPOOL | db.DB_INIT_LOCK


class HashMultiDBTestCase(BasicMultiDBTestCase):
    dbtype = db.DB_HASH
    dbopenflags = db.DB_THREAD
    useEnv = 1
    envflags = db.DB_THREAD | db.DB_INIT_MPOOL | db.DB_INIT_LOCK


def test_suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(VersionTestCase))
    suite.addTest(unittest.makeSuite(BasicBTreeTestCase))
    suite.addTest(unittest.makeSuite(BasicHashTestCase))
    suite.addTest(unittest.makeSuite(BasicBTreeWithThreadFlagTestCase))
    suite.addTest(unittest.makeSuite(BasicHashWithThreadFlagTestCase))
    suite.addTest(unittest.makeSuite(BasicBTreeWithEnvTestCase))
    suite.addTest(unittest.makeSuite(BasicHashWithEnvTestCase))
    suite.addTest(unittest.makeSuite(BTreeTransactionTestCase))
    suite.addTest(unittest.makeSuite(HashTransactionTestCase))
    suite.addTest(unittest.makeSuite(BTreeRecnoTestCase))
    suite.addTest(unittest.makeSuite(BTreeRecnoWithThreadFlagTestCase))
    suite.addTest(unittest.makeSuite(BTreeDUPTestCase))
    suite.addTest(unittest.makeSuite(HashDUPTestCase))
    suite.addTest(unittest.makeSuite(BTreeDUPWithThreadTestCase))
    suite.addTest(unittest.makeSuite(HashDUPWithThreadTestCase))
    suite.addTest(unittest.makeSuite(BTreeMultiDBTestCase))
    suite.addTest(unittest.makeSuite(HashMultiDBTestCase))
    return suite


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')