# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_delattr.py
# Compiled at: 2008-12-16 09:38:01
import unittest
from ctypes import *

class X(Structure):
    _fields_ = [
     (
      'foo', c_int)]


class TestCase(unittest.TestCase):

    def test_simple(self):
        self.assertRaises(TypeError, delattr, c_int(42), 'value')

    def test_chararray(self):
        self.assertRaises(TypeError, delattr, (c_char * 5)(), 'value')

    def test_struct(self):
        self.assertRaises(TypeError, delattr, X(), 'foo')


if __name__ == '__main__':
    unittest.main()