# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_anon.py
# Compiled at: 2008-12-16 09:38:01
import unittest
from ctypes import *

class AnonTest(unittest.TestCase):

    def test_anon(self):

        class ANON(Union):
            _fields_ = [
             (
              'a', c_int),
             (
              'b', c_int)]

        class Y(Structure):
            _fields_ = [
             (
              'x', c_int),
             (
              '_', ANON),
             (
              'y', c_int)]
            _anonymous_ = ['_']

        self.failUnlessEqual(Y.a.offset, sizeof(c_int))
        self.failUnlessEqual(Y.b.offset, sizeof(c_int))
        self.failUnlessEqual(ANON.a.offset, 0)
        self.failUnlessEqual(ANON.b.offset, 0)

    def test_anon_nonseq(self):
        self.failUnlessRaises(TypeError, (lambda : type(Structure)('Name', (
         Structure,), {'_fields_': [], '_anonymous_': 42})))

    def test_anon_nonmember(self):
        self.failUnlessRaises(AttributeError, (lambda : type(Structure)('Name', (
         Structure,), {'_fields_': [], '_anonymous_': [
                         'x']})))

    def test_nested(self):

        class ANON_S(Structure):
            _fields_ = [
             (
              'a', c_int)]

        class ANON_U(Union):
            _fields_ = [
             (
              '_', ANON_S),
             (
              'b', c_int)]
            _anonymous_ = ['_']

        class Y(Structure):
            _fields_ = [
             (
              'x', c_int),
             (
              '_', ANON_U),
             (
              'y', c_int)]
            _anonymous_ = ['_']

        self.failUnlessEqual(Y.x.offset, 0)
        self.failUnlessEqual(Y.a.offset, sizeof(c_int))
        self.failUnlessEqual(Y.b.offset, sizeof(c_int))
        self.failUnlessEqual(Y._.offset, sizeof(c_int))
        self.failUnlessEqual(Y.y.offset, sizeof(c_int) * 2)


if __name__ == '__main__':
    unittest.main()