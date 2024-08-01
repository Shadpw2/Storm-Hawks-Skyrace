# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Util.py
# Compiled at: 2008-12-16 09:35:38


def ignore(*args, **kwargs):
    pass


WHISPER = 0
YELL = 1
FRIENDS = 2
SOLO_WIN = -1
SOLO_LOSE = -2
FORFEIT = -3
SPACE_NAME = 'saharr_test_2'

def clamp(low, value, high):
    """Return value clamped to between low and high."""
    return min(max(low, value), high)