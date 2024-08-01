# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/BikePhysics.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Util import ignore
from Sound import *
from NetInfo import *
BoostFlag = False
oldThrust = 0

class BikePhysics(object):
    from keys import RIPPER_PHYSICS
    TYPE = RIPPER_PHYSICS
    FILTER = BigWorld.PlayerAvatarFilter
    MIN_THRUST = 0
    BOOST_THRUST = 40.0

    def __init__(self, owner):
        global BoostFlag
        physics = owner.physics
        physics.collide = 1
        try:
            physics.takeoffAndLanding = 0
        except:
            print 'Current Client/physics does not support takeoffAndLanding.'

        try:
            physics.planeNormalHover = True
        except:
            print 'Current Client/physics does not support planeNormalHover.'

        physics.ripperDesiredHeightFromGround = 0.5
        physics.ripperMinHeightFromGround = 0.5
        physics.ripperThrustDropOffHeight = 1.5
        physics.ripperElasticity = 0
        physics.ripperGravity = 45
        physics.ripperTurnRate = 0.75
        physics.ripperXDrag = 2
        physics.ripperYUpDrag = 5
        physics.ripperZDrag = 0.999
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
        StopContinuousEffect('effects/engineskyride')
        return

    def setDirection(self, lateral, forward):
        global oldThrust
        import BWPersonality
        spawnShowNetInfo()
        tmpThrust = oldThrust
        if forward == 0 and oldThrust > 0:
            oldThrust -= 0.005
            if oldThrust < 0:
                oldThrust = 0
        elif forward == 0 and oldThrust < 0:
            oldThrust = self.physics.thrust
        if oldThrust >= self.BOOST_THRUST - 1 and BoostFlag == False:
            oldThrust = 2.5
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
        global oldThrust
        import BWPersonality
        tmpThrust = oldThrust
        (px, py, pz) = self.position()
        (dx, dy, dz) = self.position() - self._lastpos
        self._lastpos = (px, py, pz)
        if BoostFlag:
            oldThrust = self.BOOST_THRUST
            PlayEffect('effects/boost')
        elif self._held or not self._moving:
            self.physics.thrust = 0
            self.physics.turn = 0
            PlayContinuousEffect('effects/engineidle')
            StopContinuousEffect('effects/enginerunning')
            return
        if oldThrust >= self.BOOST_THRUST - 1 and BoostFlag == False:
            oldThrust = 2.5
        if self.z > 0:
            if oldThrust < 0:
                oldThrust = 0
            if oldThrust < self.BOOST_THRUST - 1:
                oldThrust += (2.5 - oldThrust) * 0.2
            if oldThrust > 2.5 and oldThrust < self.BOOST_THRUST - 1:
                oldThrust = 2.5
        if self.z < 0:
            oldThrust -= 0.625
            if oldThrust < -2.5:
                oldThrust = -2.5
        self.physics.thrust = oldThrust
        tempThrust = self.physics.thrust
        if tempThrust < 0:
            tempThrust = 0
        if tempThrust > 2.5:
            tempThrust = 2.5
        self.physics.turn = self.x * (0.6 + 3.0 * (1.0 - tempThrust / 2.5 * (tempThrust / 2.5)))
        if BoostFlag:
            BoostFlag = False
        if self._moving:
            StopContinuousEffect('effects/engineidle')
            PlayContinuousEffect('effects/enginerunning')
        else:
            PlayContinuousEffect('effects/engineidle')
            StopContinuousEffect('effects/enginerunning')

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
        self.animate(('left', 'bike', 'right')[dir])