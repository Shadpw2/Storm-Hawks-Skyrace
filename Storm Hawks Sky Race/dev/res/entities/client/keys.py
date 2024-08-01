# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/keys.py
# Compiled at: 2008-12-16 09:35:38
"""This module provides utility functions for button-pressed input type, and
definitions of various key codes - reflecting constants in the C++ code base.
These must not be changed!
Original version by glenc@MicroForte;
adapted to local coding standard by karlk@Bitcasters."""
import BigWorld
from .Math import *
import math
MODIFIER_SHIFT = 1
MODIFIER_CTRL = 2
MODIFIER_ALT = 4
KEY_NOT_FOUND = 0
KEY_NONE = 0
KEY_NULL = 0
KEY_ESCAPE = 1
KEY_1 = 2
KEY_2 = 3
KEY_3 = 4
KEY_4 = 5
KEY_5 = 6
KEY_6 = 7
KEY_7 = 8
KEY_8 = 9
KEY_9 = 10
KEY_0 = 11
KEY_MINUS = 12
KEY_EQUALS = 13
KEY_BACKSPACE = 14
KEY_TAB = 15
KEY_Q = 16
KEY_W = 17
KEY_E = 18
KEY_R = 19
KEY_T = 20
KEY_Y = 21
KEY_U = 22
KEY_I = 23
KEY_O = 24
KEY_P = 25
KEY_LBRACKET = 26
KEY_RBRACKET = 27
KEY_RETURN = 28
KEY_LCONTROL = 29
KEY_A = 30
KEY_S = 31
KEY_D = 32
KEY_F = 33
KEY_G = 34
KEY_H = 35
KEY_J = 36
KEY_K = 37
KEY_L = 38
KEY_SEMICOLON = 39
KEY_APOSTROPHE = 40
KEY_GRAVE = 41
KEY_LSHIFT = 42
KEY_BACKSLASH = 43
KEY_Z = 44
KEY_X = 45
KEY_C = 46
KEY_V = 47
KEY_B = 48
KEY_N = 49
KEY_M = 50
KEY_COMMA = 51
KEY_PERIOD = 52
KEY_SLASH = 53
KEY_RSHIFT = 54
KEY_NUMPADSTAR = 55
KEY_LALT = 56
KEY_SPACE = 57
KEY_CAPSLOCK = 58
KEY_F1 = 59
KEY_F2 = 60
KEY_F3 = 61
KEY_F4 = 62
KEY_F5 = 63
KEY_F6 = 64
KEY_F7 = 65
KEY_F8 = 66
KEY_F9 = 67
KEY_F10 = 68
KEY_NUMLOCK = 69
KEY_SCROLL = 70
KEY_NUMPAD7 = 71
KEY_NUMPAD8 = 72
KEY_NUMPAD9 = 73
KEY_NUMPADMINUS = 74
KEY_NUMPAD4 = 75
KEY_NUMPAD5 = 76
KEY_NUMPAD6 = 77
KEY_ADD = 78
KEY_NUMPAD1 = 79
KEY_NUMPAD2 = 80
KEY_NUMPAD3 = 81
KEY_NUMPAD0 = 82
KEY_NUMPADPERIOD = 83
KEY_OEM_102 = 86
KEY_F11 = 87
KEY_F12 = 88
KEY_F13 = 100
KEY_F14 = 101
KEY_F15 = 102
KEY_KANA = 112
KEY_ABNT_C1 = 115
KEY_CONVERT = 121
KEY_NOCONVERT = 123
KEY_YEN = 125
KEY_ABNT_C2 = 126
KEY_NUMPADEQUALS = 141
KEY_PREVTRACK = 144
KEY_AT = 145
KEY_COLON = 146
KEY_UNDERLINE = 147
KEY_KANJI = 148
KEY_STOP = 149
KEY_AX = 150
KEY_UNLABELED = 151
KEY_NEXTTRACK = 153
KEY_NUMPADENTER = 156
KEY_RCONTROL = 157
KEY_MUTE = 160
KEY_CALCULATOR = 161
KEY_PLAYPAUSE = 162
KEY_MEDIASTOP = 164
KEY_VOLUMEDOWN = 174
KEY_VOLUMEUP = 176
KEY_WEBHOME = 178
KEY_NUMPADCOMMA = 179
KEY_NUMPADSLASH = 181
KEY_SYSRQ = 183
KEY_RALT = 184
KEY_PAUSE = 197
KEY_HOME = 199
KEY_UPARROW = 200
KEY_PGUP = 201
KEY_LEFTARROW = 203
KEY_RIGHTARROW = 205
KEY_END = 207
KEY_DOWNARROW = 208
KEY_PGDN = 209
KEY_INSERT = 210
KEY_DELETE = 211
KEY_LWIN = 219
KEY_RWIN = 220
KEY_APPS = 221
KEY_POWER = 222
KEY_SLEEP = 223
KEY_WAKE = 227
KEY_WEBSEARCH = 229
KEY_WEBFAVORITES = 230
KEY_WEBREFRESH = 231
KEY_WEBSTOP = 232
KEY_WEBFORWARD = 233
KEY_WEBBACK = 234
KEY_MYCOMPUTER = 235
KEY_MAIL = 236
KEY_MEDIASELECT = 237
KEY_MOUSE0 = 256
KEY_LEFTMOUSE = 256
KEY_MOUSE1 = 257
KEY_RIGHTMOUSE = 257
KEY_MOUSE2 = 258
KEY_MIDDLEMOUSE = 258
KEY_MOUSE3 = 259
KEY_MOUSE4 = 260
KEY_MOUSE5 = 261
KEY_MOUSE6 = 262
KEY_MOUSE7 = 263
KEY_JOY0 = 272
KEY_JOY1 = 273
KEY_JOY2 = 274
KEY_JOY3 = 275
KEY_JOY4 = 276
KEY_JOY5 = 277
KEY_JOY6 = 278
KEY_JOY7 = 279
KEY_JOY8 = 280
KEY_JOY9 = 281
KEY_JOY10 = 282
KEY_JOY11 = 283
KEY_JOY12 = 284
KEY_JOY13 = 285
KEY_JOY14 = 286
KEY_JOY15 = 287
KEY_JOY16 = 288
KEY_JOY17 = 289
KEY_JOY18 = 290
KEY_JOY19 = 291
KEY_JOY20 = 292
KEY_JOY21 = 293
KEY_JOY22 = 294
KEY_JOY23 = 295
KEY_JOY24 = 296
KEY_JOY25 = 297
KEY_JOY26 = 298
KEY_JOY27 = 299
KEY_JOY28 = 300
KEY_JOY29 = 301
KEY_JOY30 = 302
KEY_JOY31 = 303
TOTAL_KEYS = 512
AXIS_LX = 0
AXIS_LY = 1
AXIS_RX = 2
AXIS_RY = 3
CURSOR_CAMERA = 0
FLEXI_CAM = 1
FIXED_CAMERA = 2
FREE_CAMERA = 4
DUMMY_PHYSICS = -1
STANDARD_PHYSICS = 0
RIPPER_PHYSICS = 1
CAP_NONE = 0
CAP_NEVER = 0
TRUE = 1
FALSE = 0
UPDATE_HERTZ = 10.0

