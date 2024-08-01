# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/lib-tk/FixTk.py
# Compiled at: 2008-12-16 09:38:19
import sys, os
prefix = os.path.join(sys.prefix, 'tcl')
if os.path.exists(prefix):
    if not os.environ.has_key('TCL_LIBRARY'):
        for name in os.listdir(prefix):
            if name.startswith('tcl'):
                tcldir = os.path.join(prefix, name)
                if os.path.isdir(tcldir):
                    os.environ['TCL_LIBRARY'] = tcldir

    import _tkinter
    ver = str(_tkinter.TCL_VERSION)
    if not os.environ.has_key('TK_LIBRARY'):
        v = os.path.join(prefix, 'tk' + ver)
        if os.path.exists(os.path.join(v, 'tclIndex')):
            os.environ['TK_LIBRARY'] = v
    if not os.environ.has_key('TIX_LIBRARY'):
        for name in os.listdir(prefix):
            if name.startswith('tix'):
                tixdir = os.path.join(prefix, name)
                if os.path.isdir(tixdir):
                    os.environ['TIX_LIBRARY'] = tixdir