# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/SpaceViewer.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

class SpaceViewer(BigWorld.Entity):

    def enterWorld(self):
        pass


class PlayerSpaceViewer(SpaceViewer):

    def enterWorld(self):
        SpaceViewer.enterWorld(self)

    def handleKeyEvent(self, isDown, key, mods):
        pass