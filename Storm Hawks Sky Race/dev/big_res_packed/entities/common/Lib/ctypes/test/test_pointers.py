# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_pointers.py
# Compiled at: 2008-12-16 09:38:02
import unittest
from ctypes import *
import _ctypes_test
ctype_types = [
 c_byte, c_ubyte, c_short, c_ushort, c_int, c_uint, 
 c_long, c_ulong, 
 c_longlong, c_ulonglong, c_double, c_float]
python_types = [int, int, int, int, int, long, 
 int, long, long, long, float, float]

class PointersTestCase(unittest.TestCase):

    def test_pointer_crash(self):

        class A(POINTER(c_ulong)):
            pass

        POINTER(c_ulong)(c_ulong(22))
        self.failUnlessRaises(TypeError, A, c_ulong(33))

    def test_pass_pointers(self):
        dll = CDLL(_ctypes_test.__file__)
        func = dll._testfunc_p_p
        func.restype = c_long
        i = c_int(12345678)
        address = func(byref(i))
        self.failUnlessEqual(c_int.from_address(address).value, 12345678)
        func.restype = POINTER(c_int)
        res = func(pointer(i))
        self.failUnlessEqual(res.contents.value, 12345678)
        self.failUnlessEqual(res[0], 12345678)

    def test_change_pointers(self):
        dll = CDLL(_ctypes_test.__file__)
        func = dll._testfunc_p_p
        i = c_int(87654)
        func.restype = POINTER(c_int)
        func.argtypes = (POINTER(c_int),)
        res = func(pointer(i))
        self.failUnlessEqual(res[0], 87654)
        self.failUnlessEqual(res.contents.value, 87654)
        res[0] = 54345
        self.failUnlessEqual(i.value, 54345)
        res.contents = c_int(12321)
        self.failUnlessEqual(i.value, 54345)

    def test_callbacks_with_pointers(self):
        PROTOTYPE = CFUNCTYPE(c_int, POINTER(c_int))
        self.result = []

        def func(arg):
            for i in range(10):
                self.result.append(arg[i])

            return 0

        callback = PROTOTYPE(func)
        dll = CDLL(_ctypes_test.__file__)
        doit = dll._testfunc_callback_with_pointer
        doit(callback)
        doit(callback)

    def test_basics(self):
        from operator import delitem
        for (ct, pt) in zip(ctype_types, python_types):
            i = ct(42)
            p = pointer(i)
            self.failUnless(type(p.contents) is ct)
            self.assertRaises(TypeError, delitem, p, 0)

    def test_from_address(self):
        from array import array
        a = array('i', [100, 200, 300, 400, 500])
        addr = a.buffer_info()[0]
        p = POINTER(POINTER(c_int))

    def test_other(self):

        class Table(Structure):
            _fields_ = [
             (
              'a', c_int),
             (
              'b', c_int),
             (
              'c', c_int)]

        pt = pointer(Table(1, 2, 3))
        self.failUnlessEqual(pt.contents.a, 1)
        self.failUnlessEqual(pt.contents.b, 2)
        self.failUnlessEqual(pt.contents.c, 3)
        pt.contents.c = 33
        from ctypes import _pointer_type_cache
        del _pointer_type_cache[Table]

    def test_basic(self):
        p = pointer(c_int(42))
        self.assertRaises(TypeError, len, p)
        self.failUnlessEqual(p[0], 42)
        self.failUnlessEqual(p.contents.value, 42)

    def test_charpp(self):
        """Test that a character pointer-to-pointer is correctly passed"""
        dll = CDLL(_ctypes_test.__file__)
        func = dll._testfunc_c_p_p
        func.restype = c_char_p
        argv = (c_char_p * 2)()
        argc = c_int(2)
        argv[0] = 'hello'
        argv[1] = 'world'
        result = func(byref(argc), argv)
        assert result == 'world', result

    def test_bug_1467852(self):
        x = c_int(5)
        dummy = []
        for i in range(32000):
            dummy.append(c_int(i))

        y = c_int(6)
        p = pointer(x)
        pp = pointer(p)
        q = pointer(y)
        pp[0] = q
        self.failUnlessEqual(p[0], 6)

    def test_c_void_p(self):
        if sizeof(c_void_p) == 4:
            self.failUnlessEqual(c_void_p(4294967295L).value, c_void_p(-1).value)
            self.failUnlessEqual(c_void_p(18446744073709551615L).value, c_void_p(-1).value)
        elif sizeof(c_void_p) == 8:
            self.failUnlessEqual(c_void_p(4294967295L).value, 4294967295L)
            self.failUnlessEqual(c_void_p(18446744073709551615L).value, c_void_p(-1).value)
            self.failUnlessEqual(c_void_p(79228162514264337593543950335L).value, c_void_p(-1).value)
        self.assertRaises(TypeError, c_void_p, 3.14)
        self.assertRaises(TypeError, c_void_p, object())


if __name__ == '__main__':
    unittest.main()