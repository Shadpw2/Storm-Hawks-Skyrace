# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_numbers.py
# Compiled at: 2008-12-16 09:38:02
from ctypes import *
import unittest, sys, struct

def valid_ranges(*types):
    result = []
    for t in types:
        fmt = t._type_
        size = struct.calcsize(fmt)
        a = struct.unpack(fmt, ('\x00' * 32)[:size])[0]
        b = struct.unpack(fmt, ('\xff' * 32)[:size])[0]
        c = struct.unpack(fmt, ('\x7f' + '\x00' * 32)[:size])[0]
        d = struct.unpack(fmt, ('\x80' + '\xff' * 32)[:size])[0]
        result.append((min(a, b, c, d), max(a, b, c, d)))

    return result


ArgType = type(byref(c_int(0)))
unsigned_types = [
 c_ubyte, c_ushort, c_uint, c_ulong]
signed_types = [c_byte, c_short, c_int, c_long, c_longlong]
float_types = [
 c_double, c_float]
try:
    c_ulonglong
    c_longlong
except NameError:
    pass
else:
    unsigned_types.append(c_ulonglong)
    signed_types.append(c_longlong)

unsigned_ranges = valid_ranges(*unsigned_types)
signed_ranges = valid_ranges(*signed_types)

class NumberTestCase(unittest.TestCase):

    def test_default_init(self):
        for t in signed_types + unsigned_types + float_types:
            self.failUnlessEqual(t().value, 0)

    def test_unsigned_values(self):
        for (t, (l, h)) in zip(unsigned_types, unsigned_ranges):
            self.failUnlessEqual(t(l).value, l)
            self.failUnlessEqual(t(h).value, h)

    def test_signed_values(self):
        for (t, (l, h)) in zip(signed_types, signed_ranges):
            self.failUnlessEqual(t(l).value, l)
            self.failUnlessEqual(t(h).value, h)

    def test_typeerror(self):
        for t in signed_types + unsigned_types + float_types:
            self.assertRaises(TypeError, t, '')
            self.assertRaises(TypeError, t, None)

        return

    def test_from_param(self):
        for t in signed_types + unsigned_types + float_types:
            self.failUnlessEqual(ArgType, type(t.from_param(0)))

    def test_byref(self):
        for t in signed_types + unsigned_types + float_types:
            parm = byref(t())
            self.failUnlessEqual(ArgType, type(parm))

    def test_floats(self):

        class FloatLike(object):

            def __float__(self):
                return 2.0

        f = FloatLike()
        for t in float_types:
            self.failUnlessEqual(t(2.0).value, 2.0)
            self.failUnlessEqual(t(2).value, 2.0)
            self.failUnlessEqual(t(2L).value, 2.0)
            self.failUnlessEqual(t(f).value, 2.0)

    def test_integers(self):

        class FloatLike(object):

            def __float__(self):
                return 2.0

        f = FloatLike()

        class IntLike(object):

            def __int__(self):
                return 2

        i = IntLike()
        for t in signed_types + unsigned_types:
            self.assertRaises(TypeError, t, 3.14)
            self.assertRaises(TypeError, t, f)
            self.failUnlessEqual(t(i).value, 2)

    def test_sizes(self):
        for t in signed_types + unsigned_types + float_types:
            size = struct.calcsize(t._type_)
            self.failUnlessEqual(sizeof(t), size)
            self.failUnlessEqual(sizeof(t()), size)

    def test_alignments(self):
        for t in signed_types + unsigned_types + float_types:
            code = t._type_
            align = struct.calcsize('c%c' % code) - struct.calcsize(code)
            self.failUnlessEqual((code, alignment(t)), (
             code, align))
            self.failUnlessEqual((code, alignment(t())), (
             code, align))

    def test_int_from_address(self):
        from array import array
        for t in signed_types + unsigned_types:
            try:
                array(t._type_)
            except ValueError:
                continue

            a = array(t._type_, [100])
            v = t.from_address(a.buffer_info()[0])
            self.failUnlessEqual(v.value, a[0])
            self.failUnlessEqual(type(v), t)
            a[0] = 42
            self.failUnlessEqual(v.value, a[0])

    def test_float_from_address(self):
        from array import array
        for t in float_types:
            a = array(t._type_, [3.14])
            v = t.from_address(a.buffer_info()[0])
            self.failUnlessEqual(v.value, a[0])
            self.failUnless(type(v) is t)
            a[0] = 2.3456e+17
            self.failUnlessEqual(v.value, a[0])
            self.failUnless(type(v) is t)

    def test_char_from_address(self):
        from ctypes import c_char
        from array import array
        a = array('c', 'x')
        v = c_char.from_address(a.buffer_info()[0])
        self.failUnlessEqual(v.value, a[0])
        self.failUnless(type(v) is c_char)
        a[0] = '?'
        self.failUnlessEqual(v.value, a[0])

    def test_init(self):
        self.assertRaises(TypeError, c_int, c_long(42))


from ctypes import _SimpleCData

class c_int_S(_SimpleCData):
    _type_ = 'i'
    __slots__ = []


def run_test(rep, msg, func, arg=None):
    items = range(rep)
    from time import clock
    if arg is not None:
        start = clock()
        for i in items:
            func(arg)
            func(arg)
            func(arg)
            func(arg)
            func(arg)

        stop = clock()
    else:
        start = clock()
        for i in items:
            func()
            func()
            func()
            func()
            func()

        stop = clock()
    print '%15s: %.2f us' % (msg, (stop - start) * 1000000.0 / 5 / rep)
    return


def check_perf():
    from ctypes import c_int
    REP = 200000
    run_test(REP, 'int()', int)
    run_test(REP, 'int(999)', int)
    run_test(REP, 'c_int()', c_int)
    run_test(REP, 'c_int(999)', c_int)
    run_test(REP, 'c_int_S()', c_int_S)
    run_test(REP, 'c_int_S(999)', c_int_S)


if __name__ == '__main__':
    unittest.main()