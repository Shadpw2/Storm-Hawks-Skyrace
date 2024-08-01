# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Prelogin.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, BWPersonality, ResMgr
from keys import *
from Util import ignore
from cursor import cursor
from CharCreationScene import CharCreationScene
from Mode import Mode

class FakeAccount(object):

    def __init__(self):
        self.characters = []

    def loaded(self, characters):
        self.characters = list(characters)
        CM = BWPersonality.CM
        from Bitcasters.Math import DEGREES
        self.scene = CM.makeScene()
        self.createCharacter()

    def cancelCreation(self):
        self.selectCharacters()

    def selectCharacters(self):
        BWPersonality.changeMode('CharSelection', self.scene, self.characters, False)

    def createCharacter(self):
        BWPersonality.changeMode('CharCreation', self.scene, False)

    def delete(self, id):
        del self.characters[id]
        self.selectCharacters()

    def create(self, data):
        for character in self.characters:
            if character['name'] == data['name']:
                print 'ALREADY EXISTS'
                return

        if data['name'] == '':
            print 'NO NAME'
            return
        self.characters.append(data)
        self.selectCharacters()


class Prelogin(Mode):

    def __init__(self, handler):
        cursor('mouse')
        cursor('mouse')
        from Bitcasters.layers.Factory import create
        self.layer = create('Prelogin', 0.75, owner=self)
        self.branding = create('branding', 0.02, owner=self, trap_background_clicks=False)
        Mode.__init__(self, handler, {})

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()
        self.branding.cleanup()

    def click_ihaveanaccount(self):
        BWPersonality.changeMode('Login')

    def click_createanaccount(self):
        BWPersonality.changeMode('AccountCreation')

    def click_quit(self):
        BWPersonality.confirmQuit()

    def click(self):
        BWPersonality.changeMode('Loading', None).setProgress(1.0, time=3)
        BWPersonality.CM.account = FakeAccount()
        BigWorld.callback(3, (lambda : BWPersonality.CM.account.loaded(())))
        return