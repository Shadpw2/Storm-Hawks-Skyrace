# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_env_close.py
# Compiled at: 2008-12-16 09:37:57
"""TestCases for checking that it does not segfault when a DBEnv object
is closed before its DB objects.
"""
import os, sys, tempfile, glob, unittest
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

from test_all import verbose
try:
    import warnings
except ImportError:
    pass
else:
    warnings.filterwarnings('ignore', message='DB could not be closed in', category=RuntimeWarning)

class DBEnvClosedEarlyCrash(unittest.TestCase):

    def setUp(self):
        self.homeDir = os.path.join(os.path.dirname(sys.argv[0]), 'db_home')
        try:
            os.mkdir(self.homeDir)
        except os.error:
            pass

        tempfile.tempdir = self.homeDir
        self.filename = os.path.split(tempfile.mktemp())[1]
        tempfile.tempdir = None
        return

    def tearDown(self):
        files = glob.glob(os.path.join(self.homeDir, '*'))
        for file in files:
            os.remove(file)

    def test01_close_dbenv_before_db(self):
        dbenv = db.DBEnv()
        dbenv.open(self.homeDir, db.DB_INIT_CDB | db.DB_CREATE | db.DB_THREAD | db.DB_INIT_MPOOL, 438)
        d = db.DB(dbenv)
        d.open(self.filename, db.DB_BTREE, db.DB_CREATE | db.DB_THREAD, 438)
        try:
            dbenv.close()
        except db.DBError:
            try:
                d.close()
            except db.DBError:
                return
            else:
                assert 0, 'DB close did not raise an exception about its DBEnv being trashed'

        assert 0, 'dbenv did not raise an exception about its DB being open'

    def test02_close_dbenv_delete_db_success(self):
        dbenv = db.DBEnv()
        dbenv.open(self.homeDir, db.DB_INIT_CDB | db.DB_CREATE | db.DB_THREAD | db.DB_INIT_MPOOL, 438)
        d = db.DB(dbenv)
        d.open(self.filename, db.DB_BTREE, db.DB_CREATE | db.DB_THREAD, 438)
        try:
            dbenv.close()
        except db.DBError:
            pass

        del d
        try:
            import gc
        except ImportError:
            gc = None

        if gc:
            gc.collect()
        return


def test_suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(DBEnvClosedEarlyCrash))
    return suite


if __name__ == '__main__':
    unittest.main(defaultTest='test_suite')