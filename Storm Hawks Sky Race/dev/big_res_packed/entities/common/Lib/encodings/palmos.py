# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/encodings/palmos.py
# Compiled at: 2008-12-16 09:38:14
""" Python Character Mapping Codec for PalmOS 3.5.

Written by Sjoerd Mullender (sjoerd@acm.org); based on iso8859_15.py.

"""
import codecs

class Codec(codecs.Codec):

    def encode(self, input, errors='strict'):
        return codecs.charmap_encode(input, errors, encoding_map)

    def decode(self, input, errors='strict'):
        return codecs.charmap_decode(input, errors, decoding_map)


class IncrementalEncoder(codecs.IncrementalEncoder):

    def encode(self, input, final=False):
        return codecs.charmap_encode(input, self.errors, encoding_map)[0]


class IncrementalDecoder(codecs.IncrementalDecoder):

    def decode(self, input, final=False):
        return codecs.charmap_decode(input, self.errors, decoding_map)[0]


class StreamWriter(Codec, codecs.StreamWriter):
    pass


class StreamReader(Codec, codecs.StreamReader):
    pass


def getregentry():
    return codecs.CodecInfo(name='palmos', encode=Codec().encode, decode=Codec().decode, incrementalencoder=IncrementalEncoder, incrementaldecoder=IncrementalDecoder, streamreader=StreamReader, streamwriter=StreamWriter)


decoding_map = codecs.make_identity_dict(range(256))
decoding_map.update({128: 8364, 
   130: 8218, 
   131: 402, 
   132: 8222, 
   133: 8230, 
   134: 8224, 
   135: 8225, 
   136: 710, 
   137: 8240, 
   138: 352, 
   139: 8249, 
   140: 338, 
   141: 9830, 
   142: 9827, 
   143: 9829, 
   144: 9824, 
   145: 8216, 
   146: 8217, 
   147: 8220, 
   148: 8221, 
   149: 8226, 
   150: 8211, 
   151: 8212, 
   152: 732, 
   153: 8482, 
   154: 353, 
   156: 339, 
   159: 376})
encoding_map = codecs.make_encoding_map(decoding_map)