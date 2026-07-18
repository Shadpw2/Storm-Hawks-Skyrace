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
        # Set the sprite frames based on clothes setting
        clothes = item.clothes()
        base = 12 + clothes * 4
        self._set_mappings(range(base + 1, base + 4))

        # -----------------------------------------------
        #   NEW COLOUR SYSTEM - SERVER STYLE PALETTE
        # -----------------------------------------------

        PALETTE = [
            (200, 200, 200),   # grey
            (0, 180, 255),     # cyan
            (255, 0, 200),     # magenta
            (255, 255, 0),     # yellow
            (0, 255, 0),       # green
            (210, 150, 0),     # brown
            (255, 100, 0)      # orange red
        ]

        # Choose a stable colour based on item ID
        try:
            base_col = PALETTE[item.id % len(PALETTE)]
        except:
            base_col = (200, 200, 200)

        # Highlight is a lighter version
        high_col = (
            min(255, base_col[0] + 40),
            min(255, base_col[1] + 40),
            min(255, base_col[2] + 40)
        )

        # Tint strengths from OfflineShopItem
        try:
            strengthA, strengthB = item.colours
        except:
            strengthA, strengthB = (1.0, 0.8)

        # Compute highlight layer colour (layer 2)
        bright_r = int((high_col[0] / 255.0) * strengthA * 255)
        bright_g = int((high_col[1] / 255.0) * strengthA * 255)
        bright_b = int((high_col[2] / 255.0) * strengthA * 255)
        bright_rgba = (bright_r, bright_g, bright_b, 255)

        # Compute shadow layer colour (layer 1)
        dark_r = int((base_col[0] / 255.0) * strengthB * 255)
        dark_g = int((base_col[1] / 255.0) * strengthB * 255)
        dark_b = int((base_col[2] / 255.0) * strengthB * 255)
        dark_rgba = (dark_r, dark_g, dark_b, 255)

        # Apply the tint colours
        try:
            self.layers[2].bg.colour = bright_rgba
        except:
            pass

        try:
            self.layers[1].bg.colour = dark_rgba
        except:
            pass

        # Tooltip
        from items import CLOTHES_DESC
        from Component import make_tooltip_for
        make_tooltip_for(self, {"tooltip": CLOTHES_DESC[clothes]})



