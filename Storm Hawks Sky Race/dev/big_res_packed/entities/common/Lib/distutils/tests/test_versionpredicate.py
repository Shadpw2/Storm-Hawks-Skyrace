# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/distutils/tests/test_versionpredicate.py
# Compiled at: 2008-12-16 09:38:07
"""Tests harness for distutils.versionpredicate.

"""
import distutils.versionpredicate, doctest

def test_suite():
    return doctest.DocTestSuite(distutils.versionpredicate)