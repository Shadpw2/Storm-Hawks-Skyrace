# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_returnfuncptrs.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *
import _ctypes_test

class ReturnFuncPtrTestCase(unittest.TestCase):

    def test_with_prototype(self):
        dll = CDLL(_ctypes_test.__file__)
        get_strchr = dll.get_strchr
        get_strchr.restype = CFUNCTYPE(c_char_p, c_char_p, c_char)
        strchr = get_strchr()
        self.failUnlessEqual(strchr('abcdef', 'b'), 'bcdef')
        self.failUnlessEqual(strchr('abcdef', 'x'), None)
        self.assertRaises(ArgumentError, strchr, 'abcdef', 3)
        self.assertRaises(TypeError, strchr, 'abcdef')
        return

    def test_without_prototype(self):
        dll = CDLL(_ctypes_test.__file__)
        get_strchr = dll.get_strchr
        get_strchr.restype = c_void_p
        addr = get_strchr()
        strchr = CFUNCTYPE(c_char_p, c_char_p, c_char)(addr)
        self.failUnless(strchr('abcdef', 'b'), 'bcdef')
        self.failUnlessEqual(strchr('abcdef', 'x'), None)
        self.assertRaises(ArgumentError, strchr, 'abcdef', 3)
        self.assertRaises(TypeError, strchr, 'abcdef')
        return


if __name__ == '__main__':
    unittest.main()