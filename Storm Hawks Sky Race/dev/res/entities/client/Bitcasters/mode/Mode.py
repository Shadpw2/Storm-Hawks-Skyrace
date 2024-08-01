# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Mode.py
# Compiled at: 2008-12-16 09:35:38


class Mode(object):

    def __init__(self, handler, map):
        self.handler = handler
        self.commandmap = map
        self.player = __import__('BigWorld').player()

    def cleanup(self):
        pass

    def key(self, id, mods):
        mapping = self.commandmap.get(id, __import__('Util').ignore)
        try:
            l = len(mapping)
        except:
            return mapping(mods)

        if mods > len(mapping):
            return
        return mapping[mods]()