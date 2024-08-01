# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/CharCreationScene.py
# Compiled at: 2008-12-16 09:35:38
from Bitcasters.Math import Matrix, RADIANS, DEGREES
from Bitcasters.Const import makeSpaceAndViewer, addViewer
from Bitcasters.CharacterModel import HumanCharacter
import BigWorld
from BWMath import Vector3
from keys import STANDARD_PHYSICS
FACINGS = 28
DEGS_PER_FACING = 360.0 / FACINGS
RADS_PER_FACING = DEGS_PER_FACING * DEGREES / RADIANS

class CharCreationScene(object):

    def __init__(self, viewerEntity):
        self.setViewer(viewerEntity)
        from Bitcasters.RepeatedTask import RepeatedTask
        self.update_animation = RepeatedTask(self.animate)
        self.update_animation.start()

    def setViewer(self, entity):
        self.viewerEntity = entity
        viewer = self.viewer()
        self.cm = HumanCharacter(viewer, 0, {})
        viewer.model = None
        BigWorld.controlEntity(viewer, True)
        viewer.physics = STANDARD_PHYSICS
        physics = viewer.physics
        physics.userDirected = 0
        physics.fall = 1
        self.oscillator = None
        self.mod = self.cm._body
        self.mod.delMotor(self.mod.motors[0])
        self.facing = 0
        self.aim(1.25, -0.75, -0.25)
        return

    def viewer(self):
        return self.viewerEntity

    def aim(self, x, y, z):
        pos = Vector3(self.viewer().position[0], 0, self.viewer().position[2])
        at = Vector3(pos + Vector3(x, y, z))
        direction = Vector3(0.0, 0.0, 1.0)
        from Cameras import AimCursorCameraTo
        AimCursorCameraTo(at, direction)

    def animate(self):
        from random import random, choice
        if random() < 0.02 and not self.cm.emoting():
            try:
                self.cm.gesture(choice(('wave001', 'fistpump001', 'bowing001', 'defeat001')))()
            except:
                pass

    def _destroy(self):
        self.update_animation.suspend()
        self.hide()

    def adjustModel(self, name, value):
        if name in ('class', 'species', 'name'):
            return
        if name == 'inventory':
            for (k, v) in value.items():
                from InventoryItem import equipment
                if equipment(k):
                    v.apply_to(self.cm)

        else:
            setattr(self.cm, name, value)

    def hide(self):
        self.viewer().model = None
        self.mod = self.cm._body
        return

    def show(self):
        viewer = self.viewer()
        self.hide()
        viewer.model = self.mod
        pos = viewer.position
        viewer.physics.teleport((pos.x, 0, pos.z), (180 * DEGREES, 0, 0))