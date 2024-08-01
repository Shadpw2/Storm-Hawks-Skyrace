# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_repr.py
# Compiled at: 2008-12-16 09:38:03
from ctypes import *
import unittest
subclasses = []
for base in [c_byte, c_short, c_int, c_long, c_longlong, 
 c_ubyte, c_ushort, c_uint, 
 c_ulong, c_ulonglong, 
 c_float, c_double]:

    class X(base):
        pass


    subclasses.append(X)

class X(c_char):
    pass


class ReprTest(unittest.TestCase):

    def test_numbers(self):
        for typ in subclasses:
            base = typ.__bases__[0]
            self.failUnless(repr(base(42)).startswith(base.__name__))
            self.failUnlessEqual('<X object at', repr(typ(42))[:12])

    def test_char(self):
        self.failUnlessEqual("c_char('x')", repr(c_char('x')))
        self.failUnlessEqual('<X object at', repr(X('x'))[:12])


if __name__ == '__main__':
    unittest.main()