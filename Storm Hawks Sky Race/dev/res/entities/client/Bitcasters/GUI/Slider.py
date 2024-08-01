# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Slider.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component

class Slider(Component):
    """A component representing the knob of a slider bar.
        It can be dragged around within its parent component (which represents the
        'background' of the slider), either freely or to a fixed number of positions.
        This is actually a two-dimensional slider; typical use is to set up a parent
        component either as wide or as high as the knob, and allow only one position
        in that dimension, but it's possible to make a knob that can be freely
        dragged within a larger square, or to any point on an M by N grid, etc.

        The component's "Draggable" policy stores a "value" which indicates the
        position to which the knob has been dragged. See Draggable class
        documentation for more details.

        When the slider is "pressed", a 'pickup' message is dispatched to the
        component's event handlers. When it is "dragged", each time the position
        changed, a 'set' message is dispatched, with the Draggable's "value" as an
        argument. This allows the slider to "control" some other aspect of the GUI,
        such as the scrolling of a text panel."""

    def __init__(self, hpositions=None, vpositions=None, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                hpositions -> (int or None) if None, the slider may be freely dragged
                horizontally; otherwise, it may be dragged to any of the specified number
                of positions, equally spaced. Default None.

                vpositions -> (int or None) similarly, for vertical dragging. Default None.

                **kwargs:
                MUST contain everything needed for the Component constructor."""
        Component.__init__(self, **kwargs)
        self.policy = self.attachPolicy('Draggable', positions=(
         hpositions, vpositions), pickup=(lambda : self.dispatch('pickup')), callback=(lambda value: self.dispatch('set', value)))

    def _get_value(self):
        return self.policy.value

    def _set_value(self, value):
        self.policy.value = value

    value = property(_get_value, _set_value)

    def _get_h(self):
        return self.value[0]

    def _get_v(self):
        return self.value[1]

    def _set_h(self, h):
        self.value = (
         h, self._get_v())

    def _set_v(self, v):
        self.value = (
         self._get_h(), v)

    h = property(_get_h, _set_h)
    v = property(_get_v, _set_v)

    def _get_pos(self):
        return self.policy.positions

    def _set_pos(self, pos):
        self.policy.positions = positions

    pos = property(_get_pos, _set_pos)

    def _get_hpos(self):
        return self.pos[0]

    def _get_vpos(self):
        return self.pos[1]

    def _set_hpos(self, h):
        self.policy.positions = (
         h, self._get_vpos())

    def _set_vpos(self, v):
        self.policy.positions = (
         self._get_hpos(), v)

    hpos = property(_get_hpos, _set_hpos)
    vpos = property(_get_vpos, _set_vpos)

    def extra_dict_keys(self):
        return {'hpositions': self.hpos, 'vpositions': self.vpos}