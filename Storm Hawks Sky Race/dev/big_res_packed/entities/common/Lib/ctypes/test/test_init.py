# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_init.py
# Compiled at: 2008-12-16 09:38:02
from ctypes import *
import unittest

class X(Structure):
    _fields_ = [
     (
      'a', c_int),
     (
      'b', c_int)]
    new_was_called = False

    def __new__(cls):
        result = super(X, cls).__new__(cls)
        result.new_was_called = True
        return result

    def __init__(self):
        self.a = 9
        self.b = 12


class Y(Structure):
    _fields_ = [
     (
      'x', X)]


class InitTest(unittest.TestCase):

    def test_get(self):
        y = Y()
        self.failUnlessEqual((y.x.a, y.x.b), (0, 0))
        self.failUnlessEqual(y.x.new_was_called, False)
        x = X()
        self.failUnlessEqual((x.a, x.b), (9, 12))
        self.failUnlessEqual(x.new_was_called, True)
        y.x = x
        self.failUnlessEqual((y.x.a, y.x.b), (9, 12))
        self.failUnlessEqual(y.x.new_was_called, False)


if __name__ == '__main__':
    unittest.main()