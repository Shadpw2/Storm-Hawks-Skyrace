# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/DummyPhysics.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Util import ignore
from Sound import *

class DummyPhysics(object):
    from keys import DUMMY_PHYSICS
    TYPE = DUMMY_PHYSICS
    FILTER = BigWorld.AvatarDropFilter

    def __init__(self, owner):
        owner.physics.collide = True
        StopContinuousEffect('effects/walk')
        StopContinuousEffect('effects/run')

    def setDirection(self, lateral, forward):
        pass

    def holdStill(self):
        pass

    def resumeMoving(self):
        pass

    def walk(self):
        pass

    def run(self):
        pass

    def toggleTurboMode(self):
        pass

    def boost(self):
        pass

    def seekTo(self, xyz, yaw, successAction=ignore, failAction=ignore):
        failAction()

    def speed(self):
        return 0

    def update(self):
        pass

    def checkAnims(self):
        pass