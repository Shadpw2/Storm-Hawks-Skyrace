# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_unicode.py
# Compiled at: 2008-12-16 09:38:03
import unittest, ctypes
try:
    ctypes.c_wchar
except AttributeError:
    pass
else:
    import _ctypes_test
    dll = ctypes.CDLL(_ctypes_test.__file__)
    wcslen = dll.my_wcslen
    wcslen.argtypes = [ctypes.c_wchar_p]

    class UnicodeTestCase(unittest.TestCase):

        def setUp(self):
            self.prev_conv_mode = ctypes.set_conversion_mode('ascii', 'strict')

        def tearDown(self):
            ctypes.set_conversion_mode(*self.prev_conv_mode)

        def test_ascii_strict(self):
            ctypes.set_conversion_mode('ascii', 'strict')
            self.failUnlessEqual(wcslen(u'abc'), 3)
            self.failUnlessEqual(wcslen(u'ab\u2070'), 3)
            self.failUnlessEqual(wcslen('abc'), 3)
            self.failUnlessRaises(ctypes.ArgumentError, wcslen, 'ab\xe4')

        def test_ascii_replace(self):
            ctypes.set_conversion_mode('ascii', 'replace')
            self.failUnlessEqual(wcslen(u'abc'), 3)
            self.failUnlessEqual(wcslen(u'ab\u2070'), 3)
            self.failUnlessEqual(wcslen('abc'), 3)
            self.failUnlessEqual(wcslen('ab\xe4'), 3)

        def test_ascii_ignore(self):
            ctypes.set_conversion_mode('ascii', 'ignore')
            self.failUnlessEqual(wcslen(u'abc'), 3)
            self.failUnlessEqual(wcslen(u'ab\u2070'), 3)
            self.failUnlessEqual(wcslen('abc'), 3)
            self.failUnlessEqual(wcslen('\xe4\xf6\xfc\xdf'), 0)

        def test_latin1_strict(self):
            ctypes.set_conversion_mode('latin-1', 'strict')
            self.failUnlessEqual(wcslen(u'abc'), 3)
            self.failUnlessEqual(wcslen(u'ab\u2070'), 3)
            self.failUnlessEqual(wcslen('abc'), 3)
            self.failUnlessEqual(wcslen('\xe4\xf6\xfc\xdf'), 4)

        def test_buffers(self):
            ctypes.set_conversion_mode('ascii', 'strict')
            buf = ctypes.create_unicode_buffer('abc')
            self.failUnlessEqual(len(buf), 4)
            ctypes.set_conversion_mode('ascii', 'replace')
            buf = ctypes.create_unicode_buffer('ab\xe4\xf6\xfc')
            self.failUnlessEqual(buf[:], u'ab\ufffd\ufffd\ufffd\x00')
            ctypes.set_conversion_mode('ascii', 'ignore')
            buf = ctypes.create_unicode_buffer('ab\xe4\xf6\xfc')
            self.failUnlessEqual(buf[:], u'ab\x00\x00\x00\x00')


    import _ctypes_test
    func = ctypes.CDLL(_ctypes_test.__file__)._testfunc_p_p

    class StringTestCase(UnicodeTestCase):

        def setUp(self):
            self.prev_conv_mode = ctypes.set_conversion_mode('ascii', 'strict')
            func.argtypes = [ctypes.c_char_p]
            func.restype = ctypes.c_char_p

        def tearDown(self):
            ctypes.set_conversion_mode(*self.prev_conv_mode)
            func.argtypes = None
            func.restype = ctypes.c_int
            return

        def test_ascii_replace(self):
            ctypes.set_conversion_mode('ascii', 'strict')
            self.failUnlessEqual(func('abc'), 'abc')
            self.failUnlessEqual(func(u'abc'), 'abc')
            self.assertRaises(ctypes.ArgumentError, func, u'ab\xe4')

        def test_ascii_ignore(self):
            ctypes.set_conversion_mode('ascii', 'ignore')
            self.failUnlessEqual(func('abc'), 'abc')
            self.failUnlessEqual(func(u'abc'), 'abc')
            self.failUnlessEqual(func(u'\xe4\xf6\xfc\xdf'), '')

        def test_ascii_replace(self):
            ctypes.set_conversion_mode('ascii', 'replace')
            self.failUnlessEqual(func('abc'), 'abc')
            self.failUnlessEqual(func(u'abc'), 'abc')
            self.failUnlessEqual(func(u'\xe4\xf6\xfc\xdf'), '????')

        def test_buffers(self):
            ctypes.set_conversion_mode('ascii', 'strict')
            buf = ctypes.create_string_buffer(u'abc')
            self.failUnlessEqual(len(buf), 4)
            ctypes.set_conversion_mode('ascii', 'replace')
            buf = ctypes.create_string_buffer(u'ab\xe4\xf6\xfc')
            self.failUnlessEqual(buf[:], 'ab???\x00')
            ctypes.set_conversion_mode('ascii', 'ignore')
            buf = ctypes.create_string_buffer(u'ab\xe4\xf6\xfc')
            self.failUnlessEqual(buf[:], 'ab\x00\x00\x00\x00')


if __name__ == '__main__':
    unittest.main()