# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/encodings/cp737.py
# Compiled at: 2008-12-16 09:38:10
""" Python Character Mapping Codec cp737 generated from 'VENDORS/MICSFT/PC/CP737.TXT' with gencodec.py.

"""
import codecs

class Codec(codecs.Codec):

    def encode(self, input, errors='strict'):
        return codecs.charmap_encode(input, errors, encoding_map)

    def decode(self, input, errors='strict'):
        return codecs.charmap_decode(input, errors, decoding_table)


class IncrementalEncoder(codecs.IncrementalEncoder):

    def encode(self, input, final=False):
        return codecs.charmap_encode(input, self.errors, encoding_map)[0]


class IncrementalDecoder(codecs.IncrementalDecoder):

    def decode(self, input, final=False):
        return codecs.charmap_decode(input, self.errors, decoding_table)[0]


class StreamWriter(Codec, codecs.StreamWriter):
    pass


class StreamReader(Codec, codecs.StreamReader):
    pass


def getregentry():
    return codecs.CodecInfo(name='cp737', encode=Codec().encode, decode=Codec().decode, incrementalencoder=IncrementalEncoder, incrementaldecoder=IncrementalDecoder, streamreader=StreamReader, streamwriter=StreamWriter)


decoding_map = codecs.make_identity_dict(range(256))
decoding_map.update({128: 913, 
   129: 914, 
   130: 915, 
   131: 916, 
   132: 917, 
   133: 918, 
   134: 919, 
   135: 920, 
   136: 921, 
   137: 922, 
   138: 923, 
   139: 924, 
   140: 925, 
   141: 926, 
   142: 927, 
   143: 928, 
   144: 929, 
   145: 931, 
   146: 932, 
   147: 933, 
   148: 934, 
   149: 935, 
   150: 936, 
   151: 937, 
   152: 945, 
   153: 946, 
   154: 947, 
   155: 948, 
   156: 949, 
   157: 950, 
   158: 951, 
   159: 952, 
   160: 953, 
   161: 954, 
   162: 955, 
   163: 956, 
   164: 957, 
   165: 958, 
   166: 959, 
   167: 960, 
   168: 961, 
   169: 963, 
   170: 962, 
   171: 964, 
   172: 965, 
   173: 966, 
   174: 967, 
   175: 968, 
   176: 9617, 
   177: 9618, 
   178: 9619, 
   179: 9474, 
   180: 9508, 
   181: 9569, 
   182: 9570, 
   183: 9558, 
   184: 9557, 
   185: 9571, 
   186: 9553, 
   187: 9559, 
   188: 9565, 
   189: 9564, 
   190: 9563, 
   191: 9488, 
   192: 9492, 
   193: 9524, 
   194: 9516, 
   195: 9500, 
   196: 9472, 
   197: 9532, 
   198: 9566, 
   199: 9567, 
   200: 9562, 
   201: 9556, 
   202: 9577, 
   203: 9574, 
   204: 9568, 
   205: 9552, 
   206: 9580, 
   207: 9575, 
   208: 9576, 
   209: 9572, 
   210: 9573, 
   211: 9561, 
   212: 9560, 
   213: 9554, 
   214: 9555, 
   215: 9579, 
   216: 9578, 
   217: 9496, 
   218: 9484, 
   219: 9608, 
   220: 9604, 
   221: 9612, 
   222: 9616, 
   223: 9600, 
   224: 969, 
   225: 940, 
   226: 941, 
   227: 942, 
   228: 970, 
   229: 943, 
   230: 972, 
   231: 973, 
   232: 971, 
   233: 974, 
   234: 902, 
   235: 904, 
   236: 905, 
   237: 906, 
   238: 908, 
   239: 910, 
   240: 911, 
   241: 177, 
   242: 8805, 
   243: 8804, 
   244: 938, 
   245: 939, 
   246: 247, 
   247: 8776, 
   248: 176, 
   249: 8729, 
   250: 183, 
   251: 8730, 
   252: 8319, 
   253: 178, 
   254: 9632, 
   255: 160})
