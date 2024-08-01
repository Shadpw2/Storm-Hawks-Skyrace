# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/cursor.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI

class _cursor_impl:

    def __init__(self):
        self.previous = []
        self.locked = False

    def __call__(self, name):
        if self.locked:
            return
        prev = name == 'previous'
        if prev:
            name = self.previous[-1]
            self.previous.pop()
        try:
            x = getattr(self, '_' + name)
        except AttributeError, why:
            raise AttributeError, 'cursor name must be one of %s' % [ x[1:] for x in dir(_cursor_impl) if x.startswith('_') and not x.startswith('__')
                                                                    ]

        x()
        if not prev:
            self.previous.append(name)

    def _mouse(self):
        mc = GUI.mcursor()
        mc.position = (0, 0)
        mc.visible = True
        mc.shape = 'point'
        BigWorld.setCursor(mc)

    def _none(self):
        BigWorld.setCursor(None)
        return

    def _direction(self):
        BigWorld.setCursor(BigWorld.dcursor())
        GUI.mcursor().visible = False
        BigWorld.player().physics.velocityMouse = 'Direction'


cursor = _cursor_impl()