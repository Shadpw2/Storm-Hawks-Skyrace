# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Clickable.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Util import ignore
from Sound import *

class Clickable(object):
    """Implements button behaviour, translating button events into "highlight",
        "press", "release" and "act" events. Implements typical Windows button
        behaviour: if you click the component and then keep the mouse button held
        down while dragging in and out, the press and release events will be fired
        repeatedly (this is typically used to change the component's appearance)."""

    def __init__(self, component, highlight=ignore, press=ignore, release=ignore, act=ignore):
        """Construct the policy object.
                component -> (ComponentBase) owner of the policy.
                highlight -> (callable) action to take upon mouseover.
                press -> (callable) action to take when button is pressed on the component
                but not yet released. Also called when the mouse is dragged back into the
                button after previously being dragged out without releasing the mouse
                button.
                release -> (callable) action to take when button is released over the
                component, if the initial press was also over the component. Also taken
                when the mouse is dragged out of the component without releasing the mouse
                button.
                act -> (callable) action to take when button is released over the
                component, if the initial press was also over the component. Represents
                actually triggering ("clicking") the component."""
        self.component = component
        self.highlight = highlight
        self.press = press
        self.release = release
        self.act = act

    def leave(self, pos):
        """Called by MouseEventHandler when the mouse leaves the component rect.
                pos -> (pair of ints) the mouse position (ignored)"""
        self.release()

    def drag_leave(self, pos, dragged):
        """Called by MouseEventHandler when the mouse leaves the component rect,
                while some other component is being dragged.
                pos -> (pair of ints) the mouse position (ignored)
                dragged -> (BigWorld.GUIComponent) the thing being dragged"""
        if not dragged == self.component.bg:
            return
        self.release()

    def enter(self, pos):
        """Called by MouseEventHandler when the mouse enters the component rect.
                pos -> (pair of ints) the mouse position (ignored)"""
        from Bitcasters.layers.Factory import Layer
        if not Layer.DRAGGING_CLICKABLE:
            self.highlight()

    def left(self, pos, mods):
        """Called by MouseEventHandler when the left mouse button is pressed or
                released over the component.
                pos -> (pair of ints) the mouse position (ignored)
                mods -> (int) code representing the mouse button state and modifier keys"""
        from Bitcasters.layers.Factory import Layer
        from Bitcasters.Const import DOWN
        if mods & DOWN:
            Layer.focus(self.component)
            Layer.DRAGGING_CLICKABLE = True
            self.press()
        else:
            self.highlight()

    def click(self, pos):
        """Called by MouseEventHandler when the left mouse button is clicked over
                the component (released, when it was also pressed over the component).
                pos -> (pair of ints) the mouse position (ignored)
                mods -> (int) code representing the mouse button state and modifier keys"""
        from Bitcasters.layers.Factory import Layer
        PlayEffect('UI/clickbutton')
        try:
            Layer.expect_focus(self.component)
        except ValueError:
            __import__('traceback').print_exc()

        self.release()
        self.act()

    def drop(self, pos, dragged):
        """Called by MouseEventHandler when another component is dropped within
                the component.
                pos -> (pair of ints) the mouse position (ignored)
                dragged -> (BigWorld.GUIComponent) the thing being dragged"""
        if not dragged == self.component.bg:
            return
        self.click(pos)

    def drag_enter(self, pos, dragged):
        """Called by MouseEventHandler when the mouse enters the component rect,
                while some other component is being dragged.
                pos -> (pair of ints) the mouse position (ignored)
                dragged -> (BigWorld.GUIComponent) the thing being dragged"""
        from Bitcasters.layers.Factory import Layer
        c = self.component
        if Layer.check_focus(c) and dragged == c.bg:
            self.press()

    def cleanup(self):
        """Cleans up the policy when its component is about to die.
                If this component was focussed at the time of destruction, the Layer
                will revert to not focussing anything."""
        from Bitcasters.layers.Factory import Layer
        if Layer.check_focus(self.component):
            Layer.focus(None)
        return