# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/InventoryItem.py
# Compiled at: 2008-12-16 09:35:38
from items import ITEM_MAP
MAX_SOCKETS = 2
PAGE_SIZE = 12
WEAR_SLOTS = [
 'shirt', None, None, None, 
 None, None, None, None, 
 None, None, 
 None, None, 
 None, None, None, None]
WEAR_SLOT_COUNT = len(WEAR_SLOTS)
TOTAL_SLOT_COUNT = 256

def slotIDToKey(slotID):
    if equipment(slotID):
        return WEAR_SLOTS[slotID]
    slotID -= WEAR_SLOT_COUNT
    return (slotID / PAGE_SIZE, slotID % PAGE_SIZE)


def equipment(slotID):
    return slotID < WEAR_SLOT_COUNT


def keyToSlotID(key):
    if isinstance(key, str):
        return WEAR_SLOTS.index(key)
    return key[0] * PAGE_SIZE + key[1] + WEAR_SLOT_COUNT


def deserialize(descriptions):
    result = {}
    for description in descriptions:
        id = description['inventoryLocation']
        socket = description['socketCode']
        result.setdefault(id, InventoryItem()).insert(description, socket)

    for v in result.values():
        v.verify()

    return result


def serialize(mapping):
    return sum([ v.serialize(k, 1) for (k, v) in mapping.items() ], [])


def test(descriptions):
    descriptions.sort()
    result = serialize(deserialize(descriptions))
    result.sort()
    assert result == descriptions


def swapInventorySlots(mapping, old_slot, new_slot):
    old_empty = old_slot not in mapping
    new_empty = new_slot not in mapping
    if old_empty and new_empty:
        return
    if old_empty:
        mapping[old_slot] = mapping[new_slot]
        del mapping[new_slot]
    elif new_empty:
        mapping[new_slot] = mapping[old_slot]
        del mapping[old_slot]
    else:
        mapping[new_slot], mapping[old_slot] = mapping[old_slot], mapping[new_slot]


class InventoryItem(object):
    """Represents a node in an InventoryItem tree."""

    def __init__(self):
        """Initialize a dummy node for the tree. At the end of the
                tree-building process, every node should get populated by
                populate(). We need this two-phase construction because of
                how our source data is organized..."""
        self.kids = [
         None] * MAX_SOCKETS
        return

    def verify(self):
        """Assert that there are no dummy nodes in the tree."""
        assert hasattr(self, 'prototype')
        assert hasattr(self, 'colours')
        assert hasattr(self, 'condition')
        for kid in self.kids:
            if kid:
                kid.verify()

    def insert(self, data, socket):
        assert socket > 0
        if socket == 1:
            assert not hasattr(self, 'prototype')
            assert not hasattr(self, 'colours')
            assert not hasattr(self, 'condition')
            self.prototype = data['prototype_id']
            self.colours = (data['colour1'], data['colour2'])
            self.condition = data['condition']
            type = ITEM_MAP[self.prototype]['type']
            self.apply_to = getattr(self, 'apply_' + type)
        else:
            child_id = socket % MAX_SOCKETS
            if not self.kids[child_id]:
                self.kids[child_id] = InventoryItem()
            self.kids[child_id].insert(data, socket / MAX_SOCKETS)

    def serialize(self, inventoryLocation, socketCode):
        mydata = {'prototype_id': self.prototype, 
           'colour1': self.colours[0], 
           'colour2': self.colours[1], 
           'condition': self.condition, 
           'inventoryLocation': inventoryLocation, 
           'socketCode': socketCode}
        return sum([ kid.serialize(inventoryLocation, socketCode * MAX_SOCKETS + i) for (i, kid) in enumerate(self.kids) if kid ], [mydata])

    def cost(self):
        return ITEM_MAP[self.prototype]['cost']

    def clothes(self):
        return ITEM_MAP[self.prototype]['clothes_setting']

    def apply_shirt(self, cm):
        cm.clothesColour1 = self.colours[0]
        cm.clothesColour2 = self.colours[1]
        cm.clothes = self.clothes()
        cm.armour = dict(((k, v) for (k, v) in ITEM_MAP[self.prototype].items() if k in ('gloves',
                                                                                         'shirt',
                                                                                         'pants',
                                                                                         'shoes')))