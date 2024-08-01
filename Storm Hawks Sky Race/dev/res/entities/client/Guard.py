# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Guard.py
# Compiled at: 2008-12-16 09:35:38
import math, BigWorld
from keys import *
from Math import *
from Avatar import Avatar

class Guard(Avatar):
    VISIBLE_RANGE = 30

    def enterWorld(self):
        self.model = BigWorld.Model('vehicles/Air Skimmer III Standard/models/skim_as3-standard_static.model')
        motor = self.model.motors[0]
        motor.entityCollision = 1
        motor.collisionRooted = 0
        self.filter = BigWorld.AvatarFilter()
        self.targetCaps = [1]