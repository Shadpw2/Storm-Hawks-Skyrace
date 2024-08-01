# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/macholib/dylib.py
# Compiled at: 2008-12-16 09:37:59
"""
Generic dylib path manipulation
"""
import re
__all__ = [
 'dylib_info']
DYLIB_RE = re.compile('(?x)\n(?P<location>^.*)(?:^|/)\n(?P<name>\n    (?P<shortname>\\w+?)\n    (?:\\.(?P<version>[^._]+))?\n    (?:_(?P<suffix>[^._]+))?\n    \\.dylib$\n)\n')

def dylib_info(filename):
    """
    A dylib name can take one of the following four forms:
        Location/Name.SomeVersion_Suffix.dylib
        Location/Name.SomeVersion.dylib
        Location/Name_Suffix.dylib
        Location/Name.dylib

    returns None if not found or a mapping equivalent to:
        dict(
            location='Location',
            name='Name.SomeVersion_Suffix.dylib',
            shortname='Name',
            version='SomeVersion',
            suffix='Suffix',
        )

    Note that SomeVersion and Suffix are optional and may be None
    if not present.
    """
    is_dylib = DYLIB_RE.match(filename)
    if not is_dylib:
        return
    return is_dylib.groupdict()


def test_dylib_info():

    def d(location=None, name=None, shortname=None, version=None, suffix=None):
        return dict(location=location, name=name, shortname=shortname, version=version, suffix=suffix)

    assert dylib_info('completely/invalid') is None
    assert dylib_info('completely/invalide_debug') is None
    assert dylib_info('P/Foo.dylib') == d('P', 'Foo.dylib', 'Foo')
    assert dylib_info('P/Foo_debug.dylib') == d('P', 'Foo_debug.dylib', 'Foo', suffix='debug')
    assert dylib_info('P/Foo.A.dylib') == d('P', 'Foo.A.dylib', 'Foo', 'A')
    assert dylib_info('P/Foo_debug.A.dylib') == d('P', 'Foo_debug.A.dylib', 'Foo_debug', 'A')
    assert dylib_info('P/Foo.A_debug.dylib') == d('P', 'Foo.A_debug.dylib', 'Foo', 'A', 'debug')
    return


if __name__ == '__main__':
    test_dylib_info()