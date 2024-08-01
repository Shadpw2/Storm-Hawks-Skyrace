# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_dbobj.py
# Compiled at: 2008-12-16 09:37:57
import sys, os, string, unittest, glob
try:
    from bsddb3 import db, dbobj
except ImportError:
    from bsddb import db, dbobj

class dbobjTestCase(unittest.TestCase):
    """Verify that dbobj.DB and dbobj.DBEnv work properly"""
    db_home = 'db_home'
    db_name = 'test-dbobj.db'

    def setUp(self):
        homeDir = os.path.join(os.path.dirname(sys.argv[0]), 'db_home')
        self.homeDir = homeDir
        try:
            os.mkdir(homeDir)
        except os.error:
            pass

    def tearDown(self):
        if hasattr(self, 'db'):
            del self.db
        if hasattr(self, 'env'):
            del self.env
        files = glob.glob(os.path.join(self.homeDir, '*'))
        for file in files:
            os.remove(file)

    def test01_both(self):

        class TestDBEnv(dbobj.DBEnv):
            pass

        class TestDB(dbobj.DB):

            def put(self, key, *args, **kwargs):
                key = string.upper(key)
                return apply(dbobj.DB.put, (self, key) + args, kwargs)

        self.env = TestDBEnv()
        self.env.open(self.homeDir, db.DB_CREATE | db.DB_INIT_MPOOL)
        self.db = TestDB(self.env)
        self.db.open(self.db_name, db.DB_HASH, db.DB_CREATE)
        self.db.put('spam', 'eggs')
        assert self.db.get('spam') == None, 'overridden dbobj.DB.put() method failed [1]'
        assert self.db.get('SPAM') == 'eggs', 'overridden dbobj.DB.put() method failed [2]'
        self.db.close()
        self.env.close()
        return

    def test02_dbobj_dict_interface(self):
        self.env = dbobj.DBEnv()
        self.env.open(self.homeDir, db.DB_CREATE | db.DB_INIT_MPOOL)
        self.db = dbobj.DB(self.env)
        self.db.open(self.db_name + '02', db.DB_HASH, db.DB_CREATE)
        self.db['spam'] = 'eggs'
        assert len(self.db) == 1
        assert self.db['spam'] == 'eggs'
        del self.db['spam']
        assert self.db.get('spam') == None, 'dbobj __del__ failed'
        self.db.close()
        self.env.close()
        return

    def test03_dbobj_type_before_open(self):
        self.assertRaises(db.DBInvalidArgError, db.DB().type)


def test_suite():
    return unittest.makeSuite(dbobjTestCase)


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')