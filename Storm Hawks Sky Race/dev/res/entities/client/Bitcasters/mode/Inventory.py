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
from InventoryItem import keyToSlotID, slotIDToKey, serialize
from Bitcasters.OfflineSave import save_offline_state

class Inventory(Mode):

    def __init__(self, handler):
        print '[Inventory] __init__ start'
        cursor('mouse')
        cursor.locked = True
        print '[Inventory] cursor locked, building command map'
        Mode.__init__(self, handler, {KEY_ESCAPE: [
                      ignore, self.click_exit], 
           KEY_I: [
                 ignore, self.click_exit]})
        from Bitcasters.layers.Factory import create
        print '[Inventory] creating layer...'
        self.layer = create('inventory', 0.75, owner=self, full=True)
        print '[Inventory] layer created OK, calling updateInventory()'
        self.updateInventory()
        print '[Inventory] updateInventory() OK, aiming camera'
        AimInventoryCameraAt(BigWorld.player())
        print '[Inventory] camera aimed OK, unlocking cursor'
        cursor.locked = False
        print '[Inventory] __init__ complete, cursor unlocked'

    def cleanup(self):
        print '[Inventory] cleanup() called'
        self.layer.cleanup()
        print '[Inventory] cleanup() complete'

    def click_icon(self, component):
        print '[Inventory] click_icon(%r)' % (component,)
        slotID = keyToSlotID((0, int(component)))
        p = BigWorld.player()
        inv = getattr(p, 'inventory', {}) or {}
        print '[Inventory] click_icon slotID=%r, player.inventory=%r' % (slotID, inv)

        if slotID not in inv:
            print '[Inventory] click_icon: slot %r is empty, nothing to equip' % (slotID,)
            return

        # There's no .base for offline entities (same category of bug
        # as the old shop buy stub -- see ShopMode.click_ok()), so the
        # equip swap is done directly here instead of relying on
        # BigWorld.player().base.manageInventory(slotID), which always
        # threw and silently did nothing. Move the clicked bag item
        # into the equipped slot (0); whatever was equipped before (if
        # anything) goes back into the now-free bag slot.
        clicked_item = inv[slotID]
        previously_equipped = inv.get(0)

        del inv[slotID]
        inv[0] = clicked_item
        if previously_equipped is not None:
            inv[slotID] = previously_equipped

        p.inventory = inv
        try:
            p.equipped = serialize({0: clicked_item})
        except Exception, e:
            print '[Inventory] click_icon: failed to serialize equipped item:', e

        try:
            p.refreshEquipment()
            print '[Inventory] click_icon: refreshEquipment() OK'
        except Exception, e:
            print '[Inventory] click_icon: refreshEquipment() failed:', e

        self.updateInventory()

        try:
            save_offline_state(getattr(p, 'name', 'Unnamed'), p)
        except Exception, e:
            print '[Inventory] click_icon: failed to persist equip change:', e

        print '[Inventory] click_icon: equipped item from slot %r' % (slotID,)

    def click_exit(self):
        """Return to the game world."""
        print '[Inventory] click_exit start'
        from BWPersonality import changeMode
        player = BigWorld.player()
        BigWorld.dcursor().yawPitch(player.yaw)
        AimCursorCameraAt(player)
        print '[Inventory] click_exit camera done, calling changeMode(WorldMode)'
        changeMode('WorldMode')
        print '[Inventory] click_exit changeMode() returned -- if cursor is still locked, WorldMode never actually resumed'

    def updateInventory(self, *ignored):
        p = BigWorld.player()
        print '[Inventory] updateInventory: gold=%r inventory=%r' % (getattr(p, 'gold', '<MISSING>'), getattr(p, 'inventory', '<MISSING>'))
        self.layer.update(p.gold, p.inventory)
        print '[Inventory] updateInventory: layer.update() completed OK'