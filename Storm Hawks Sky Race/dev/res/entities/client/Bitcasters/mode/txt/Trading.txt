# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Trading.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI
from cursor import cursor
from Mode import Mode
from InventoryItem import keyToSlotID, slotIDToKey

class Trading(Mode):

    def __init__(self, handler, name):
        cursor('mouse')
        Mode.__init__(self, handler, {})
        self.getting = []
        self.getting_details = []
        self.giving = []
        from Bitcasters.layers.Factory import create
        self.inventory = create('inventory', 0.7, owner=self, full=False)
        self.trade = create('trade', 0.75, owner=self)
        p = BigWorld.player()
        bg = self.trade.components['trading_bg']
        bg.write('your_name', p.name)
        bg.write('other_name', name)
        self.clearAcceptance()
        self.updateInventory()

    def setAccepted(self, value):
        self.trade.components['other_accepted'].setMapping(int(value))

    def setLocalAccepted(self, value):
        self.trade.components['your_accepted'].setMapping(int(value))

    def clearAcceptance(self):
        self.setAccepted(False)
        self.trade.components['accept_refuse'].on = True
        self.setLocalAccepted(False)

    def component_click_accept_refuse(self, component):
        if component.on:
            self.setLocalAccepted(False)
            BigWorld.player().base.refuseTrade()
        else:
            self.setLocalAccepted(True)
            BigWorld.player().base.acceptTrade(BigWorld.player().expected_trader, self.giving, self.getting)

    def click_exit(self):
        from BWPersonality import changeMode
        changeMode('WorldMode')
        BigWorld.player().base.endTrade()

    def click_icon(self, component):
        BigWorld.player().base.addToTrade(keyToSlotID((0, int(component))))

    def click_give(self, component):
        BigWorld.player().base.removeFromTrade(self.giving[int(component)], True)

    def click_get(self, component):
        BigWorld.player().base.removeFromTrade(self.getting[int(component)], False)

    def cleanup(self):
        self.inventory.cleanup()
        self.trade.cleanup()

    def endTrade(self):
        self.inventory.fade()
        self.trade.fade()
        from BWPersonality import changeMode
        BigWorld.callback(1, (lambda : changeMode('WorldMode')))

    def tradeChangedAdd(self, slotID, thing, mine):
        self.clearAcceptance()
        if mine:
            self.giving.append(slotID)
        else:
            self.getting.append(slotID)
            self.getting_details.append(thing)
        self.updateInventory()

    def tradeChangedRemove(self, x, mine):
        self.clearAcceptance()
        if mine:
            self.giving.remove(x)
        else:
            position = self.getting.index(x)
            del self.getting[position]
            del self.getting_details[position]
        self.updateInventory()

    def tradeUpdated(self, giving, getting_map):
        self.clearAcceptance()
        self.giving = giving
        (self.getting, self.getting_details) = map(list, zip(*getting_map.items()))
        self.updateInventory()

    def updateInventory(self, clearGiveGet=False):
        if clearGiveGet:
            self.giving = []
            self.getting = []
            self.getting_details = []
            self.clearAcceptance()
        inv = BigWorld.player().inventory
        self.inventory.update(BigWorld.player().gold, inv, self.giving)
        self.trade.update(tuple((inv[id] for id in self.giving)), self.getting_details)