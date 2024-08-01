# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Console.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

class Console(BigWorld.Entity):
    SAHARR_CITY_1 = 0
    modelNames = {SAHARR_CITY_1: ('environments/shared/props/machines/lists.model', )}
    idleAnimNames = {SAHARR_CITY_1: 'cycle_flippers'}
    deviceActivateAnimNames = {SAHARR_CITY_1: 'PUT ANIM LISTS HERE'}

    def __init__(self):
        BigWorld.Entity.__init__(self)

    def prerequisites(self):
        modelPath = Console.modelNames[self.itemType]
        return [modelPath]

    def set_itemType(self):
        if self.itemType not in Console.modelNames.keys():
            self.itemType = Console.SAHARR_CITY_1
        self.model = BigWorld.Model(*Console.modelNames[self.itemType])
        self.model.action(Console.idleAnimNames[self.itemType])()
        motor = self.model.motors[0]
        motor.entityCollision = 1
        motor.collisionRooted = 1
        self.filter = BigWorld.DumbFilter()
        self.targetCaps = [
         1]

    def enterWorld(self):
        self.set_itemType()
        model = self.model
        from Bitcasters.Math import MatrixProduct, TranslationMatrix
        from Bitcasters.layers.Factory import create
        self.info_gui = create('target_npc', 0.03, None, player_name='Right-click to do time trials or check the leaderboard', matrix=MatrixProduct(TranslationMatrix(0, model.height, 0), model.matrix), trap_background_clicks=False)
        self.info_gui.set('name', False)
        return

    def leaveWorld(self):
        self.model = None
        self.info_gui.cleanup()
        return

    def context_options(self, player_friends):
        return [
         ('race_1', 'Race Tent City Solo.'),
         ('race_2', 'Race The Tunnels Solo.'),
         ('check_lb', 'See the top scores for each track.'),
         ('broadcast', 'Offer to race with anyone!')]

    def usedBy(self, user):
        self.info_gui.set('name', False)
        from BWPersonality import changeMode
        changeMode('Leaderboard')

    def name_for_context_menu(self):
        return 'Lists Console'

    def highlight(self, setting):
        if setting:
            self.info_gui.set('name', False)

    def is_challenged_by(self, user, track):
        user.beginSoloRace(track)