# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_buffers.py
# Compiled at: 2008-12-16 09:38:01
from ctypes import *
import unittest

class StringBufferTestCase(unittest.TestCase):

    def test_buffer(self):
        b = create_string_buffer(32)
        self.failUnlessEqual(len(b), 32)
        self.failUnlessEqual(sizeof(b), 32 * sizeof(c_char))
        self.failUnless(type(b[0]) is str)
        b = create_string_buffer('abc')
        self.failUnlessEqual(len(b), 4)
        self.failUnlessEqual(sizeof(b), 4 * sizeof(c_char))
        self.failUnless(type(b[0]) is str)
        self.failUnlessEqual(b[0], 'a')
        self.failUnlessEqual(b[:], 'abc\x00')

    def test_string_conversion(self):
        b = create_string_buffer(u'abc')
        self.failUnlessEqual(len(b), 4)
        self.failUnlessEqual(sizeof(b), 4 * sizeof(c_char))
        self.failUnless(type(b[0]) is str)
        self.failUnlessEqual(b[0], 'a')
        self.failUnlessEqual(b[:], 'abc\x00')

    try:
        c_wchar
    except NameError:
        pass
    else:

        def test_unicode_buffer(self):
            b = create_unicode_buffer(32)
            self.failUnlessEqual(len(b), 32)
            self.failUnlessEqual(sizeof(b), 32 * sizeof(c_wchar))
            self.failUnless(type(b[0]) is unicode)
            b = create_unicode_buffer(u'abc')
            self.failUnlessEqual(len(b), 4)
            self.failUnlessEqual(sizeof(b), 4 * sizeof(c_wchar))
            self.failUnless(type(b[0]) is unicode)
            self.failUnlessEqual(b[0], u'a')
            self.failUnlessEqual(b[:], 'abc\x00')

        def test_unicode_conversion(self):
            b = create_unicode_buffer('abc')
            self.failUnlessEqual(len(b), 4)
            self.failUnlessEqual(sizeof(b), 4 * sizeof(c_wchar))
            self.failUnless(type(b[0]) is unicode)
            self.failUnlessEqual(b[0], u'a')
            self.failUnlessEqual(b[:], 'abc\x00')


if __name__ == '__main__':
    unittest.main()