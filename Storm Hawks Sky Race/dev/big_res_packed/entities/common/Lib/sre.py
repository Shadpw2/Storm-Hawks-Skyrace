# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/sre.py
# Compiled at: 2008-12-16 09:37:51
"""This file is only retained for backwards compatibility.
It will be removed in the future.  sre was moved to re in version 2.5.
"""
import warnings
warnings.warn('The sre module is deprecated, please import re.', DeprecationWarning, 2)
from .re import *
from re import __all__
from re import _compile