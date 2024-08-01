# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Checkbox.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component

class Checkbox(Component):
    """A simple toggle widget.
        It uses two mappings for "checked" and "unchecked" state. A Checkbox can also
        be used to implement radio buttons; if some Checkboxes are set up to have the
        same parent, and that parent has its 'is_radio_group' property set True, then
        those Checkboxes will all behave as a single radio group (meaning that
        checking one unchecks all the others)."""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                **kwargs:
                MUST contain everything needed for the Component constructor."""
        Component.__init__(self, **kwargs)
        self.attachPolicy('Clickable', act=self._act)
        self._on = False

    def _getOn(self):
        return self._on

    def _setOn(self, on):
        self._on = on
        self.setMapping(self._on)

    on = property(_getOn, _setOn, doc='State of the toggle (boolean).')

    def _act(self):
        if not self.parent.radio(self):
            self.on = not self.on
        self.dispatch('click')