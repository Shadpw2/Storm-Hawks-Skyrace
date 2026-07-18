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

CHAR_FILE = 'player.dat'


def _build_offline_block():
    """
    Return a NEW dict with offline-only state.
    This does NOT touch appearance data and will live under 'offline'.
    """
    return {
        'gold': 0,              # starting cash
        'inventory_bag': [],       # future loose items
        'inventory_equipped': []   # future equipped items
    }


def _append_character_to_file(record_dict):
    """
    Append one character record (already assembled) to characters.txt.
    Each record is written on its own line using repr(), just like before.
    """
    try:
        f = open(CHAR_FILE, 'a')
        f.write(repr(record_dict) + '\n')
        f.close()
    except:
        # silent fail like original
        pass


class CharCreation(Mode):

    def __init__(self, handler, scene, online):
        BigWorld.callback(0.01, scene.show)

        from Bitcasters.layers.Factory import create
        self.layer = create(
            'CharCreation',
            0.75,
            owner=self,
            scene=scene,
            trap_background_clicks=False
        )

        Mode.__init__(
            self,
            handler,
            {
                KEY_RETURN: [ignore, self.click_done],
                KEY_ESCAPE: [ignore, self.click_cancel]
            }
        )

        self.online = online

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()

    def click_cancel(self):
        """Go back to character selection"""
        BigWorld.player().cancelCharCreation()

    def click_done(self):
        """
        1. Grab the appearance/customization data from UI.
        2. Tell the engine/account to create the character (unchanged behavior).
        3. Save a line to characters.txt that now ALSO contains an 'offline' block
           for gold / inventory, without polluting the data that CharSelection
           and CharacterModel expect.
        """

        # 1. pull data from CharCreation layer (sliders, name, etc.)
        try:
            data = self.layer.character_data()
        except:
            data = {}

        # 2. original create() call
        if self.online:
            account = BigWorld.player()
        else:
            account = BWPersonality.CM.account

        try:
            account.create(data)
        except:
            # don't kill the menu if offline stub doesn't fully behave
            pass

        # 3. extract safe name/class values
        try:
            char_name = data.get('name', 'Unnamed')
        except:
            try:
                char_name = data.name
            except:
                char_name = 'Unnamed'

        try:
            char_class = data.get('class', 'Unknown')
        except:
            char_class = 'Unknown'

        # 4. build the record we will persist
        #    IMPORTANT: only name/class/data at top level, plus 'offline' as a nested dict
        record = {
            'name':  char_name,
            'class': char_class,
            'data':  data,
            'offline': _build_offline_block()
        }

        # 5. append to characters.txt as one line
        _append_character_to_file(record)
