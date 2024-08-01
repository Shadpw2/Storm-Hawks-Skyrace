# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Button.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component

class Button(Component):
    """A button which can be clicked on to trigger an event.
        It typically has three mappings, representing "normal", "highlighted" and
        "pressed" states. The "highlighted" state is triggered by mousing over the
        Button, and the "pressed" state by pressing the mouse button in that position
        without releasing. The overall behaviour is similar to that of buttons in
        most typical home operating systems (or window managers for Linux). When the
        button is "clicked", a 'click' message is dispatched to the component's
        event handlers."""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                **kwargs:
                MUST contain everything needed for the Component constructor."""
        Component.__init__(self, **kwargs)
        self.policy = self.attachPolicy('Clickable', highlight=(lambda : self.setMapping(1)), press=(lambda : self.setMapping(2)), release=(lambda : self.setMapping(0)), act=(lambda : self.dispatch('click')))


class Togglebutton(Button):
    """A special button which represents an on/off toggle;
        kind of a cross between a Button and a Checkbox. It stores two separate
        sprites and swaps them according to whether or not the toggle is set.
        (This is more flexible than just expecting 6 mappings, 3 for each state.)"""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Button constructor.

                **kwargs:
                MUST contain everything needed for the Button constructor.
                
                MUST also include:
                altsprite -> (string) the name of the sprite to use when the button is
                "set" (the 'sprite' dict key specifies the sprite to use when the button
                is "clear", which is the default state). These two sprites should have the
                same size per mapping, although their mappings may be laid out differently
                (e.g. one vertical set and one horizontal set)."""
        self._on = False
        self._altsprite = kwargs['altsprite']
        Button.__init__(self, **kwargs)
        self.policy.act = self._act

    def _getOn(self):
        return self._on

    def _setOn(self, value):
        self._on = value
        self.sprite, self._altsprite = self._altsprite, self.sprite
        self.setMapping(self._mapping)

    on = property(_getOn, _setOn, doc='State of the toggle (boolean).')

    def _act(self):
        self.on = not self.on
        self.dispatch('click')

    def _extra_dict_keys(self):
        return {'altsprite': self._altsprite}