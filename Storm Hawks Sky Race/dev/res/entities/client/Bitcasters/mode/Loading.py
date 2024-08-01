# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Loading.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, BWPersonality, Math
from keys import *
from Util import ignore
from Mode import Mode

class Loading(Mode):

    def __init__(self, handler, next, *args, **kwargs):
        from Bitcasters.layers.Factory import create
        self.layer = create('Loading', 0.02, owner=self)
        self.branding = create('branding', 0.01, owner=self, trap_background_clicks=False)
        Mode.__init__(self, handler, {})
        self.next = next
        self.args = args
        self.kwargs = kwargs

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()
        self.branding.cleanup()

    def setProgress(self, value, time=0.1):
        if self.layer.set(value, time) and self.next:

            def transition():
                BWPersonality.changeMode(self.next, *self.args, **self.kwargs)
                self.next = None
                return

            BigWorld.callback(time, transition)