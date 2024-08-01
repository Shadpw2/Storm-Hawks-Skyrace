# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/CharCreationColours.py
# Compiled at: 2008-12-16 09:35:38


def hex(value):
    return tuple((eval('0x%s' % value[i * 2 + 1:i * 2 + 3]) for i in range(3)))


eyeColour = (
 hex('#ff0000'),
 hex('#ff00ff'),
 hex('#0000ff'),
 hex('#00ffff'),
 hex('#00ff00'),
 hex('#ffff00'),
 hex('#ff0000'))
skinColour = (
 hex('#ead5b0'),
 hex('#9e664e'),
 hex('#bdaa5e'),
 hex('#ead5b0'))
hairColour1 = (
 (244, 181, 94),
 (148, 63, 27),
 (17, 17, 17),
 (223, 0, 0),
 (255, 167, 0),
 (10, 175, 60),
 (0, 145, 187),
 (40, 54, 147),
 (121, 38, 149),
 (223, 0, 0))
hairColour2 = (
 (249, 205, 115),
 (172, 86, 45),
 (63, 63, 91),
 (252, 40, 10),
 (255, 238, 26),
 (55, 213, 28),
 (27, 209, 209),
 (27, 96, 209),
 (193, 56, 239),
 (223, 0, 0))
clothesColour1 = (
 (133, 83, 58),
 (133, 117, 56),
 (235, 249, 250),
 (98, 98, 98),
 (198, 74, 74),
 (198, 198, 74),
 (74, 198, 74),
 (74, 198, 198),
 (74, 74, 198),
 (198, 74, 198),
 (198, 74, 74))
clothesColour2 = (
 (107, 44, 44),
 (107, 73, 42),
 (182, 227, 232),
 (40, 40, 40),
 (132, 23, 23),
 (131, 131, 22),
 (22, 131, 22),
 (22, 131, 131),
 (39, 39, 114),
 (131, 22, 131),
 (132, 23, 23))