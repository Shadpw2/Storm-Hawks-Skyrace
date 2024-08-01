# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_refcounts.py
# Compiled at: 2008-12-16 09:38:02
import unittest, ctypes, gc
MyCallback = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_int)
OtherCallback = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_int, ctypes.c_ulonglong)
import _ctypes_test
dll = ctypes.CDLL(_ctypes_test.__file__)

class RefcountTestCase(unittest.TestCase):

    def test_1(self):
        from sys import getrefcount as grc
        f = dll._testfunc_callback_i_if
        f.restype = ctypes.c_int
        f.argtypes = [ctypes.c_int, MyCallback]

        def callback(value):
            return value

        self.failUnlessEqual(grc(callback), 2)
        cb = MyCallback(callback)
        self.failUnless(grc(callback) > 2)
        result = f(-10, cb)
        self.failUnlessEqual(result, -18)
        cb = None
        gc.collect()
        self.failUnlessEqual(grc(callback), 2)
        return

    def test_refcount(self):
        from sys import getrefcount as grc

        def func(*args):
            pass

        self.failUnlessEqual(grc(func), 2)
        f = OtherCallback(func)
        self.failUnless(grc(func) > 2)
        del f
        self.failUnless(grc(func) >= 2)
        gc.collect()
        self.failUnless(grc(func) == 2)

        class X(ctypes.Structure):
            _fields_ = [
             (
              'a', OtherCallback)]

        x = X()
        x.a = OtherCallback(func)
        self.failUnless(grc(func) > 2)
        del x
        self.failUnless(grc(func) >= 2)
        gc.collect()
        self.failUnlessEqual(grc(func), 2)
        f = OtherCallback(func)
        self.failUnless(grc(func) > 2)
        f.cycle = f
        del f
        gc.collect()
        self.failUnlessEqual(grc(func), 2)


class AnotherLeak(unittest.TestCase):

    def test_callback(self):
        import sys
        proto = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_int, ctypes.c_int)

        def func(a, b):
            return a * b * 2

        f = proto(func)
        a = sys.getrefcount(ctypes.c_int)
        f(1, 2)
        self.failUnlessEqual(sys.getrefcount(ctypes.c_int), a)


if __name__ == '__main__':
    unittest.main()