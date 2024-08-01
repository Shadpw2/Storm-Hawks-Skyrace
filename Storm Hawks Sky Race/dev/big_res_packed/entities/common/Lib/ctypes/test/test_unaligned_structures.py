# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/test_unaligned_structures.py
# Compiled at: 2008-12-16 09:38:03
import sys, unittest
from ctypes import *
structures = []
byteswapped_structures = []
if sys.byteorder == 'little':
    SwappedStructure = BigEndianStructure
else:
    SwappedStructure = LittleEndianStructure
for typ in [c_short, c_int, c_long, c_longlong, 
 c_float, c_double, 
 c_ushort, c_uint, 
 c_ulong, c_ulonglong]:

    class X(Structure):
        _pack_ = 1
        _fields_ = [('pad', c_byte),
         (
          'value', typ)]


    class Y(SwappedStructure):
        _pack_ = 1
        _fields_ = [('pad', c_byte),
         (
          'value', typ)]


    structures.append(X)
    byteswapped_structures.append(Y)

class TestStructures(unittest.TestCase):

    def test_native(self):
        for typ in structures:
            self.failUnlessEqual(typ.value.offset, 1)
            o = typ()
            o.value = 4
            self.failUnlessEqual(o.value, 4)

    def test_swapped(self):
        for typ in byteswapped_structures:
            self.failUnlessEqual(typ.value.offset, 1)
            o = typ()
            o.value = 4
            self.failUnlessEqual(o.value, 4)


if __name__ == '__main__':
    unittest.main()