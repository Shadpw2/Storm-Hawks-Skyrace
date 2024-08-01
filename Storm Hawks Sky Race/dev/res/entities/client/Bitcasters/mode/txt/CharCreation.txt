# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/CharCreation.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, BWPersonality, Math
from math import *
from Bitcasters.RepeatedTask import RepeatedTask
from keys import *
from Util import ignore
from Mode import Mode

class CharCreation(Mode):

    def __init__(self, handler, scene, online):
        BigWorld.callback(0.01, scene.show)
        from Bitcasters.layers.Factory import create
        self.layer = create('CharCreation', 0.75, owner=self, scene=scene, trap_background_clicks=False)
        Mode.__init__(self, handler, {KEY_RETURN: [
                      ignore, self.click_done], 
           KEY_ESCAPE: [
                      ignore, self.click_cancel]})
        self.online = online

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()

    def click_cancel(self):
        """Go back to character selection"""
        BigWorld.player().cancelCharCreation()

    def click_done(self):
        """Create this character"""
        if self.online:
            account = BigWorld.player()
        else:
            account = BWPersonality.CM.account
        account.create(self.layer.character_data())
        