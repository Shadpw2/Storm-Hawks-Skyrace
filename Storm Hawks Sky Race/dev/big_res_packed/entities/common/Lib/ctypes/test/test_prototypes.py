# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_prototypes.py
# Compiled at: 2008-12-16 09:38:02
from ctypes import *
import unittest, _ctypes_test
testdll = CDLL(_ctypes_test.__file__)

def positive_address(a):
    if a >= 0:
        return a
    import struct
    num_bits = struct.calcsize('P') * 8
    a += 1L << num_bits
    assert a >= 0
    return a


def c_wbuffer(init):
    n = len(init) + 1
    return (c_wchar * n)(*init)


class CharPointersTestCase(unittest.TestCase):

    def setUp(self):
        func = testdll._testfunc_p_p
        func.restype = c_long
        func.argtypes = None
        return

    def test_int_pointer_arg(self):
        func = testdll._testfunc_p_p
        func.restype = c_long
        self.failUnlessEqual(0, func(0))
        ci = c_int(0)
        func.argtypes = (
         POINTER(c_int),)
        self.failUnlessEqual(positive_address(addressof(ci)), positive_address(func(byref(ci))))
        func.argtypes = (
         c_char_p,)
        self.assertRaises(ArgumentError, func, byref(ci))
        func.argtypes = (
         POINTER(c_short),)
        self.assertRaises(ArgumentError, func, byref(ci))
        func.argtypes = (
         POINTER(c_double),)
        self.assertRaises(ArgumentError, func, byref(ci))

    def test_POINTER_c_char_arg(self):
        func = testdll._testfunc_p_p
        func.restype = c_char_p
        func.argtypes = (POINTER(c_char),)
        self.failUnlessEqual(None, func(None))
        self.failUnlessEqual('123', func('123'))
        self.failUnlessEqual(None, func(c_char_p(None)))
        self.failUnlessEqual('123', func(c_char_p('123')))
        self.failUnlessEqual('123', func(c_buffer('123')))
        ca = c_char('a')
        self.failUnlessEqual('a', func(pointer(ca))[0])
        self.failUnlessEqual('a', func(byref(ca))[0])
        return

    def test_c_char_p_arg(self):
        func = testdll._testfunc_p_p
        func.restype = c_char_p
        func.argtypes = (c_char_p,)
        self.failUnlessEqual(None, func(None))
        self.failUnlessEqual('123', func('123'))
        self.failUnlessEqual(None, func(c_char_p(None)))
        self.failUnlessEqual('123', func(c_char_p('123')))
        self.failUnlessEqual('123', func(c_buffer('123')))
        ca = c_char('a')
        self.failUnlessEqual('a', func(pointer(ca))[0])
        self.failUnlessEqual('a', func(byref(ca))[0])
        return

    def test_c_void_p_arg(self):
        func = testdll._testfunc_p_p
        func.restype = c_char_p
        func.argtypes = (c_void_p,)
        self.failUnlessEqual(None, func(None))
        self.failUnlessEqual('123', func('123'))
        self.failUnlessEqual('123', func(c_char_p('123')))
        self.failUnlessEqual(None, func(c_char_p(None)))
        self.failUnlessEqual('123', func(c_buffer('123')))
        ca = c_char('a')
        self.failUnlessEqual('a', func(pointer(ca))[0])
        self.failUnlessEqual('a', func(byref(ca))[0])
        func(byref(c_int()))
        func(pointer(c_int()))
        func((c_int * 3)())
        try:
            func.restype = c_wchar_p
        except NameError:
            pass
        else:
            self.failUnlessEqual(None, func(c_wchar_p(None)))
            self.failUnlessEqual(u'123', func(c_wchar_p(u'123')))

        return

    def test_instance(self):
        func = testdll._testfunc_p_p
        func.restype = c_void_p

        class X:
            _as_parameter_ = None

        func.argtypes = (
         c_void_p,)
        self.failUnlessEqual(None, func(X()))
        func.argtypes = None
        self.failUnlessEqual(None, func(X()))
        return


try:
    c_wchar
except NameError:
    pass
else:

    class WCharPointersTestCase(unittest.TestCase):

        def setUp(self):
            func = testdll._testfunc_p_p
            func.restype = c_int
            func.argtypes = None
            return

        def test_POINTER_c_wchar_arg(self):
            func = testdll._testfunc_p_p
            func.restype = c_wchar_p
            func.argtypes = (POINTER(c_wchar),)
            self.failUnlessEqual(None, func(None))
            self.failUnlessEqual(u'123', func(u'123'))
            self.failUnlessEqual(None, func(c_wchar_p(None)))
            self.failUnlessEqual(u'123', func(c_wchar_p(u'123')))
            self.failUnlessEqual(u'123', func(c_wbuffer(u'123')))
            ca = c_wchar('a')
            self.failUnlessEqual(u'a', func(pointer(ca))[0])
            self.failUnlessEqual(u'a', func(byref(ca))[0])
            return

        def test_c_wchar_p_arg(self):
            func = testdll._testfunc_p_p
            func.restype = c_wchar_p
            func.argtypes = (c_wchar_p,)
            c_wchar_p.from_param(u'123')
            self.failUnlessEqual(None, func(None))
            self.failUnlessEqual('123', func(u'123'))
            self.failUnlessEqual(None, func(c_wchar_p(None)))
            self.failUnlessEqual('123', func(c_wchar_p('123')))
            self.failUnlessEqual('123', func(c_wbuffer('123')))
            ca = c_wchar('a')
            self.failUnlessEqual('a', func(pointer(ca))[0])
            self.failUnlessEqual('a', func(byref(ca))[0])
            return


class ArrayTest(unittest.TestCase):

    def test(self):
        func = testdll._testfunc_ai8
        func.restype = POINTER(c_int)
        func.argtypes = (c_int * 8,)
        func((c_int * 8)(1, 2, 3, 4, 5, 6, 7, 8))

        def func():
            pass

        CFUNCTYPE(None, c_int * 3)(func)
        return


if __name__ == '__main__':
    unittest.main()