# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_macholib.py
# Compiled at: 2008-12-16 09:38:02
import os, sys, unittest
from ctypes.macholib.dyld import dyld_find

def find_lib(name):
    possible = [
     'lib' + name + '.dylib', name + '.dylib', name + '.framework/' + name]
    for dylib in possible:
        try:
            return os.path.realpath(dyld_find(dylib))
        except ValueError:
            pass

    raise ValueError, '%s not found' % (name,)


class MachOTest(unittest.TestCase):
    if sys.platform == 'darwin':

        def test_find(self):
            self.failUnlessEqual(find_lib('pthread'), '/usr/lib/libSystem.B.dylib')
            result = find_lib('z')
            self.failUnless(result.startswith('/usr/lib/libz.1'))
            self.failUnless(result.endswith('.dylib'))
            self.failUnlessEqual(find_lib('IOKit'), '/System/Library/Frameworks/IOKit.framework/Versions/A/IOKit')


if __name__ == '__main__':
    unittest.main()