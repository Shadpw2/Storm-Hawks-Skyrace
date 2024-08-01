# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Vendor.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

class Vendor(BigWorld.Entity):
    WALLOP_M_1 = 0
    HUMAN_M_1 = 1
    characterNames = {WALLOP_M_1: 'Endo', 
       HUMAN_M_1: 'Arix'}
    modelNames = {WALLOP_M_1: ('characters/wallop/male/models/body/char_wallop_m_body.model', ), 
       HUMAN_M_1: ('characters/human/male/models/body/char_human_m_body.model', 'characters/human/male/models/body/char_human_m_head.model')}
    modelAttachments = {WALLOP_M_1: (), 
       HUMAN_M_1: ('characters/human/male/models/hair/char_human_m_hair001.model', )}
    modelAttachmentHPs = {WALLOP_M_1: (), 
       HUMAN_M_1: ('head', )}
    idleAnimNames = {WALLOP_M_1: 'anim_wallop_m_idleaction001', 
       HUMAN_M_1: 'idle001'}
    costumeDyes = {WALLOP_M_1: 'lambert3_skinned', 
       HUMAN_M_1: 'bodytext_skinned'}
    costumeTints = {WALLOP_M_1: ('Default', 'custom 1', 'custom 2', 'custom 3', 'custom 4', 'custom 5'), 
       HUMAN_M_1: ('Default', 'outfit001', 'outfit002', 'outfit003')}

    def __init__(self):
        BigWorld.Entity.__init__(self)

    def prerequisites(self):
        return [
         Vendor.modelNames[self.vendorType]]

    def set_vendorType(self):
        if self.vendorType not in Vendor.modelNames.keys():
            self.vendorType = Vendor.WALLOP_M_1
        if self.costumeNum not in range(len(Vendor.costumeTints[self.vendorType])):
            self.costumeNum = 0
        self.model = BigWorld.Model(*Vendor.modelNames[self.vendorType])
        attachPtTuple = Vendor.modelAttachmentHPs[self.vendorType]
        if len(attachPtTuple) > 0:
            for attachNum in range(len(attachPtTuple)):
                setattr(self.model, attachPtTuple[attachNum], BigWorld.Model(Vendor.modelAttachments[self.vendorType][attachNum]))

        setattr(self.model, Vendor.costumeDyes[self.vendorType], Vendor.costumeTints[self.vendorType][self.costumeNum])
        self.model.action(Vendor.idleAnimNames[self.vendorType])()
        motor = self.model.motors[0]
        motor.entityCollision = 1
        motor.collisionRooted = 1
        self.filter = BigWorld.DumbFilter()
        self.targetCaps = [
         1]

    def enterWorld(self):
        self.set_vendorType()
        model = self.model
        from Bitcasters.Math import MatrixProduct, TranslationMatrix
        from Bitcasters.layers.Factory import create
        self.info_gui = create('target_npc', 0.03, None, player_name='Right-click to buy and sell items', matrix=MatrixProduct(TranslationMatrix(0, model.height, 0), model.matrix), trap_background_clicks=False)
        self.info_gui.set('name', False)
        return

    def leaveWorld(self):
        self.model = None
        self.info_gui.cleanup()
        return

    def context_options(self, player_friends):
        return [
         ('trade', 'Buy and sell items.')]

    def name_for_context_menu(self):
        return self.name_for_shop_gui() + ' (Shopkeeper)'

    def is_trade_target_of(self, user):
        from BWPersonality import changeMode
        changeMode('ShopMode', self.id)

    def usedBy(self, user):
        self.info_gui.set('name', False)
        self.is_trade_target_of(user)

    def highlight(self, setting):
        if setting:
            self.info_gui.set('name', False)

    def name_for_shop_gui(self):
        return Vendor.characterNames[self.vendorType]