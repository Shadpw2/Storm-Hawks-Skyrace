# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/sqlite3/test/types.py
# Compiled at: 2008-12-16 09:38:22
import bz2, datetime, unittest, sqlite3 as sqlite

class SqliteTypeTests(unittest.TestCase):

    def setUp(self):
        self.con = sqlite.connect(':memory:')
        self.cur = self.con.cursor()
        self.cur.execute('create table test(i integer, s varchar, f number, b blob)')

    def tearDown(self):
        self.cur.close()
        self.con.close()

    def CheckString(self):
        self.cur.execute('insert into test(s) values (?)', (u'\xd6sterreich', ))
        self.cur.execute('select s from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], u'\xd6sterreich')

    def CheckSmallInt(self):
        self.cur.execute('insert into test(i) values (?)', (42, ))
        self.cur.execute('select i from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], 42)

    def CheckLargeInt(self):
        num = 1099511627776L
        self.cur.execute('insert into test(i) values (?)', (num,))
        self.cur.execute('select i from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], num)

    def CheckFloat(self):
        val = 3.14
        self.cur.execute('insert into test(f) values (?)', (val,))
        self.cur.execute('select f from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], val)

    def CheckBlob(self):
        val = buffer('Guglhupf')
        self.cur.execute('insert into test(b) values (?)', (val,))
        self.cur.execute('select b from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], val)

    def CheckUnicodeExecute(self):
        self.cur.execute(u"select '\xd6sterreich'")
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], u'\xd6sterreich')


class DeclTypesTests(unittest.TestCase):

    class Foo:

        def __init__(self, _val):
            self.val = _val

        def __cmp__(self, other):
            if not isinstance(other, DeclTypesTests.Foo):
                raise ValueError
            if self.val == other.val:
                return 0
            else:
                return 1

        def __conform__(self, protocol):
            if protocol is sqlite.PrepareProtocol:
                return self.val
            else:
                return
            return

        def __str__(self):
            return '<%s>' % self.val

    def setUp(self):
        self.con = sqlite.connect(':memory:', detect_types=sqlite.PARSE_DECLTYPES)
        self.cur = self.con.cursor()
        self.cur.execute('create table test(i int, s str, f float, b bool, u unicode, foo foo, bin blob)')
        sqlite.converters['FLOAT'] = lambda x: 47.2
        sqlite.converters['BOOL'] = lambda x: bool(int(x))
        sqlite.converters['FOO'] = DeclTypesTests.Foo

    def tearDown(self):
        del sqlite.converters['FLOAT']
        del sqlite.converters['BOOL']
        del sqlite.converters['FOO']
        self.cur.close()
        self.con.close()

    def CheckString(self):
        self.cur.execute('insert into test(s) values (?)', ('foo', ))
        self.cur.execute('select s from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], 'foo')

    def CheckSmallInt(self):
        self.cur.execute('insert into test(i) values (?)', (42, ))
        self.cur.execute('select i from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], 42)

    def CheckLargeInt(self):
        num = 1099511627776L
        self.cur.execute('insert into test(i) values (?)', (num,))
        self.cur.execute('select i from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], num)

    def CheckFloat(self):
        val = 3.14
        self.cur.execute('insert into test(f) values (?)', (val,))
        self.cur.execute('select f from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], 47.2)

    def CheckBool(self):
        self.cur.execute('insert into test(b) values (?)', (False,))
        self.cur.execute('select b from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], False)
        self.cur.execute('delete from test')
        self.cur.execute('insert into test(b) values (?)', (True,))
        self.cur.execute('select b from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], True)

    def CheckUnicode(self):
        val = u'\xd6sterreich'
        self.cur.execute('insert into test(u) values (?)', (val,))
        self.cur.execute('select u from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], val)

    def CheckFoo(self):
        val = DeclTypesTests.Foo('bla')
        self.cur.execute('insert into test(foo) values (?)', (val,))
        self.cur.execute('select foo from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], val)

    def CheckUnsupportedSeq(self):

        class Bar:
            pass

        val = Bar()
        try:
            self.cur.execute('insert into test(f) values (?)', (val,))
            self.fail('should have raised an InterfaceError')
        except sqlite.InterfaceError:
            pass
        except:
            self.fail('should have raised an InterfaceError')

    def CheckUnsupportedDict(self):

        class Bar:
            pass

        val = Bar()
        try:
            self.cur.execute('insert into test(f) values (:val)', {'val': val})
            self.fail('should have raised an InterfaceError')
        except sqlite.InterfaceError:
            pass
        except:
            self.fail('should have raised an InterfaceError')

    def CheckBlob(self):
        val = buffer('Guglhupf')
        self.cur.execute('insert into test(bin) values (?)', (val,))
        self.cur.execute('select bin from test')
        row = self.cur.fetchone()
        self.failUnlessEqual(row[0], val)


class ColNamesTests(unittest.TestCase):

    def setUp(self):
        self.con = sqlite.connect(':memory:', detect_types=sqlite.PARSE_COLNAMES | sqlite.PARSE_DECLTYPES)
        self.cur = self.con.cursor()
        self.cur.execute('create table test(x foo)')
        sqlite.converters['FOO'] = lambda x: '[%s]' % x
        sqlite.converters['BAR'] = lambda x: '<%s>' % x
        sqlite.converters['EXC'] = lambda x: 5 / 0

    def tearDown(self):
        del sqlite.converters['FOO']
        del sqlite.converters['BAR']
        del sqlite.converters['EXC']
        self.cur.close()
        self.con.close()

    def CheckDeclType(self):
        self.cur.execute('insert into test(x) values (?)', ('xxx', ))
        self.cur.execute('select x from test')
        val = self.cur.fetchone()[0]
        self.failUnlessEqual(val, '[xxx]')

    def CheckNone(self):
        self.cur.execute('insert into test(x) values (?)', (None, ))
        self.cur.execute('select x from test')
        val = self.cur.fetchone()[0]
        self.failUnlessEqual(val, None)
        return

    def CheckColName(self):
        self.cur.execute('insert into test(x) values (?)', ('xxx', ))
        self.cur.execute('select x as "x [bar]" from test')
        val = self.cur.fetchone()[0]
        self.failUnlessEqual(val, '<xxx>')
        self.failUnlessEqual(self.cur.description[0][0], 'x')

    def CheckCursorDescriptionNoRow(self):
        """
        cursor.description should at least provide the column name(s), even if
        no row returned.
        """
        self.cur.execute('select * from test where 0 = 1')
        self.assert_(self.cur.description[0][0] == 'x')


class ObjectAdaptationTests(unittest.TestCase):

    def cast(obj):
        return float(obj)

    cast = staticmethod(cast)

    def setUp(self):
        self.con = sqlite.connect(':memory:')
        try:
            del sqlite.adapters[int]
        except:
            pass

        sqlite.register_adapter(int, ObjectAdaptationTests.cast)
        self.cur = self.con.cursor()

    def tearDown(self):
        del sqlite.adapters[(int, sqlite.PrepareProtocol)]
        self.cur.close()
        self.con.close()

    def CheckCasterIsUsed(self):
        self.cur.execute('select ?', (4, ))
        val = self.cur.fetchone()[0]
        self.failUnlessEqual(type(val), float)


class BinaryConverterTests(unittest.TestCase):

    def convert(s):
        return bz2.decompress(s)

    convert = staticmethod(convert)

    def setUp(self):
        self.con = sqlite.connect(':memory:', detect_types=sqlite.PARSE_COLNAMES)
        sqlite.register_converter('bin', BinaryConverterTests.convert)

    def tearDown(self):
        self.con.close()

    def CheckBinaryInputForConverter(self):
        testdata = 'abcdefg' * 10
        result = self.con.execute('select ? as "x [bin]"', (buffer(bz2.compress(testdata)),)).fetchone()[0]
        self.failUnlessEqual(testdata, result)


class DateTimeTests(unittest.TestCase):

    def setUp(self):
        self.con = sqlite.connect(':memory:', detect_types=sqlite.PARSE_DECLTYPES)
        self.cur = self.con.cursor()
        self.cur.execute('create table test(d date, ts timestamp)')

    def tearDown(self):
        self.cur.close()
        self.con.close()

    def CheckSqliteDate(self):
        d = sqlite.Date(2004, 2, 14)
        self.cur.execute('insert into test(d) values (?)', (d,))
        self.cur.execute('select d from test')
        d2 = self.cur.fetchone()[0]
        self.failUnlessEqual(d, d2)

    def CheckSqliteTimestamp(self):
        ts = sqlite.Timestamp(2004, 2, 14, 7, 15, 0)
        self.cur.execute('insert into test(ts) values (?)', (ts,))
        self.cur.execute('select ts from test')
        ts2 = self.cur.fetchone()[0]
        self.failUnlessEqual(ts, ts2)

    def CheckSqlTimestamp(self):
        if sqlite.sqlite_version_info < (3, 1):
            return
        now = datetime.datetime.now()
        self.cur.execute('insert into test(ts) values (current_timestamp)')
        self.cur.execute('select ts from test')
        ts = self.cur.fetchone()[0]
        self.failUnlessEqual(type(ts), datetime.datetime)
        self.failUnlessEqual(ts.year, now.year)

    def CheckDateTimeSubSeconds(self):
        ts = sqlite.Timestamp(2004, 2, 14, 7, 15, 0, 500000)
        self.cur.execute('insert into test(ts) values (?)', (ts,))
        self.cur.execute('select ts from test')
        ts2 = self.cur.fetchone()[0]
        self.failUnlessEqual(ts, ts2)


def suite():
    sqlite_type_suite = unittest.makeSuite(SqliteTypeTests, 'Check')
    decltypes_type_suite = unittest.makeSuite(DeclTypesTests, 'Check')
    colnames_type_suite = unittest.makeSuite(ColNamesTests, 'Check')
    adaptation_suite = unittest.makeSuite(ObjectAdaptationTests, 'Check')
    bin_suite = unittest.makeSuite(BinaryConverterTests, 'Check')
    date_suite = unittest.makeSuite(DateTimeTests, 'Check')
    return unittest.TestSuite((sqlite_type_suite, decltypes_type_suite, colnames_type_suite, adaptation_suite, bin_suite, date_suite))


def test():
    runner = unittest.TextTestRunner()
    runner.run(suite())


if __name__ == '__main__':
    test()