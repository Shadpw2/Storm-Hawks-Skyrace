# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/sqlite3/test/hooks.py
# Compiled at: 2008-12-16 09:38:21
import os, unittest, sqlite3 as sqlite

class CollationTests(unittest.TestCase):

    def setUp(self):
        pass

    def tearDown(self):
        pass

    def CheckCreateCollationNotCallable(self):
        con = sqlite.connect(':memory:')
        try:
            con.create_collation('X', 42)
            self.fail('should have raised a TypeError')
        except TypeError, e:
            self.failUnlessEqual(e.args[0], 'parameter must be callable')

    def CheckCreateCollationNotAscii(self):
        con = sqlite.connect(':memory:')
        try:
            con.create_collation('coll\xe4', cmp)
            self.fail('should have raised a ProgrammingError')
        except sqlite.ProgrammingError, e:
            pass

    def CheckCollationIsUsed(self):
        if sqlite.version_info < (3, 2, 1):
            return

        def mycoll(x, y):
            return -cmp(x, y)

        con = sqlite.connect(':memory:')
        con.create_collation('mycoll', mycoll)
        sql = "\n            select x from (\n            select 'a' as x\n            union\n            select 'b' as x\n            union\n            select 'c' as x\n            ) order by x collate mycoll\n            "
        result = con.execute(sql).fetchall()
        if result[0][0] != 'c' or result[1][0] != 'b' or result[2][0] != 'a':
            self.fail('the expected order was not returned')
        con.create_collation('mycoll', None)
        try:
            result = con.execute(sql).fetchall()
            self.fail('should have raised an OperationalError')
        except sqlite.OperationalError, e:
            self.failUnlessEqual(e.args[0].lower(), 'no such collation sequence: mycoll')

        return

    def CheckCollationRegisterTwice(self):
        """
        Register two different collation functions under the same name.
        Verify that the last one is actually used.
        """
        con = sqlite.connect(':memory:')
        con.create_collation('mycoll', cmp)
        con.create_collation('mycoll', (lambda x, y: -cmp(x, y)))
        result = con.execute("\n            select x from (select 'a' as x union select 'b' as x) order by x collate mycoll\n            ").fetchall()
        if result[0][0] != 'b' or result[1][0] != 'a':
            self.fail('wrong collation function is used')

    def CheckDeregisterCollation(self):
        """
        Register a collation, then deregister it. Make sure an error is raised if we try
        to use it.
        """
        con = sqlite.connect(':memory:')
        con.create_collation('mycoll', cmp)
        con.create_collation('mycoll', None)
        try:
            con.execute("select 'a' as x union select 'b' as x order by x collate mycoll")
            self.fail('should have raised an OperationalError')
        except sqlite.OperationalError, e:
            if not e.args[0].startswith('no such collation sequence'):
                self.fail('wrong OperationalError raised')

        return


def suite():
    collation_suite = unittest.makeSuite(CollationTests, 'Check')
    return unittest.TestSuite((collation_suite,))


def test():
    runner = unittest.TextTestRunner()
    runner.run(suite())


if __name__ == '__main__':
    test()