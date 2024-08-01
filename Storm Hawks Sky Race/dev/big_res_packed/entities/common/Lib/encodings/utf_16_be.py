# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/encodings/utf_16_be.py
# Compiled at: 2008-12-16 09:38:15
""" Python 'utf-16-be' Codec

Written by Marc-Andre Lemburg (mal@lemburg.com).

(c) Copyright CNRI, All Rights Reserved. NO WARRANTY.

"""
import codecs
encode = codecs.utf_16_be_encode

def decode(input, errors='strict'):
    return codecs.utf_16_be_decode(input, errors, True)


class IncrementalEncoder(codecs.IncrementalEncoder):

    def encode(self, input, final=False):
        return codecs.utf_16_be_encode(input, self.errors)[0]


class IncrementalDecoder(codecs.BufferedIncrementalDecoder):
    _buffer_decode = codecs.utf_16_be_decode


class StreamWriter(codecs.StreamWriter):
    encode = codecs.utf_16_be_encode


class StreamReader(codecs.StreamReader):
    decode = codecs.utf_16_be_decode


def getregentry():
    return codecs.CodecInfo(name='utf-16-be', encode=encode, decode=decode, incrementalencoder=IncrementalEncoder, incrementaldecoder=IncrementalDecoder, streamreader=StreamReader, streamwriter=StreamWriter)