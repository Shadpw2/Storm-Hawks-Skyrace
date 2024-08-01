# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Inventorybutton.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component
INVISIBLE = 31

class Inventorybutton(Component):
    """A hack used to implement the multicolour-able buttons
        on the inventory panel used on Inventory, shop and trading screens.
        It basically stacks a few normal buttons on top of each other.
        (FIXME: handle this in the procedural button-creation code for that Layer
        directly; this isn't nearly reusable enough to exist as a standard
        component.)"""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                **kwargs:
                MUST contain everything needed for the Component constructor."""
        ID = kwargs['ID']
        del kwargs['ID']
        Component.__init__(self, ID=ID, **kwargs)
        del kwargs['parent']
        m = Component(ID=(ID + '_1'), parent=self, **kwargs)
        t = Component(ID=(ID + '_2'), parent=m, **kwargs)
        self.layers = (
         self, m, t)
        self.placeholder = kwargs.get('placeholder', INVISIBLE)
        self.policy = self.attachPolicy('Clickable', act=(lambda : self.dispatch('click')))
        self.reset()

    def show_price(self, price):
        """Display the provided number as a price for the illustrated item.
                price -> (int) the item's price."""
        self.layers[2].write('text', str(price))

    def clear_price(self):
        """Clear the display of the item's price."""
        self.layers[2].write('text', '')

    def _set_mappings(self, mappings):
        for (layer, mapping) in zip(self.layers, mappings):
            layer.setMapping(mapping)

    def reset(self):
        """Reset the button to an "empty" state, illustrating no item."""
        self._set_mappings((self.placeholder, INVISIBLE, INVISIBLE))
        for layer in self.layers:
            layer.bg.colour = (255, 255, 255, 255)

        self.removePolicy('Tooltip')

    def setItem(self, item):
        """Set the button to display the indicated item.
                item -> (InventoryItem) object providing information about the item."""
        clothes = item.clothes()
        base = 12 + clothes * 4
        self._set_mappings(range(base + 1, base + 4))
        from Bitcasters.CharacterModel import translateColour
        for (layer, colour) in zip((self.layers[2], self.layers[1]), item.colours):
            layer.bg.colour = tuple((int(x * 256) for x in translateColour(colour, 'clothesColour2')))[:3] + (255, )

        from items import CLOTHES_DESC
        from Component import make_tooltip_for
        make_tooltip_for(self, {'tooltip': CLOTHES_DESC[clothes]})