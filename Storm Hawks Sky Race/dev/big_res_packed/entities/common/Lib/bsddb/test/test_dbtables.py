# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_dbtables.py
# Compiled at: 2008-12-16 09:37:57
import sys, os, re, shutil, tempfile
try:
    import cPickle as pickle
except ImportError:
    import pickle

import unittest
from test_all import verbose
try:
    from bsddb3 import db, dbtables
except ImportError:
    from bsddb import db, dbtables

class TableDBTestCase(unittest.TestCase):

    def setUp(self):
        homeDir = tempfile.mkdtemp()
        self.testHomeDir = homeDir
        try:
            os.mkdir(homeDir)
        except os.error:
            pass

        self.tdb = dbtables.bsdTableDB(filename='tabletest.db', dbhome=homeDir, create=1)

    def tearDown(self):
        self.tdb.close()
        shutil.rmtree(self.testHomeDir)

    def test01(self):
        tabname = 'test01'
        colname = 'cool numbers'
        try:
            self.tdb.Drop(tabname)
        except dbtables.TableDBError:
            pass

        self.tdb.CreateTable(tabname, [colname])
        self.tdb.Insert(tabname, {colname: pickle.dumps(3.14159, 1)})
        if verbose:
            self.tdb._db_print()
        values = self.tdb.Select(tabname, [colname], conditions={colname: None})
        colval = pickle.loads(values[0][colname])
        assert colval > 3.141 and colval < 3.142
        return

    def test02(self):
        tabname = 'test02'
        col0 = 'coolness factor'
        col1 = 'but can it fly?'
        col2 = 'Species'
        testinfo = [{col0: pickle.dumps(8, 1), col1: 'no', col2: 'Penguin'}, {col0: pickle.dumps(-1, 1), col1: 'no', col2: 'Turkey'}, {col0: pickle.dumps(9, 1), col1: 'yes', col2: 'SR-71A Blackbird'}]
        try:
            self.tdb.Drop(tabname)
        except dbtables.TableDBError:
            pass

        self.tdb.CreateTable(tabname, [col0, col1, col2])
        for row in testinfo:
            self.tdb.Insert(tabname, row)

        values = self.tdb.Select(tabname, [col2], conditions={col0: lambda x: pickle.loads(x) >= 8})
        assert len(values) == 2
        if values[0]['Species'] == 'Penguin':
            assert values[1]['Species'] == 'SR-71A Blackbird'
        elif values[0]['Species'] == 'SR-71A Blackbird':
            assert values[1]['Species'] == 'Penguin'
        else:
            if verbose:
                print 'values= %r' % (values,)
            raise 'Wrong values returned!'

    def test03(self):
        tabname = 'test03'
        try:
            self.tdb.Drop(tabname)
        except dbtables.TableDBError:
            pass

        if verbose:
            print '...before CreateTable...'
            self.tdb._db_print()
        self.tdb.CreateTable(tabname, ['a', 'b', 'c', 'd', 'e'])
        if verbose:
            print '...after CreateTable...'
            self.tdb._db_print()
        self.tdb.Drop(tabname)
        if verbose:
            print '...after Drop...'
            self.tdb._db_print()
        self.tdb.CreateTable(tabname, ['a', 'b', 'c', 'd', 'e'])
        try:
            self.tdb.Insert(tabname, {'a': '', 'e': pickle.dumps([{4: 5, 6: 7}, 'foo'], 1), 
               'f': 'Zero'})
            assert 0
        except dbtables.TableDBError:
            pass

        try:
            self.tdb.Select(tabname, [], conditions={'foo': '123'})
            assert 0
        except dbtables.TableDBError:
            pass

        self.tdb.Insert(tabname, {'a': '42', 'b': 'bad', 
           'c': 'meep', 
           'e': 'Fuzzy wuzzy was a bear'})
        self.tdb.Insert(tabname, {'a': '581750', 'b': 'good', 
           'd': 'bla', 
           'c': 'black', 
           'e': 'fuzzy was here'})
        self.tdb.Insert(tabname, {'a': '800000', 'b': 'good', 
           'd': 'bla', 
           'c': 'black', 
           'e': 'Fuzzy wuzzy is a bear'})
        if verbose:
            self.tdb._db_print()
        values = self.tdb.Select(tabname, ['b', 'a', 'd'], conditions={'e': re.compile('wuzzy').search, 'a': re.compile('^[0-9]+$').match})
        assert len(values) == 2
        self.tdb.Delete(tabname, conditions={'b': dbtables.ExactCond('good')})
        values = self.tdb.Select(tabname, ['a', 'd', 'b'], conditions={'e': dbtables.PrefixCond('Fuzzy')})
        assert len(values) == 1
        assert values[0]['d'] == None
        values = self.tdb.Select(tabname, ['b'], conditions={'c': lambda c: c == 'meep'})
        assert len(values) == 1
        assert values[0]['b'] == 'bad'
        return

    def test04_MultiCondSelect(self):
        tabname = 'test04_MultiCondSelect'
        try:
            self.tdb.Drop(tabname)
        except dbtables.TableDBError:
            pass

        self.tdb.CreateTable(tabname, ['a', 'b', 'c', 'd', 'e'])
        try:
            self.tdb.Insert(tabname, {'a': '', 'e': pickle.dumps([{4: 5, 6: 7}, 'foo'], 1), 
               'f': 'Zero'})
            assert 0
        except dbtables.TableDBError:
            pass

        self.tdb.Insert(tabname, {'a': 'A', 'b': 'B', 'c': 'C', 'd': 'D', 'e': 'E'})
        self.tdb.Insert(tabname, {'a': '-A', 'b': '-B', 'c': '-C', 'd': '-D', 'e': '-E'})
        self.tdb.Insert(tabname, {'a': 'A-', 'b': 'B-', 'c': 'C-', 'd': 'D-', 'e': 'E-'})
        if verbose:
            self.tdb._db_print()
        values = self.tdb.Select(tabname, ['b', 'a', 'd'], conditions={'e': dbtables.ExactCond('E'), 'a': dbtables.ExactCond('A'), 
           'd': dbtables.PrefixCond('-')})
        assert len(values) == 0, values

    def test_CreateOrExtend(self):
        tabname = 'test_CreateOrExtend'
        self.tdb.CreateOrExtendTable(tabname, ['name', 'taste', 'filling', 'alcohol content', 'price'])
        try:
            self.tdb.Insert(tabname, {'taste': 'crap', 'filling': 'no', 
               'is it Guinness?': 'no'})
            assert 0, "Insert should've failed due to bad column name"
        except:
            pass

        self.tdb.CreateOrExtendTable(tabname, [
         'name', 'taste', 'is it Guinness?'])
        self.tdb.Insert(tabname, {'taste': 'crap', 'filling': 'no', 'is it Guinness?': 'no'})
        self.tdb.Insert(tabname, {'taste': 'great', 'filling': 'yes', 'is it Guinness?': 'yes', 
           'name': 'Guinness'})

    def test_CondObjs(self):
        tabname = 'test_CondObjs'
        self.tdb.CreateTable(tabname, ['a', 'b', 'c', 'd', 'e', 'p'])
        self.tdb.Insert(tabname, {'a': 'the letter A', 'b': 'the letter B', 
           'c': 'is for cookie'})
        self.tdb.Insert(tabname, {'a': 'is for aardvark', 'e': 'the letter E', 
           'c': 'is for cookie', 
           'd': 'is for dog'})
        self.tdb.Insert(tabname, {'a': 'the letter A', 'e': 'the letter E', 
           'c': 'is for cookie', 
           'p': 'is for Python'})
        values = self.tdb.Select(tabname, ['p', 'e'], conditions={'e': dbtables.PrefixCond('the l')})
        assert len(values) == 2, values
        assert values[0]['e'] == values[1]['e'], values
        assert values[0]['p'] != values[1]['p'], values
        values = self.tdb.Select(tabname, ['d', 'a'], conditions={'a': dbtables.LikeCond('%aardvark%')})
        assert len(values) == 1, values
        assert values[0]['d'] == 'is for dog', values
        assert values[0]['a'] == 'is for aardvark', values
        values = self.tdb.Select(tabname, None, {'b': dbtables.Cond(), 'e': dbtables.LikeCond('%letter%'), 
           'a': dbtables.PrefixCond('is'), 
           'd': dbtables.ExactCond('is for dog'), 
           'c': dbtables.PrefixCond('is for'), 
           'p': lambda s: not s})
        assert len(values) == 1, values
        assert values[0]['d'] == 'is for dog', values
        assert values[0]['a'] == 'is for aardvark', values
        return

    def test_Delete(self):
        tabname = 'test_Delete'
        self.tdb.CreateTable(tabname, ['x', 'y', 'z'])
        self.tdb.Insert(tabname, {'x': 'X1', 'y': 'Y1'})
        self.tdb.Insert(tabname, {'x': 'X2', 'y': 'Y2', 'z': 'Z2'})
        self.tdb.Delete(tabname, conditions={'x': dbtables.PrefixCond('X')})
        values = self.tdb.Select(tabname, ['y'], conditions={'x': dbtables.PrefixCond('X')})
        assert len(values) == 0

    def test_Modify(self):
        tabname = 'test_Modify'
        self.tdb.CreateTable(tabname, ['Name', 'Type', 'Access'])
        self.tdb.Insert(tabname, {'Name': 'Index to MP3 files.doc', 'Type': 'Word', 
           'Access': '8'})
        self.tdb.Insert(tabname, {'Name': 'Nifty.MP3', 'Access': '1'})
        self.tdb.Insert(tabname, {'Type': 'Unknown', 'Access': '0'})

        def set_type(type):
            if type == None:
                return 'MP3'
            return type

        def increment_access(count):
            return str(int(count) + 1)

        def remove_value(value):
            return

        self.tdb.Modify(tabname, conditions={'Access': dbtables.ExactCond('0')}, mappings={'Access': remove_value})
        self.tdb.Modify(tabname, conditions={'Name': dbtables.LikeCond('%MP3%')}, mappings={'Type': set_type})
        self.tdb.Modify(tabname, conditions={'Name': dbtables.LikeCond('%')}, mappings={'Access': increment_access})
        try:
            self.tdb.Modify(tabname, conditions={'Name': dbtables.LikeCond('%')}, mappings={'Access': 'What is your quest?'})
        except TypeError:
            pass
        else:
            raise RuntimeError, 'why was TypeError not raised for bad callable?'

        values = self.tdb.Select(tabname, None, conditions={'Type': dbtables.ExactCond('Unknown')})
        assert len(values) == 1, values
        assert values[0]['Name'] == None, values
        assert values[0]['Access'] == None, values
        values = self.tdb.Select(tabname, None, conditions={'Name': dbtables.ExactCond('Nifty.MP3')})
        assert len(values) == 1, values
        assert values[0]['Type'] == 'MP3', values
        assert values[0]['Access'] == '2', values
        values = self.tdb.Select(tabname, None, conditions={'Name': dbtables.LikeCond('%doc%')})
        assert len(values) == 1, values
        assert values[0]['Type'] == 'Word', values
        assert values[0]['Access'] == '9', values
        return


def test_suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(TableDBTestCase))
    return suite


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')