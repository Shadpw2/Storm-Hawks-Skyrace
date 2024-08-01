# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/encodings/undefined.py
# Compiled at: 2008-12-16 09:38:15
""" Python 'undefined' Codec

    This codec will always raise a ValueError exception when being
    used. It is intended for use by the site.py file to switch off
    automatic string to Unicode coercion.

Written by Marc-Andre Lemburg (mal@lemburg.com).

(c) Copyright CNRI, All Rights Reserved. NO WARRANTY.

"""
import codecs

class Codec(codecs.Codec):

    def encode(self, input, errors='strict'):
        raise UnicodeError('undefined encoding')

    def decode(self, input, errors='strict'):
        raise UnicodeError('undefined encoding')


class IncrementalEncoder(codecs.IncrementalEncoder):

    def encode(self, input, final=False):
        raise UnicodeError('undefined encoding')


class IncrementalDecoder(codecs.IncrementalDecoder):

    def decode(self, input, final=False):
        raise UnicodeError('undefined encoding')


class StreamWriter(Codec, codecs.StreamWriter):
    pass


class StreamReader(Codec, codecs.StreamReader):
    pass


def getregentry():
    return codecs.CodecInfo(name='undefined', encode=Codec().encode, decode=Codec().decode, incrementalencoder=IncrementalEncoder, incrementaldecoder=IncrementalDecoder, streamwriter=StreamWriter, streamreader=StreamReader)