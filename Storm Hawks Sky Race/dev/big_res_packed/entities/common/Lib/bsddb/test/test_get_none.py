# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_get_none.py
# Compiled at: 2008-12-16 09:37:57
"""
TestCases for checking set_get_returns_none.
"""
import sys, os, string, tempfile
from pprint import pprint
import unittest
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

from test_all import verbose

class GetReturnsNoneTestCase(unittest.TestCase):

    def setUp(self):
        self.filename = tempfile.mktemp()

    def tearDown(self):
        try:
            os.remove(self.filename)
        except os.error:
            pass

    def test01_get_returns_none(self):
        d = db.DB()
        d.open(self.filename, db.DB_BTREE, db.DB_CREATE)
        d.set_get_returns_none(1)
        for x in string.letters:
            d.put(x, x * 40)

        data = d.get('bad key')
        assert data == None
        data = d.get('a')
        assert data == 'a' * 40
        count = 0
        c = d.cursor()
        rec = c.first()
        while rec:
            count = count + 1
            rec = c.next()

        assert rec == None
        assert count == 52
        c.close()
        d.close()
        return

    def test02_get_raises_exception(self):
        d = db.DB()
        d.open(self.filename, db.DB_BTREE, db.DB_CREATE)
        d.set_get_returns_none(0)
        for x in string.letters:
            d.put(x, x * 40)

        self.assertRaises(db.DBNotFoundError, d.get, 'bad key')
        self.assertRaises(KeyError, d.get, 'bad key')
        data = d.get('a')
        assert data == 'a' * 40
        count = 0
        exceptionHappened = 0
        c = d.cursor()
        rec = c.first()
        while rec:
            count = count + 1
            try:
                rec = c.next()
            except db.DBNotFoundError:
                exceptionHappened = 1
                break

        assert rec != None
        assert exceptionHappened
        assert count == 52
        c.close()
        d.close()
        return


def test_suite():
    return unittest.makeSuite(GetReturnsNoneTestCase)


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')