decoding_table = u'\x00\x01\x02\x03\x04\x05\x06\x07\x08\t\n\x0b\x0c\r\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~\x7f\u0391\u0392\u0393\u0394\u0395\u0396\u0397\u0398\u0399\u039a\u039b\u039c\u039d\u039e\u039f\u03a0\u03a1\u03a3\u03a4\u03a5\u03a6\u03a7\u03a8\u03a9\u03b1\u03b2\u03b3\u03b4\u03b5\u03b6\u03b7\u03b8\u03b9\u03ba\u03bb\u03bc\u03bd\u03be\u03bf\u03c0\u03c1\u03c3\u03c2\u03c4\u03c5\u03c6\u03c7\u03c8\u2591\u2592\u2593\u2502\u2524\u2561\u2562\u2556\u2555\u2563\u2551\u2557\u255d\u255c\u255b\u2510\u2514\u2534\u252c\u251c\u2500\u253c\u255e\u255f\u255a\u2554\u2569\u2566\u2560\u2550\u256c\u2567\u2568\u2564\u2565\u2559\u2558\u2552\u2553\u256b\u256a\u2518\u250c\u2588\u2584\u258c\u2590\u2580\u03c9\u03ac\u03ad\u03ae\u03ca\u03af\u03cc\u03cd\u03cb\u03ce\u0386\u0388\u0389\u038a\u038c\u038e\u038f\xb1\u2265\u2264\u03aa\u03ab\xf7\u2248\xb0\u2219\xb7\u221a\u207f\xb2\u25a0\xa0'
encoding_map = {0: 0, 
   1: 1, 
   2: 2, 
   3: 3, 
   4: 4, 
   5: 5, 
   6: 6, 
   7: 7, 
   8: 8, 
   9: 9, 
   10: 10, 
   11: 11, 
   12: 12, 
   13: 13, 
   14: 14, 
   15: 15, 
   16: 16, 
   17: 17, 
   18: 18, 
   19: 19, 
   20: 20, 
   21: 21, 
   22: 22, 
   23: 23, 
   24: 24, 
   25: 25, 
   26: 26, 
   27: 27, 
   28: 28, 
   29: 29, 
   30: 30, 
   31: 31, 
   32: 32, 
   33: 33, 
   34: 34, 
   35: 35, 
   36: 36, 
   37: 37, 
   38: 38, 
   39: 39, 
   40: 40, 
   41: 41, 
   42: 42, 
   43: 43, 
   44: 44, 
   45: 45, 
   46: 46, 
   47: 47, 
   48: 48, 
   49: 49, 
   50: 50, 
   51: 51, 
   52: 52, 
   53: 53, 
   54: 54, 
   55: 55, 
   56: 56, 
   57: 57, 
   58: 58, 
   59: 59, 
   60: 60, 
   61: 61, 
   62: 62, 
   63: 63, 
   64: 64, 
   65: 65, 
   66: 66, 
   67: 67, 
   68: 68, 
   69: 69, 
   70: 70, 
   71: 71, 
   72: 72, 
   73: 73, 
   74: 74, 
   75: 75, 
   76: 76, 
   77: 77, 
   78: 78, 
   79: 79, 
   80: 80, 
   81: 81, 
   82: 82, 
   83: 83, 
   84: 84, 
   85: 85, 
   86: 86, 
   87: 87, 
   88: 88, 
   89: 89, 
   90: 90, 
   91: 91, 
   92: 92, 
   93: 93, 
   94: 94, 
   95: 95, 
   96: 96, 
   97: 97, 
   98: 98, 
   99: 99, 
   100: 100, 
   101: 101, 
   102: 102, 
   103: 103, 
   104: 104, 
   105: 105, 
   106: 106, 
   107: 107, 
   108: 108, 
   109: 109, 
   110: 110, 
   111: 111, 
   112: 112, 
   113: 113, 
   114: 114, 
   115: 115, 
   116: 116, 
   117: 117, 
   118: 118, 
   119: 119, 
   120: 120, 
   121: 121, 
   122: 122, 
   123: 123, 
   124: 124, 
   125: 125, 
   126: 126, 
   127: 127, 
   160: 255, 
   176: 248, 
   177: 241, 
   178: 253, 
   183: 250, 
   247: 246, 
   902: 234, 
   904: 235, 
   905: 236, 
   906: 237, 
   908: 238, 
   910: 239, 
   911: 240, 
   913: 128, 
   914: 129, 
   915: 130, 
   916: 131, 
   917: 132, 
   918: 133, 
   919: 134, 
   920: 135, 
   921: 136, 
   922: 137, 
   923: 138, 
   924: 139, 
   925: 140, 
   926: 141, 
   927: 142, 
   928: 143, 
   929: 144, 
   931: 145, 
   932: 146, 
   933: 147, 
   934: 148, 
   935: 149, 
   936: 150, 
   937: 151, 
   938: 244, 
   939: 245, 
   940: 225, 
   941: 226, 
   942: 227, 
   943: 229, 
   945: 152, 
   946: 153, 
   947: 154, 
   948: 155, 
   949: 156, 
   950: 157, 
   951: 158, 
   952: 159, 
   953: 160, 
   954: 161, 
   955: 162, 
   956: 163, 
   957: 164, 
   958: 165, 
   959: 166, 
   960: 167, 
   961: 168, 
   962: 170, 
   963: 169, 
   964: 171, 
   965: 172, 
   966: 173, 
   967: 174, 
   968: 175, 
   969: 224, 
   970: 228, 
   971: 232, 
   972: 230, 
   973: 231, 
   974: 233, 
   8319: 252, 
   8729: 249, 
   8730: 251, 
   8776: 247, 
   8804: 243, 
   8805: 242, 
   9472: 196, 
   9474: 179, 
   9484: 218, 
   9488: 191, 
   9492: 192, 
   9496: 217, 
   9500: 195, 
   9508: 180, 
   9516: 194, 
   9524: 193, 
   9532: 197, 
   9552: 205, 
   9553: 186, 
   9554: 213, 
   9555: 214, 
   9556: 201, 
   9557: 184, 
   9558: 183, 
   9559: 187, 
   9560: 212, 
   9561: 211, 
   9562: 200, 
   9563: 190, 
   9564: 189, 
   9565: 188, 
   9566: 198, 
   9567: 199, 
   9568: 204, 
   9569: 181, 
   9570: 182, 
   9571: 185, 
   9572: 209, 
   9573: 210, 
   9574: 203, 
   9575: 207, 
   9576: 208, 
   9577: 202, 
   9578: 216, 
   9579: 215, 
   9580: 206, 
   9600: 223, 
   9604: 220, 
   9608: 219, 
   9612: 221, 
   9616: 222, 
   9617: 176, 
   9618: 177, 
   9619: 178, 
   9632: 254}