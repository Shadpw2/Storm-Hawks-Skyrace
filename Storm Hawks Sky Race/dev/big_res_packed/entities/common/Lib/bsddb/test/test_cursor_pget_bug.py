# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_cursor_pget_bug.py
# Compiled at: 2008-12-16 09:37:57
import unittest, sys, os, glob
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

class pget_bugTestCase(unittest.TestCase):
    """Verify that cursor.pget works properly"""
    db_name = 'test-cursor_pget.db'

    def setUp(self):
        self.homeDir = os.path.join(os.path.dirname(sys.argv[0]), 'db_home')
        try:
            os.mkdir(self.homeDir)
        except os.error:
            pass

        self.env = db.DBEnv()
        self.env.open(self.homeDir, db.DB_CREATE | db.DB_INIT_MPOOL)
        self.primary_db = db.DB(self.env)
        self.primary_db.open(self.db_name, 'primary', db.DB_BTREE, db.DB_CREATE)
        self.secondary_db = db.DB(self.env)
        self.secondary_db.set_flags(db.DB_DUP)
        self.secondary_db.open(self.db_name, 'secondary', db.DB_BTREE, db.DB_CREATE)
        self.primary_db.associate(self.secondary_db, (lambda key, data: data))
        self.primary_db.put('salad', 'eggs')
        self.primary_db.put('spam', 'ham')
        self.primary_db.put('omelet', 'eggs')

    def tearDown(self):
        self.secondary_db.close()
        self.primary_db.close()
        self.env.close()
        del self.secondary_db
        del self.primary_db
        del self.env
        for file in glob.glob(os.path.join(self.homeDir, '*')):
            os.remove(file)

        os.removedirs(self.homeDir)

    def test_pget(self):
        cursor = self.secondary_db.cursor()
        self.assertEquals(('eggs', 'salad', 'eggs'), cursor.pget(key='eggs', flags=db.DB_SET))
        self.assertEquals(('eggs', 'omelet', 'eggs'), cursor.pget(db.DB_NEXT_DUP))
        self.assertEquals(None, cursor.pget(db.DB_NEXT_DUP))
        self.assertEquals(('ham', 'spam', 'ham'), cursor.pget('ham', 'spam', flags=db.DB_SET))
        self.assertEquals(None, cursor.pget(db.DB_NEXT_DUP))
        cursor.close()
        return


def test_suite():
    return unittest.makeSuite(pget_bugTestCase)


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')