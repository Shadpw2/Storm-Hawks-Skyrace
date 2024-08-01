# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Leaderboard.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, BWPersonality
from keys import *
from Util import ignore
from cursor import cursor
from Mode import Mode

class Leaderboard(Mode):

    def __init__(self, handler):
        cursor('mouse')
        from Bitcasters.layers.Factory import create
        self.layer = create('Leaderboard', 0.75, owner=self)
        Mode.__init__(self, handler, {KEY_ESCAPE: [
                      self.click_exit, ignore]})
        for track in ('saharr_test_2', 'cave_track'):
            BigWorld.player().base.queryLeaderboard(track)

    def cleanup(self):
        self.layer.cleanup()

    def updateLeaderboard(self, name, times):
        self.layer.setData(name, times)

    def click_panel(self, component):
        self.layer.setTab(int(component) - 1)

    def click_exit(self):
        """Go back to the world"""
        BWPersonality.changeMode('WorldMode')