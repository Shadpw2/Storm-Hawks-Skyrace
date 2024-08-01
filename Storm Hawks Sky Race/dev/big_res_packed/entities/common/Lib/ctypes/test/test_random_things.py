# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_random_things.py
# Compiled at: 2008-12-16 09:38:02
from ctypes import *
import unittest, sys

def callback_func(arg):
    42 / arg
    raise ValueError, arg


if sys.platform == 'win32':

    class call_function_TestCase(unittest.TestCase):

        def test(self):
            from _ctypes import call_function
            hdll = windll.kernel32.LoadLibraryA('kernel32')
            funcaddr = windll.kernel32.GetProcAddress(hdll, 'GetModuleHandleA')
            self.failUnlessEqual(call_function(funcaddr, (None, )), windll.kernel32.GetModuleHandleA(None))
            return


class CallbackTracbackTestCase(unittest.TestCase):

    def capture_stderr(self, func, *args, **kw):
        import StringIO
        old_stderr = sys.stderr
        logger = sys.stderr = StringIO.StringIO()
        try:
            func(*args, **kw)
        finally:
            sys.stderr = old_stderr

        return logger.getvalue()

    def test_ValueError(self):
        cb = CFUNCTYPE(c_int, c_int)(callback_func)
        out = self.capture_stderr(cb, 42)
        self.failUnlessEqual(out.splitlines()[-1], 'ValueError: 42')

    def test_IntegerDivisionError(self):
        cb = CFUNCTYPE(c_int, c_int)(callback_func)
        out = self.capture_stderr(cb, 0)
        self.failUnlessEqual(out.splitlines()[-1][:19], 'ZeroDivisionError: ')

    def test_FloatDivisionError(self):
        cb = CFUNCTYPE(c_int, c_double)(callback_func)
        out = self.capture_stderr(cb, 0.0)
        self.failUnlessEqual(out.splitlines()[-1][:19], 'ZeroDivisionError: ')

    def test_TypeErrorDivisionError(self):
        cb = CFUNCTYPE(c_int, c_char_p)(callback_func)
        out = self.capture_stderr(cb, 'spam')
        self.failUnlessEqual(out.splitlines()[-1], "TypeError: unsupported operand type(s) for /: 'int' and 'str'")


if __name__ == '__main__':
    unittest.main()