# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_simplesubclasses.py
# Compiled at: 2008-12-16 09:38:03
import unittest
from ctypes import *

class MyInt(c_int):

    def __cmp__(self, other):
        if type(other) != MyInt:
            return -1
        return cmp(self.value, other.value)


class Test(unittest.TestCase):

    def test_compare(self):
        self.failUnlessEqual(MyInt(3), MyInt(3))
        self.failIfEqual(MyInt(42), MyInt(43))

    def test_ignore_retval(self):
        proto = CFUNCTYPE(None)

        def func():
            return (1, 'abc', None)

        cb = proto(func)
        self.failUnlessEqual(None, cb())
        return

    def test_int_callback(self):
        args = []

        def func(arg):
            args.append(arg)
            return arg

        cb = CFUNCTYPE(None, MyInt)(func)
        self.failUnlessEqual(None, cb(42))
        self.failUnlessEqual(type(args[-1]), MyInt)
        cb = CFUNCTYPE(c_int, c_int)(func)
        self.failUnlessEqual(42, cb(42))
        self.failUnlessEqual(type(args[-1]), int)
        return

    def test_int_struct(self):

        class X(Structure):
            _fields_ = [
             (
              'x', MyInt)]

        self.failUnlessEqual(X().x, MyInt())
        s = X()
        s.x = MyInt(42)
        self.failUnlessEqual(s.x, MyInt(42))


if __name__ == '__main__':
    unittest.main()