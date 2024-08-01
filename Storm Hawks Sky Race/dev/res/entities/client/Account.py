# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Account.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, BWPersonality
from Sound import *
NAME_LENGTH = 15

class Account(BigWorld.Entity):

    def __init__(self):
        BigWorld.Entity.__init__(self)
        self.pendingCharacter = None
        self.deadCharacterId = None
        PlayMusic(0)
        self.CM = BWPersonality.CM
        return

    def cancelCharCreation(self):
        if self.characters:
            BWPersonality.changeMode('CharSelection', self.scene, self.characters, True)
        else:
            BWPersonality.CM.restartLogin()

    def selectCharacter(self):
        if self.characters:
            BWPersonality.changeMode('CharSelection', self.scene, self.characters, True)
        else:
            self.createCharacter()

    def createCharacter(self):
        BWPersonality.changeMode('CharCreation', self.scene, True)

    def loaded(self, characters, inventory, inv_sizes):
        assert len(inv_sizes) == len(characters) and sum(inv_sizes) == len(inventory)
        start = 0
        self.characters = []
        for (character, count) in zip(characters, inv_sizes):
            character = dict(character)
            from InventoryItem import deserialize
            character['inventory'] = deserialize(inventory[start:start + count])
            self.characters.append(character)
            start += count

        assert self == BigWorld.player()
        self.scene = self.CM.makeScene()
        self.selectCharacter()

    def delete(self, id):
        self.deadCharacterId = id
        self.CM.transmit('deleteCharacter', self.characters[id]['name'])

    def _error(self, title, text):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_ERROR
        notify(ICON_ERROR, title, text)

    def create(self, data):
        name = data['name']
        if not name:
            self._error('Error', 'You must give your character a name.')
            return
        if name in [ x['name'] for x in self.characters ]:
            self._error('Error', "You already have a character named '%s'." % name)
            return
        if len(name) > NAME_LENGTH:
            self._error('Error', 'That name is too long.')
            return
        clothing = {}
        for key in ('clothes', 'clothesColour1', 'clothesColour2'):
            clothing[key] = data[key]
            del data[key]

        self.CM.transmit('createCharacter', data, clothing)
        self.pendingCharacter = data
        from InventoryItem import deserialize
        self.pendingCharacter['inventory'] = deserialize([
         {'prototype_id': clothing['clothes'] + 1, 
            'colour1': clothing['clothesColour1'], 
            'colour2': clothing['clothesColour2'], 
            'condition': 0, 
            'inventoryLocation': 0, 
            'socketCode': 1}])

    def succeedCreate(self, name):
        assert self.pendingCharacter['name'] == name
        self.characters.append(self.pendingCharacter)
        self.pendingCharacter = None
        self.selectCharacter()
        return

    def succeedDelete(self, name):
        assert self.characters[self.deadCharacterId]['name'] == name
        del self.characters[self.deadCharacterId]
        self.deadCharacterId = None
        self.selectCharacter()
        return

    def failCreate(self, name, message):
        self.createCharacter()
        self._error('Creation failed', "Could not create character '%s':\n%s" % (name, message))

    def failDelete(self, name, message):
        self.selectCharacter()
        self._error('Deletion failed', "Could not delete character '%s':\n%s" % (name, message))

    def failLogon(self, message):
        self._error('Login failed', 'Could not log in:\n%s' % message)
        BWPersonality.CM.restartLogin()


class PlayerAccount(Account):

    def handleKeyEvent(self, isDown, key, mods):
        pass