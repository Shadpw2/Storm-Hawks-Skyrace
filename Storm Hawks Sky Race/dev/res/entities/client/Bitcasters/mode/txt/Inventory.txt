# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Inventory.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, ResMgr
from cursor import cursor
from Util import ignore
from keys import *
from Mode import Mode
from Cameras import AimInventoryCameraAt, AimCursorCameraAt
from InventoryItem import keyToSlotID, slotIDToKey

class Inventory(Mode):

    def __init__(self, handler):
        cursor('mouse')
        cursor.locked = True
        Mode.__init__(self, handler, {KEY_ESCAPE: [
                      ignore, self.click_exit], 
           KEY_I: [
                 ignore, self.click_exit]})
        from Bitcasters.layers.Factory import create
        self.layer = create('inventory', 0.75, owner=self, full=True)
        self.updateInventory()
        AimInventoryCameraAt(BigWorld.player())
        cursor.locked = False

    def cleanup(self):
        self.layer.cleanup()

    def click_icon(self, component):
        slotID = keyToSlotID((0, int(component)))
        if slotID in BigWorld.player().inventory:
            BigWorld.player().base.manageInventory(slotID)

    def click_exit(self):
        """Return to the game world."""
        from BWPersonality import changeMode
        AimCursorCameraAt(BigWorld.player())
        changeMode('WorldMode')

    def updateInventory(self, *ignored):
        p = BigWorld.player()
        self.layer.update(p.gold, p.inventory)