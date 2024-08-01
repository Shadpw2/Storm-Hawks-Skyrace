# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/sqlite3/test/regression.py
# Compiled at: 2008-12-16 09:38:21
import unittest, sqlite3 as sqlite

class RegressionTests(unittest.TestCase):

    def setUp(self):
        self.con = sqlite.connect(':memory:')

    def tearDown(self):
        self.con.close()

    def CheckPragmaUserVersion(self):
        cur = self.con.cursor()
        cur.execute('pragma user_version')

    def CheckPragmaSchemaVersion(self):
        con = sqlite.connect(':memory:', detect_types=sqlite.PARSE_COLNAMES)
        try:
            cur = self.con.cursor()
            cur.execute('pragma schema_version')
        finally:
            cur.close()
            con.close()

    def CheckStatementReset(self):
        con = sqlite.connect(':memory:', cached_statements=5)
        cursors = [ con.cursor() for x in xrange(5) ]
        cursors[0].execute('create table test(x)')
        for i in range(10):
            cursors[0].executemany('insert into test(x) values (?)', [ (x,) for x in xrange(10) ])

        for i in range(5):
            cursors[i].execute(' ' * i + 'select x from test')

        con.rollback()

    def CheckColumnNameWithSpaces(self):
        cur = self.con.cursor()
        cur.execute('select 1 as "foo bar [datetime]"')
        self.failUnlessEqual(cur.description[0][0], 'foo bar')
        cur.execute('select 1 as "foo baz"')
        self.failUnlessEqual(cur.description[0][0], 'foo baz')


def suite():
    regression_suite = unittest.makeSuite(RegressionTests, 'Check')
    return unittest.TestSuite((regression_suite,))


def test():
    runner = unittest.TextTestRunner()
    runner.run(suite())


if __name__ == '__main__':
    test()