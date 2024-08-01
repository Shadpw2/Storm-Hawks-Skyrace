# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/BipedPhysics.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Util import ignore
from Sound import *
from NetInfo import *

class BipedPhysics(object):
    from keys import STANDARD_PHYSICS
    TYPE = STANDARD_PHYSICS
    FILTER = BigWorld.PlayerAvatarFilter
    UNDERGROUND_THRESHOLD = -100
    RUN_SPEED = 9
    WALK_SPEED = 1.8
    TURBO_FACTOR = 12

    def __init__(self, owner):
        physics = owner.physics
        physics.velocityMouse = 'Direction'
        physics.collide = True
        physics.fall = True
        self.position = lambda : owner.position
        self.stop = physics.stop
        self.setVelocity = lambda x, y, z: setattr(physics, 'velocity', (x, y, z))
        self.seek = physics.seek
        self.owner = owner
        self._running = True
        self._moving = False
        self._turbo = False
        self._held = False
        self._seeking = False
        self._lastpos = self.position()
        self.x = 0
        self.z = 0
        initShowNetInfo()
        StopContinuousEffect('effects/engineidle')
        StopContinuousEffect('effects/enginerunning')
        StopContinuousEffect('effects/engineskyride')

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
        self._running = False

    def run(self):
        self._running = True

    def toggleTurboMode(self):
        self._turbo = not self._turbo

    def boost(self):
        pass

    def seekTo(self, xyz, yaw, successAction=ignore, failAction=ignore):

        def callback(success):
            print 'SEEK FINISHED:', success
            self._seeking = False
            (successAction if success else failAction)()

        self._seeking = True
        self.setVelocity(0, 0, self.speed())
        seekpos = tuple(xyz) + (yaw,)
        print 'seek to:', seekpos
        self.seek(seekpos, 10, 10, callback)

    def speed(self):
        return (self.RUN_SPEED if self._running and self.z >= 0 else self.WALK_SPEED) * (self.TURBO_FACTOR if self._turbo else 1)

    def update(self):
        spawnShowNetInfo()
        (px, py, pz) = self.position()
        (dx, dy, dz) = self.position() - self._lastpos
        self._lastpos = (px, py, pz)
        if py < self.UNDERGROUND_THRESHOLD:
            print 'UNDERGROUND:', py
            from Bitcasters.mode.handlers import moveToHome
            moveToHome(self.owner)
            return
        if not self._seeking:
            self.setVelocity(self.x * self.speed(), 0, self.z * self.speed())
            if self._held or not self._moving:
                self.stop()
                return