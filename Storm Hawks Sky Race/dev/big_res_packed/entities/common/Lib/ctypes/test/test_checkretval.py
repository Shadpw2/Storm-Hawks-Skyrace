# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_checkretval.py
# Compiled at: 2008-12-16 09:38:01
import unittest, sys
from ctypes import *

class CHECKED(c_int):

    def _check_retval_(value):
        return str(value.value)

    _check_retval_ = staticmethod(_check_retval_)


class Test(unittest.TestCase):

    def test_checkretval(self):
        import _ctypes_test
        dll = CDLL(_ctypes_test.__file__)
        self.failUnlessEqual(42, dll._testfunc_p_p(42))
        dll._testfunc_p_p.restype = CHECKED
        self.failUnlessEqual('42', dll._testfunc_p_p(42))
        dll._testfunc_p_p.restype = None
        self.failUnlessEqual(None, dll._testfunc_p_p(42))
        del dll._testfunc_p_p.restype
        self.failUnlessEqual(42, dll._testfunc_p_p(42))
        return

    try:
        oledll
    except NameError:
        pass
    else:

        def test_oledll(self):
            self.failUnlessRaises(WindowsError, oledll.oleaut32.CreateTypeLib2, 0, 0, 0)


if __name__ == '__main__':
    unittest.main()