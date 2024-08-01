# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_all.py
# Compiled at: 2008-12-16 09:37:56
"""Run all test cases.
"""
import sys, os, unittest
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

verbose = 0
if 'verbose' in sys.argv:
    verbose = 1
    sys.argv.remove('verbose')
if 'silent' in sys.argv:
    verbose = 0
    sys.argv.remove('silent')

def print_versions():
    print
    print '-=' * 38
    print db.DB_VERSION_STRING
    print 'bsddb.db.version():   %s' % (db.version(),)
    print 'bsddb.db.__version__: %s' % db.__version__
    print 'bsddb.db.cvsid:       %s' % db.cvsid
    print 'python version:       %s' % sys.version
    print 'My pid:               %s' % os.getpid()
    print '-=' * 38


class PrintInfoFakeTest(unittest.TestCase):

    def testPrintVersions(self):
        print_versions()


import test_all
test_all.verbose = verbose

def suite():
    try:
        import test_1413192
    except:
        pass

    test_modules = [
     'test_associate', 
     'test_basics', 
     'test_compat', 
     'test_compare', 
     'test_dbobj', 
     'test_dbshelve', 
     'test_dbtables', 
     'test_env_close', 
     'test_get_none', 
     'test_join', 
     'test_lock', 
     'test_misc', 
     'test_pickle', 
     'test_queue', 
     'test_recno', 
     'test_thread', 
     'test_sequence', 
     'test_cursor_pget_bug']
    alltests = unittest.TestSuite()
    for name in test_modules:
        module = __import__(name)
        alltests.addTest(module.test_suite())

    return alltests


def test_suite():
    suite = unittest.TestSuite()
    suite.addTest(unittest.makeSuite(PrintInfoFakeTest))
    return suite


if __name__ == '__main__':
    print_versions()
    unittest.main(defaultTest='suite')