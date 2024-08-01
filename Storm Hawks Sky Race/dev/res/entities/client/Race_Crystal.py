# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Race_Crystal.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, Pixie
from AnimationWrapper import TimedParticleEffect
from Sound import *

class Race_Crystal(BigWorld.Entity):
    CRYSTAL_MODEL = 'environments/shared/props/Crystals/bluecrystal.model'
    GROUND_CRYSTAL_MODEL_ACTION = 'crystal_rotate'
    AIR_CRYSTAL_MODEL_ACTION = ''
    GROUND_CRYSTAL_HIT_ACTION = ''
    AIR_CRYSTAL_HIT_ACTION = 'hit'
    GROUND_MODEL_ACTION = ()
    AIR_HELI_MODEL_ACTION = ('blades', 'idle')
    GROUND_CRYSTAL_NODE = 'Scene Root'
    AIR_HELI_CRYSTAL_NODE = 'HP_crystal'
    PICKUP_FX_MODEL = 'vfx/vfx-crystalpickup.model'
    PICKUP_FX_MODEL_ACTION = 'crystalpickup'
    PICKUP_PARTICLES = 'crystalpickup'
    PICKUP_PARTICLES_FULLPATH = 'vfx/particles/crystalpickup.xml'
    PICKUP_PARTICLES_NODE = 'HP_attach'
    PICKUP_PARTICLES_STARTDELAY = 0.6
    PICKUP_PARTICLES_DURATION = 2
    HITSPHERE_SIZE = 4.0
    GROUND = 0
    AIR_HELI = 1
    modelNames = {GROUND: 'vfx/emptymodel.model', 
       AIR_HELI: 'environments/shared/tracks/power ups/crystalholder_air.model'}
    REPLENISH_TIME = 10

    def prerequisites(self):
        return [
         Race_Crystal.modelNames]

    def set_itemType(self):
        if self.itemType not in Race_Crystal.modelNames.keys():
            self.itemType = Race_Crystal.GROUND
        self.model = BigWorld.Model(Race_Crystal.modelNames[self.itemType])
        if self.itemType == Race_Crystal.GROUND:
            self.animList = Race_Crystal.GROUND_MODEL_ACTION
            self.attachPoint = Race_Crystal.GROUND_CRYSTAL_NODE
            self.hitAnimList = Race_Crystal.GROUND_CRYSTAL_HIT_ACTION
            self.crystalAnim = Race_Crystal.GROUND_CRYSTAL_MODEL_ACTION
        elif self.itemType == Race_Crystal.AIR_HELI:
            self.animList = Race_Crystal.AIR_HELI_MODEL_ACTION
            self.attachPoint = Race_Crystal.AIR_HELI_CRYSTAL_NODE
            self.hitAnimList = Race_Crystal.AIR_CRYSTAL_HIT_ACTION
            self.crystalAnim = Race_Crystal.AIR_CRYSTAL_MODEL_ACTION
        self.crystalModel = BigWorld.Model(Race_Crystal.CRYSTAL_MODEL)
        self.model.node(self.attachPoint).attach(self.crystalModel)
        if self.crystalAnim != '':
            self.crystalModel.action(self.crystalAnim)()
        for x in self.animList:
            self.model.action(x)()

        motor = self.model.motors[0]
        motor.entityCollision = 0
        motor.collisionRooted = 0
        self.filter = BigWorld.DumbFilter()

    def enterWorld(self):
        self.set_itemType()
        self.pot = BigWorld.addPot(self.matrix, Race_Crystal.HITSPHERE_SIZE, self.hitItemPot)

    def leaveWorld(self):
        self.model = None
        BigWorld.delPot(self.pot)
        del self.pot
        return

    def collectedBy(self, playerID):
        if playerID != BigWorld.player().user.avatar.id:
            self.animateCollection()

    def replenish(self):
        if self.crystalModel.visible:
            return
        self.crystalModel.visible = 1

    def hitItemPot(self, enteredTrap, handle):
        if not enteredTrap:
            return
        assert handle == self.pot
        if not self.collected:
            BigWorld.player().user.race.collect_crystal()
            self.animateCollection()
            BigWorld.callback(Race_Crystal.REPLENISH_TIME, self.replenish)
        BigWorld.player().user.avatar.cell.attemptToCollect(self.id)

    def animateCollection(self):
        if not self.crystalModel.visible:
            return
        self.crystalModel.visible = 0
        attachNode = self.model.node(self.attachPoint)
        PlayEffect('effects/gotcrystal')

        def removePickupModel():
            attachNode.detach(self.pickupFXModel)

        self.pickupFXModel = BigWorld.Model(Race_Crystal.PICKUP_FX_MODEL)
        attachNode.attach(self.pickupFXModel)
        self.pickupFXModel.action(Race_Crystal.PICKUP_FX_MODEL_ACTION)(0, removePickupModel)

        def idleAnimAfterHit():
            for x in self.animList:
                self.model.action(x)()

        if self.hitAnimList != '':
            self.model.action(self.hitAnimList)(0, idleAnimAfterHit)

        def psStart():
            attachNode.attach(self.ps)

        def psStop():
            attachNode.detach(self.ps)

        self.ps = Pixie.create(Race_Crystal.PICKUP_PARTICLES_FULLPATH)
        BigWorld.callback(Race_Crystal.PICKUP_PARTICLES_STARTDELAY, psStart)
        BigWorld.callback(Race_Crystal.PICKUP_PARTICLES_DURATION + Race_Crystal.PICKUP_PARTICLES_STARTDELAY, psStop)