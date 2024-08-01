# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_sizes.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *

class SizesTestCase(unittest.TestCase):

    def test_8(self):
        self.failUnlessEqual(1, sizeof(c_int8))
        self.failUnlessEqual(1, sizeof(c_uint8))

    def test_16(self):
        self.failUnlessEqual(2, sizeof(c_int16))
        self.failUnlessEqual(2, sizeof(c_uint16))

    def test_32(self):
        self.failUnlessEqual(4, sizeof(c_int32))
        self.failUnlessEqual(4, sizeof(c_uint32))

    def test_64(self):
        self.failUnlessEqual(8, sizeof(c_int64))
        self.failUnlessEqual(8, sizeof(c_uint64))

    def test_size_t(self):
        self.failUnlessEqual(sizeof(c_void_p), sizeof(c_size_t))


if __name__ == '__main__':
    unittest.main()