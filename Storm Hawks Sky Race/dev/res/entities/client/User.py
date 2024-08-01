# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/User.py
# Compiled at: 2008-12-16 09:35:38
from Math import Vector3
import BigWorld
from Bitcasters.Const import isOnline
from RaceInfo import RaceInfo
from Util import ignore

class User(object):

    def __init__(self, avatar):
        self.race = RaceInfo()
        self.avatar = avatar
        self.model = avatar.model
        self.cm = avatar.cm
        self.changingVehicle = False
        self.instabike = 0
        from Avatar import Avatar
        assert isinstance(avatar, Avatar)
        self.setupTimeouts()

    def setupTimeouts(self):
        self.model.motors[0].boredNotifier = self.timeout
        self.model.motors[0].patience = 5

    def timeout(self, boredOf):
        matcher = self.model.motors[0]
        if boredOf != matcher.lastMatch:
            matcher.fuse = 0
        else:
            timeout_actions = {'idle001': 'idleaction001'}
            if boredOf in timeout_actions:
                self.startGesture(timeout_actions[boredOf])

    def startGesture(self, actionName):
        avatar = self.avatar
        model = self.model
        model.motors[0].patience = 5
        avatar.queued = self.cm.gesture(actionName)
        avatar.queued()
        if not actionName.startswith('idle'):
            avatar.holdStill()
            BigWorld.callback(avatar.queued.action.duration, avatar.resumeMoving)
        if self.ownClient():
            avatar.cell.startGesture(actionName)

    def ownClient(self):
        return self.avatar == BigWorld.player()

    def abortGesture(self):
        avatar = self.avatar
        model = self.model
        if avatar.queued is not None:
            avatar.queued.stop()
        avatar.queued = None
        if self.ownClient():
            avatar.cell.abortGesture()
        return

    def update(self):
        if self.changingVehicle:
            return 0
        assert self.ownClient()
        return self.avatar.ph.update()

    def setVehicle(self, vehicleType, physics):
        from Bitcasters.CharacterModel import Skyride
        vehicle = [
         None, Skyride()][vehicleType]
        self.changingVehicle = True
        from Cameras import AimFlexiCamAt, AimCursorCameraAt
        avatar = self.avatar
        if vehicle:
            if self.ownClient():
                AimFlexiCamAt(avatar)
                avatar.targetBlur(None)
                BigWorld.target.caps(0)
            self.model.motors[0].matchCaps = [
             0]
        else:
            if self.ownClient():
                AimCursorCameraAt(avatar)
                BigWorld.target.caps(1, 7)
            self.model.motors[0].matchCaps = []
            self.setupTimeouts()
        avatar.cm.setVehicle(vehicle)
        __import__('Physics').attach(avatar, physics)
        self.changingVehicle = False
        return

    def teleport(self, position, direction):
        avatar = self.avatar
        x = avatar.model.motors[:]
        for motor in x:
            avatar.model.delMotor(motor)

        self.avatar.physics.teleport(position, direction)
        for motor in x:
            avatar.model.addMotor(motor)

    def teleportSpace(self, spaceID):
        print self.avatar, 'WILL TELEPORT TO SPACE:', spaceID
        self.avatar.physics.teleportSpace(spaceID)

    def beginHeadToHeadRace(self, target, trackID):
        self.race.beginHeadToHead(target, trackID)

    def beginSoloRace(self, trackID):
        self.race.beginSolo(trackID)