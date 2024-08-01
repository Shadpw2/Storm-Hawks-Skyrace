# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/PlanePhysics.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Util import ignore
from Sound import *
BoostFlag = False

class PlanePhysics(object):
    from keys import RIPPER_PHYSICS
    TYPE = RIPPER_PHYSICS
    FILTER = BigWorld.PlayerAvatarFilter
    MIN_THRUST = 2.0
    BOOST_THRUST = 50.0

    def __init__(self, owner):
        global BoostFlag
        physics = owner.physics
        try:
            physics.takeoffAndLanding = 0
        except:
            print 'Current Client/physics does not support this attribute.'

        physics.ripperDesiredHeightFromGround = 9
        physics.ripperMinHeightFromGround = 8.9
        physics.ripperThrustDropOffHeight = 11
        physics.ripperElasticity = 0.3
        physics.ripperGravity = 30
        physics.ripperTurnRate = 0.5
        physics.ripperXDrag = 1
        physics.ripperYUpDrag = 0.7
        physics.ripperZDrag = 0.9
        physics.planeNormalHover = False
        self.position = lambda : owner.position
        self._lastpos = self.position()
        self.physics = owner.physics
        self._held = False
        self.stop = physics.stop
        self.animate = lambda x: owner.model.action(x)()
        self.x = 0
        self.z = 0
        self.oldact = None
        BoostFlag = False
        StopContinuousEffect('effects/engineidle')
        StopContinuousEffect('effects/enginerunning')
        PlayContinuousEffect('effects/engineskyride')
        return

    def setDirection(self, lateral, forward):
        self._moving = forward or lateral
        if self._moving:
            dist = (forward ** 2 + lateral ** 2) ** 0.5
            self.x = lateral / dist
            self.z = forward / dist

    def holdStill(self):
        self._held = True

    def resumeMoving(self):
        self._held = False

    def walk(self):
        pass

    def run(self):
        pass

    def toggleTurboMode(self):
        pass

    def boost(self):
        global BoostFlag
        BoostFlag = True

    def update(self):
        global BoostFlag
        (px, py, pz) = self.position()
        (dx, dy, dz) = self.position() - self._lastpos
        self._lastpos = (px, py, pz)
        if BoostFlag:
            self.physics.thrust = self.BOOST_THRUST
            PlayEffect('effects/boost')
            BoostFlag = False
        else:
            if self._held or not self._moving:
                self.physics.thrust = self.MIN_THRUST
                self.physics.turn = 0
                return
            thrust = self.z * 3.5
            self.physics.thrust = thrust if thrust > 0 else self.MIN_THRUST
            self.physics.turn = self.x

    def checkAnims(self):
        p = self.physics
        if p.ripperZDrag < 1:
            if p.thrust < 0:
                p.brake = -p.thrust
                p.thrust = 0
            else:
                p.brake = 0
        dir = 0 if p.turn < 0 else 2 if (p.turn > 0) else 1
        if self.oldact == dir:
            return
        self.oldact = dir
        self.animate(('leftplane', 'fly', 'rightplane')[dir])