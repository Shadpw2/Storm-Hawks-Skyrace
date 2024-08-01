# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_slicing.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *
import _ctypes_test

class SlicesTestCase(unittest.TestCase):

    def test_getslice_cint(self):
        a = (c_int * 100)(*xrange(1100, 1200))
        b = range(1100, 1200)
        self.failUnlessEqual(a[0:2], b[0:2])
        self.failUnlessEqual(len(a), len(b))
        self.failUnlessEqual(a[5:7], b[5:7])
        self.failUnlessEqual(a[-1], b[-1])
        self.failUnlessEqual(a[:], b[:])
        a[0:5] = range(5, 10)
        self.failUnlessEqual(a[0:5], range(5, 10))

    def test_setslice_cint(self):
        a = (c_int * 100)(*xrange(1100, 1200))
        b = range(1100, 1200)
        a[32:47] = range(32, 47)
        self.failUnlessEqual(a[32:47], range(32, 47))
        from operator import setslice
        self.assertRaises(TypeError, setslice, a, 0, 5, 'abcde')
        self.assertRaises(TypeError, setslice, a, 0, 5, ['a', 'b', 'c', 'd', 'e'])
        self.assertRaises(TypeError, setslice, a, 0, 5, [1, 2, 3, 4, 3.14])
        self.assertRaises(ValueError, setslice, a, 0, 5, range(32))

    def test_char_ptr(self):
        s = 'abcdefghijklmnopqrstuvwxyz'
        dll = CDLL(_ctypes_test.__file__)
        dll.my_strdup.restype = POINTER(c_char)
        dll.my_free.restype = None
        res = dll.my_strdup(s)
        self.failUnlessEqual(res[:len(s)], s)
        import operator
        self.assertRaises(TypeError, operator.setslice, res, 0, 5, u'abcde')
        dll.my_free(res)
        dll.my_strdup.restype = POINTER(c_byte)
        res = dll.my_strdup(s)
        self.failUnlessEqual(res[:len(s)], range(ord('a'), ord('z') + 1))
        dll.my_free(res)
        return

    def test_char_ptr_with_free(self):
        dll = CDLL(_ctypes_test.__file__)
        s = 'abcdefghijklmnopqrstuvwxyz'

        class allocated_c_char_p(c_char_p):
            pass

        dll.my_free.restype = None

        def errcheck(result, func, args):
            retval = result.value
            dll.my_free(result)
            return retval

        dll.my_strdup.restype = allocated_c_char_p
        dll.my_strdup.errcheck = errcheck
        try:
            res = dll.my_strdup(s)
            self.failUnlessEqual(res, s)
        finally:
            del dll.my_strdup.errcheck

        return

    def test_char_array(self):
        s = 'abcdefghijklmnopqrstuvwxyz\x00'
        p = (c_char * 27)(*s)
        self.failUnlessEqual(p[:], s)

    try:
        c_wchar
    except NameError:
        pass
    else:

        def test_wchar_ptr(self):
            s = u'abcdefghijklmnopqrstuvwxyz\x00'
            dll = CDLL(_ctypes_test.__file__)
            dll.my_wcsdup.restype = POINTER(c_wchar)
            dll.my_wcsdup.argtypes = (POINTER(c_wchar),)
            dll.my_free.restype = None
            res = dll.my_wcsdup(s)
            self.failUnlessEqual(res[:len(s)], s)
            import operator
            self.assertRaises(TypeError, operator.setslice, res, 0, 5, u'abcde')
            dll.my_free(res)
            if sizeof(c_wchar) == sizeof(c_short):
                dll.my_wcsdup.restype = POINTER(c_short)
            elif sizeof(c_wchar) == sizeof(c_int):
                dll.my_wcsdup.restype = POINTER(c_int)
            elif sizeof(c_wchar) == sizeof(c_long):
                dll.my_wcsdup.restype = POINTER(c_long)
            else:
                return
            res = dll.my_wcsdup(s)
            self.failUnlessEqual(res[:len(s) - 1], range(ord('a'), ord('z') + 1))
            dll.my_free(res)
            return


if __name__ == '__main__':
    unittest.main()