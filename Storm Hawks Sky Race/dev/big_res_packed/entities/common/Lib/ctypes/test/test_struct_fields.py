# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_struct_fields.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *

class StructFieldsTestCase(unittest.TestCase):

    def test_1_A(self):

        class X(Structure):
            pass

        self.failUnlessEqual(sizeof(X), 0)
        X._fields_ = []
        self.assertRaises(AttributeError, setattr, X, '_fields_', [])

    def test_1_B(self):

        class X(Structure):
            _fields_ = []

        self.assertRaises(AttributeError, setattr, X, '_fields_', [])

    def test_2(self):

        class X(Structure):
            pass

        X()
        self.assertRaises(AttributeError, setattr, X, '_fields_', [])

    def test_3(self):

        class X(Structure):
            pass

        class Y(Structure):
            _fields_ = [
             (
              'x', X)]

        self.assertRaises(AttributeError, setattr, X, '_fields_', [])

    def test_4(self):

        class X(Structure):
            pass

        class Y(X):
            pass

        self.assertRaises(AttributeError, setattr, X, '_fields_', [])
        Y._fields_ = []
        self.assertRaises(AttributeError, setattr, X, '_fields_', [])


if __name__ == '__main__':
    unittest.main()