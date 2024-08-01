# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_stringptr.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *
import _ctypes_test
lib = CDLL(_ctypes_test.__file__)

class StringPtrTestCase(unittest.TestCase):

    def test__POINTER_c_char(self):

        class X(Structure):
            _fields_ = [
             (
              'str', POINTER(c_char))]

        x = X()
        self.assertRaises(ValueError, getattr, x.str, 'contents')
        b = c_buffer('Hello, World')
        from sys import getrefcount as grc
        self.failUnlessEqual(grc(b), 2)
        x.str = b
        self.failUnlessEqual(grc(b), 3)
        for i in range(len(b)):
            self.failUnlessEqual(b[i], x.str[i])

        self.assertRaises(TypeError, setattr, x, 'str', 'Hello, World')

    def test__c_char_p(self):

        class X(Structure):
            _fields_ = [
             (
              'str', c_char_p)]

        x = X()
        self.failUnlessEqual(x.str, None)
        x.str = 'Hello, World'
        self.failUnlessEqual(x.str, 'Hello, World')
        b = c_buffer('Hello, World')
        self.failUnlessRaises(TypeError, setattr, x, 'str', b)
        return

    def test_functions(self):
        strchr = lib.my_strchr
        strchr.restype = c_char_p
        strchr.argtypes = (
         c_char_p, c_char)
        self.failUnlessEqual(strchr('abcdef', 'c'), 'cdef')
        self.failUnlessEqual(strchr(c_buffer('abcdef'), 'c'), 'cdef')
        strchr.argtypes = (
         POINTER(c_char), c_char)
        buf = c_buffer('abcdef')
        self.failUnlessEqual(strchr(buf, 'c'), 'cdef')
        self.failUnlessEqual(strchr('abcdef', 'c'), 'cdef')
        strchr.restype = POINTER(c_char)
        buf = c_buffer('abcdef')
        r = strchr(buf, 'c')
        x = (r[0], r[1], r[2], r[3], r[4])
        self.failUnlessEqual(x, ('c', 'd', 'e', 'f', '\x00'))
        del buf
        x1 = (
         r[0], r[1], r[2], r[3], r[4])


if __name__ == '__main__':
    unittest.main()