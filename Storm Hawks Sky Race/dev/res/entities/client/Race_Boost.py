# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Race_Boost.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, Pixie
from Sound import *
from Math import *

class Race_Boost(BigWorld.Entity):
    ENTITY_MODEL = 'environments/shared/tracks/power ups/groundboost.model'
    PICKUP_FX_MODEL = 'vfx/vfx-groundboost-posts.model'
    PICKUP_FX_MODEL_ACTION = 'groundboostposts'
    PICKUP_FX_MODEL_NODE = 'Scene Root'
    PICKUP_FX_AIR_NODE = 'HP_vfx'
    HITSPHERE_SIZE = 5.0
    GROUND_ACTION = ()
    AIR_ACTION = ('idle', )
    GROUND_1 = 0
    AIR_1 = 1
    GROUND_2 = 2
    modelNames = {GROUND_1: 'environments/shared/tracks/power ups/groundboost.model', 
       AIR_1: 'environments/shared/tracks/power ups/airbooster.model', 
       GROUND_2: 'environments/shared/tracks/power ups/groundboost002.model'}
    fxModelNames = {GROUND_1: 'vfx/vfx-groundboost-posts.model', 
       AIR_1: 'environments/shared/tracks/power ups/vfx-airbooster.model', 
       GROUND_2: 'environments/shared/tracks/power ups/vfx-groundboost002.model'}
    fxAnimNames = {GROUND_1: 'groundboostposts', 
       AIR_1: 'vfx', 
       GROUND_2: 'vfx'}

    def __init__(self):
        BigWorld.Entity.__init__(self)
        self.collected = False

    def prerequisites(self):
        return [
         Race_Boost.ENTITY_MODEL]

    def set_boostType(self):
        if self.boostType not in Race_Boost.modelNames.keys():
            self.boostType = Race_Boost.GROUND_1
        self.model = BigWorld.Model(Race_Boost.modelNames[self.boostType])
        if self.boostType == Race_Boost.GROUND_1 or self.boostType == Race_Boost.GROUND_2:
            animList = Race_Boost.GROUND_ACTION
            self.attachPoint = Race_Boost.PICKUP_FX_MODEL_NODE
        elif self.boostType == Race_Boost.AIR_1:
            animList = Race_Boost.AIR_ACTION
            self.attachPoint = Race_Boost.PICKUP_FX_AIR_NODE
        for x in animList:
            self.model.action(x)()

        motor = self.model.motors[0]
        motor.entityCollision = 1
        motor.collisionRooted = 1
        self.filter = BigWorld.DumbFilter()

    def enterWorld(self):
        self.set_boostType()
        self.registerRaceItemTrigger()
        self.fxmodel = BigWorld.Model(Race_Boost.fxModelNames[self.boostType])
        self.fxmodel.visible = 0
        self.model.node(self.attachPoint).attach(self.fxmodel)

    def leaveWorld(self):
        self.model = None
        self.unregisterRaceItemTrigger()
        return

    def collect(self):
        if self.collected == True:
            return
        else:
            self.collected = True

        def removePickupModel():
            self.fxmodel.visible = 0
            from Bitcasters.Const import isOnline
            if not isOnline():
                self.replenish()

        self.fxmodel.visible = 1
        self.fxmodel.action(Race_Boost.fxAnimNames[self.boostType])(0, removePickupModel)

    def replenish(self):
        self.collected = False

    def registerRaceItemTrigger(self):
        if self.boostType == Race_Boost.AIR_1:
            matrix = self.model.node('HP_trigger')
            self.pot = BigWorld.addPot(matrix, Race_Boost.HITSPHERE_SIZE, self.hitItemPot)
        elif self.boostType == Race_Boost.GROUND_1 or self.boostType == Race_Boost.GROUND_2:
            matrix = self.matrix
            self.pot = BigWorld.addPot(matrix, Race_Boost.HITSPHERE_SIZE, self.hitItemPot)
        else:
            print 'Race_Boost.py::registerRaceItemTrigger: UNRECOGNIZED BOOST TYPE, COULD NOT ATTACH TRIGGER'

    def unregisterRaceItemTrigger(self):
        BigWorld.delPot(self.pot)
        del self.pot

    def hitItemPot(self, enteredTrap, handle):
        if enteredTrap and not self.collected:
            self.collect()
            collectorEntity = BigWorld.player()
            self.cell.collect(collectorEntity.id)
            if self.boostType == Race_Boost.AIR_1:
                print 'AIR BOOST-- MODEL OF TYPE: ' + `(type(self.model))`
            elif self.boostType == Race_Boost.GROUND_1 or self.boostType == Race_Boost.GROUND_2:
                print 'GROUND BOOST-- MODEL OF TYPE: ' + `(type(self.model))`
            else:
                print 'ERROR BOOST'
            BigWorld.player().user.race.collect_boost()
            BigWorld.player().boost()