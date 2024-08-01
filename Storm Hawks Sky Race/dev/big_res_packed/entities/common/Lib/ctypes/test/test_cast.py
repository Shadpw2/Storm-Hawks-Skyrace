# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_cast.py
# Compiled at: 2008-12-16 09:38:01
from ctypes import *
import unittest, sys

class Test(unittest.TestCase):

    def test_array2pointer(self):
        array = (c_int * 3)(42, 17, 2)
        ptr = cast(array, POINTER(c_int))
        self.failUnlessEqual([ ptr[i] for i in range(3) ], [42, 17, 2])
        if 2 * sizeof(c_short) == sizeof(c_int):
            ptr = cast(array, POINTER(c_short))
            if sys.byteorder == 'little':
                self.failUnlessEqual([ ptr[i] for i in range(6) ], [
                 42, 0, 17, 0, 2, 0])
            else:
                self.failUnlessEqual([ ptr[i] for i in range(6) ], [
                 0, 42, 0, 17, 0, 2])

    def test_address2pointer(self):
        array = (c_int * 3)(42, 17, 2)
        address = addressof(array)
        ptr = cast(c_void_p(address), POINTER(c_int))
        self.failUnlessEqual([ ptr[i] for i in range(3) ], [42, 17, 2])
        ptr = cast(address, POINTER(c_int))
        self.failUnlessEqual([ ptr[i] for i in range(3) ], [42, 17, 2])

    def test_p2a_objects(self):
        array = (c_char_p * 5)()
        self.failUnlessEqual(array._objects, None)
        array[0] = 'foo bar'
        self.failUnlessEqual(array._objects, {'0': 'foo bar'})
        p = cast(array, POINTER(c_char_p))
        self.failUnless(p._objects is array._objects)
        self.failUnlessEqual(array._objects, {'0': 'foo bar', id(array): array})
        p[0] = 'spam spam'
        self.failUnlessEqual(p._objects, {'0': 'spam spam', id(array): array})
        self.failUnless(array._objects is p._objects)
        p[1] = 'foo bar'
        self.failUnlessEqual(p._objects, {'1': 'foo bar', '0': 'spam spam', id(array): array})
        self.failUnless(array._objects is p._objects)
        return

    def test_other(self):
        p = cast((c_int * 4)(1, 2, 3, 4), POINTER(c_int))
        self.failUnlessEqual(p[:4], [1, 2, 3, 4])
        c_int()
        self.failUnlessEqual(p[:4], [1, 2, 3, 4])
        p[2] = 96
        self.failUnlessEqual(p[:4], [1, 2, 96, 4])
        c_int()
        self.failUnlessEqual(p[:4], [1, 2, 96, 4])

    def test_char_p(self):
        s = c_char_p('hiho')
        self.failUnlessEqual(cast(cast(s, c_void_p), c_char_p).value, 'hiho')

    try:
        c_wchar_p
    except NameError:
        pass
    else:

        def test_wchar_p(self):
            s = c_wchar_p('hiho')
            self.failUnlessEqual(cast(cast(s, c_void_p), c_wchar_p).value, 'hiho')


if __name__ == '__main__':
    unittest.main()