# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/encodings/__init__.py
# Compiled at: 2008-12-16 09:38:16
""" Standard "encodings" Package

    Standard Python encoding modules are stored in this package
    directory.

    Codec modules must have names corresponding to normalized encoding
    names as defined in the normalize_encoding() function below, e.g.
    'utf-8' must be implemented by the module 'utf_8.py'.

    Each codec module must export the following interface:

    * getregentry() -> codecs.CodecInfo object
    The getregentry() API must a CodecInfo object with encoder, decoder,
    incrementalencoder, incrementaldecoder, streamwriter and streamreader
    atttributes which adhere to the Python Codec Interface Standard.

    In addition, a module may optionally also define the following
    APIs which are then used by the package's codec search function:

    * getaliases() -> sequence of encoding name strings to use as aliases

    Alias names returned by getaliases() must be normalized encoding
    names as defined by normalize_encoding().

Written by Marc-Andre Lemburg (mal@lemburg.com).

(c) Copyright CNRI, All Rights Reserved. NO WARRANTY.

"""
import codecs, types
from encodings import aliases
_cache = {}
_unknown = '--unknown--'
_import_tail = ['*']
_norm_encoding_map = '                                              . 0123456789       ABCDEFGHIJKLMNOPQRSTUVWXYZ      abcdefghijklmnopqrstuvwxyz                                                                                                                                     '
_aliases = aliases.aliases

class CodecRegistryError(LookupError, SystemError):
    pass


def normalize_encoding(encoding):
    """ Normalize an encoding name.

        Normalization works as follows: all non-alphanumeric
        characters except the dot used for Python package names are
        collapsed and replaced with a single underscore, e.g. '  -;#'
        becomes '_'. Leading and trailing underscores are removed.

        Note that encoding names should be ASCII only; if they do use
        non-ASCII characters, these must be Latin-1 compatible.

    """
    if hasattr(types, 'UnicodeType') and type(encoding) is types.UnicodeType:
        encoding = encoding.encode('latin-1')
    return ('_').join(encoding.translate(_norm_encoding_map).split())


def search_function(encoding):
    entry = _cache.get(encoding, _unknown)
    if entry is not _unknown:
        return entry
    norm_encoding = normalize_encoding(encoding)
    aliased_encoding = _aliases.get(norm_encoding) or _aliases.get(norm_encoding.replace('.', '_'))
    if aliased_encoding is not None:
        modnames = [
         aliased_encoding,
         norm_encoding]
    else:
        modnames = [
         norm_encoding]
    for modname in modnames:
        if not modname or '.' in modname:
            continue
        try:
            mod = __import__('encodings.' + modname, globals(), locals(), _import_tail)
        except ImportError:
            pass
        else:
            break
    else:
        mod = None

    try:
        getregentry = mod.getregentry
    except AttributeError:
        mod = None

    if mod is None:
        _cache[encoding] = None
        return
    entry = getregentry()
    if not isinstance(entry, codecs.CodecInfo):
        if not 4 <= len(entry) <= 7:
            raise CodecRegistryError, 'module "%s" (%s) failed to register' % (
             mod.__name__, mod.__file__)
        if not callable(entry[0]) or not callable(entry[1]) or entry[2] is not None and not callable(entry[2]) or entry[3] is not None and not callable(entry[3]) or len(entry) > 4 and entry[4] is not None and not callable(entry[4]) or len(entry) > 5 and entry[5] is not None and not callable(entry[5]):
            raise CodecRegistryError, 'incompatible codecs in module "%s" (%s)' % (
             mod.__name__, mod.__file__)
        if len(entry) < 7 or entry[6] is None:
            entry += (None, ) * (6 - len(entry)) + (mod.__name__.split('.', 1)[1],)
        entry = codecs.CodecInfo(*entry)
    _cache[encoding] = entry
    try:
        codecaliases = mod.getaliases()
    except AttributeError:
        pass
    else:
        for alias in codecaliases:
            if not _aliases.has_key(alias):
                _aliases[alias] = modname

    return entry


codecs.register(search_function)