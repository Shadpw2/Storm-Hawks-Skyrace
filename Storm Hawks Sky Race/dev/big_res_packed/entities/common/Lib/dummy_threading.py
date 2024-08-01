# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/dummy_threading.py
# Compiled at: 2008-12-16 09:37:43
"""Faux ``threading`` version using ``dummy_thread`` instead of ``thread``.

The module ``_dummy_threading`` is added to ``sys.modules`` in order
to not have ``threading`` considered imported.  Had ``threading`` been
directly imported it would have made all subsequent imports succeed
regardless of whether ``thread`` was available which is not desired.

:Author: Brett Cannon
:Contact: brett@python.org

XXX: Try to get rid of ``_dummy_threading``.

"""
from sys import modules as sys_modules
import dummy_thread
holding_thread = False
holding_threading = False
holding__threading_local = False
try:
    if 'thread' in sys_modules:
        held_thread = sys_modules['thread']
        holding_thread = True
    sys_modules['thread'] = sys_modules['dummy_thread']
    if 'threading' in sys_modules:
        held_threading = sys_modules['threading']
        holding_threading = True
        del sys_modules['threading']
    if '_threading_local' in sys_modules:
        held__threading_local = sys_modules['_threading_local']
        holding__threading_local = True
        del sys_modules['_threading_local']
    import threading
    sys_modules['_dummy_threading'] = sys_modules['threading']
    del sys_modules['threading']
    sys_modules['_dummy__threading_local'] = sys_modules['_threading_local']
    del sys_modules['_threading_local']
    from ._dummy_threading import *
    from _dummy_threading import __all__
finally:
    if holding_threading:
        sys_modules['threading'] = held_threading
        del held_threading
    del holding_threading
    if holding__threading_local:
        sys_modules['_threading_local'] = held__threading_local
        del held__threading_local
    del holding__threading_local
    if holding_thread:
        sys_modules['thread'] = held_thread
        del held_thread
    else:
        del sys_modules['thread']
    del holding_thread
    del dummy_thread
    del sys_modules