class Functor:
    """Simple Functor class"""

    def __init__(self, fn, *args):
        self.fn = fn
        self.args = args

    def __call__(self, *args):
        try:
            self.fn(*(self.args + args))
        except Exception, why:
            print why
            print 'Error: Functor.__call__', self.fn, self.args


def buildBindList(downList):
    """Builds a list of down-key (keys that must all be held down in
        order for a predicate to be true,) and a list of not-down keys (key
        combinations that cannot also be down for the predicate to be true.)
        
        It accepts a list of pairs, consisting of a list and some other data type
        (not important except for a not-equal comparison,) and returns a list of
        triples, consisting of the down-key list, the not-down keys list, and the
        data type."""
    bindList = []
    for (downKeys, predicate) in downList:
        notDownLists = []
        for (otherDownKeys, otherPredicate) in downList:
            if predicate != otherPredicate:
                containedEntirely = 1
                for key in downKeys:
                    containedEntirely = containedEntirely and key in otherDownKeys

                if containedEntirely:
                    notDownList = []
                    for otherKey in otherDownKeys:
                        if otherKey not in downKeys:
                            notDownList.append(otherKey)

                    notDownLists.append(notDownList)

        bindList.append((downKeys, notDownLists, predicate))

    return bindList


def printBindList(bindList):
    """Accepts a bind list (a triple consisting of a down-key list,
        a not-down keys list, and a predicate,) and prints it.

        This method uses the BigWorld module in order to keep itself compatible
        with the C++ values for the keys."""
    for (downKeys, notDownKeysList, predicate) in bindList:
        print '[ ',
        for downKey in downKeys:
            print BigWorld.keyToString(downKey), ' ',

        print '] { ',
        for notDownKeys in notDownKeysList:
            print '[ ',
            for notDownKey in notDownKeys:
                print BigWorld.keyToString(notDownKey), ' ',

            print '] ',

        print '}'