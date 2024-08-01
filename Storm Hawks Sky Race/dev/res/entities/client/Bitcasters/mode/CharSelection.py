# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/CharSelection.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, BWPersonality, Math
from math import *
from keys import *
from Util import ignore
from Mode import Mode

class CharSelection(Mode):

    def __init__(self, handler, scene, characters, online):
        self.online = online
        self.characters = characters
        assert characters
        from Bitcasters.layers.Factory import create
        self.layer = create('CharSelection', 0.75, owner=self, chardata=characters, scene=scene)
        Mode.__init__(self, handler, {KEY_RETURN: [
                      ignore, self.click_done], 
           KEY_ESCAPE: [
                      ignore, self.esc]})
        BigWorld.callback(0.01, (lambda : self.layer.click_char(0)))

    def esc(self):
        """Go back to login screen"""
        self.click('back')

    def click_back(self):
        self.layer.scene._destroy()
        BWPersonality.CM.restartLogin()

    def click_done(self):
        """Enter the game with the selected character"""
        character = self.characters[self.layer.selected]
        self.layer.scene._destroy()
        if self.online:
            BWPersonality.EnterOnlineWorld(character['name'])
        else:
            BWPersonality.EnterOfflineWorld(character)

    def click_new_character(self):
        BWPersonality.changeMode('CharCreation', self.layer.scene, self.online)

    def click_delete_character(self):
        try:
            BigWorld.player().delete(self.layer.selected)
        except:
            pass

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()