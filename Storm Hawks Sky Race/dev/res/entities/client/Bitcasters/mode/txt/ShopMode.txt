# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/ShopMode.py
# Compiled at: 2008-12-16 09:35:38
from Util import ignore
import BWPersonality, ResMgr
from cursor import cursor
from keys import *
from InventoryItem import keyToSlotID, slotIDToKey
from Mode import Mode

class ShopMode(Mode):

    def __init__(self, handler, npc_id):
        cursor('mouse')
        Mode.__init__(self, handler, {KEY_ESCAPE: [
                      self.click_exit, ignore]})
        self.npc_id = npc_id
        from Bitcasters.layers.Factory import create
        self.inventory = create('inventory', 0.7, owner=self, full=False)
        self.shop = create('shop', 0.75, owner=self, full=False)
        self.shop.components['shop'].write('owner', BigWorld.entities[npc_id].name_for_shop_gui())
        self.shop.components['shop'].write('title', 'Clothing Shop')
        self.shop.components['ok'].visible = False
        self.sale = -1
        self.updateInventory()
        BigWorld.entities[npc_id].cell.windowShop()

    def updateInventory(self, *ignored):
        self.player_inventory = BigWorld.player().inventory
        self.inventory.update(BigWorld.player().gold, self.player_inventory)

    def browseShop(self, shop_inventory):
        self.npc_inventory = shop_inventory
        self.shop.update(shop_inventory)

    def click_exit(self):
        """Exit the shop."""
        BWPersonality.changeMode('WorldMode')

    def clearPrice(self, ok_visible):
        self.shop.components['ok'].visible = ok_visible
        if self.sale >= 16:
            self.inventory.components['icon_%d' % (self.sale - 16)].clear_price()
        elif self.sale >= 0:
            self.shop.components['buy_%d' % self.sale].clear_price()

    def click_ok(self):
        if self.sale >= 16:
            BigWorld.player().base.sell(self.sale)
        elif self.sale >= 0:
            BigWorld.entities[self.npc_id].cell.sellTo(self.sale)
        self.clearPrice(False)
        self.sale = -1

    def click_icon(self, component):
        self.clearPrice(True)
        self.sale = keyToSlotID((0, int(component)))
        self.inventory.components['icon_%s' % component].show_price(self.player_inventory[self.sale].cost() / 2)

    def click_buy(self, component):
        id = int(component)
        self.clearPrice(True)
        self.sale = id
        self.shop.components['buy_%s' % component].show_price(self.npc_inventory[id].cost())

    def cleanup(self):
        self.inventory.cleanup()
        self.shop.cleanup()