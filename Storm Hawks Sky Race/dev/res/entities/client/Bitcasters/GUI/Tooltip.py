# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Tooltip.py
# Compiled at: 2008-12-16 09:35:38
import GUI, BigWorld

class Tooltip(object):
    """A policy that creates a new GUI layer for a "tooltip" when the component
        is hovered over. The layer gets anchored in a viewport centered over the
        component."""

    def __init__(self, component, size, style='Tooltip', delay=1.0, **kwargs):
        self.component = component
        self.delay = delay
        self.style = style
        self.size = size
        self.text = kwargs['text']
        from Bitcasters.layers.Factory import create
        r = create(self.style, size=size, z=0.01, owner=None, trap_background_clicks=False, **kwargs)
        r.visible = False
        self.root = r
        self.callback = 0
        return

    def as_dict(self):
        return {'tooltip': self.text, 
           'tooltip_size': self.size, 
           'tooltip_style': self.style, 
           'tooltip_delay': self.delay}

    def hide(self):
        BigWorld.cancelCallback(self.callback)
        self.root.visible = False

    def show(self):
        BigWorld.cancelCallback(self.callback)
        self.root.visible = True
        self.root.anchorAtCursor()
        self.callback = BigWorld.callback(4, self.hide)

    def enter(self, pos):
        BigWorld.cancelCallback(self.callback)
        self.callback = BigWorld.callback(self.delay, self.show)

    def leave(self, pos):
        self.hide()

    def click(self, pos):
        self.hide()

    def left(self, pos, mods):
        from Bitcasters.Const import DOWN
        if mods & DOWN:
            self.hide()

    def cleanup(self):
        self.hide()
        self.root.destroy()

        class DeadRoot(object):

            def __init__(self):
                self.visible = None
                return

        self.root = DeadRoot()