# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/RaceInfo.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Math import Vector3
from Bitcasters.Const import isOnline, addGeometry
from Bitcasters.RepeatedTask import RepeatedTask
from Sound import *

def trackName(trackID):
    return ('saharr_test_2', 'cave_track')[trackID]


class RaceInfo:

    def _setup(self, trackID):
        assert not hasattr(self, 'laps')
        if trackID == 0:
            self.startpos = Vector3(-185.164, 10.043, 443.093)
            self.waypoints = (
             Vector3(-172.994, 10.043, 443.093),
             Vector3(-30.88, 26.83, 78.83),
             Vector3(-238.6, 18.83, 159.4))
            self.lapsToFinish = 2
        else:
            self.startpos = Vector3(-416, 5, 300)
            self.waypoints = (
             Vector3(-428, 5, 300),
             Vector3(447.441, 0.797, -75.214),
             Vector3(124.205, 29.59, 369.138))
            self.lapsToFinish = 1
        from Bitcasters.Math import CameraMatrix
        self.startdir = (
         0, 0, CameraMatrix(self.waypoints[0], self.startpos).yaw)
        self._TRACK = trackID
        StopMusic(0)
        PlayMusic(trackID + 1)

    def beginHeadToHead(self, opponent, trackID):
        assert isOnline(), 'how did we request a head to head race off-line?'
        self.startspace = BigWorld.player().spaceID
        BigWorld.player().cell.proposeActionTo('race_' + trackName(trackID), opponent)

    def beginSolo(self, trackID):
        self.startspace = BigWorld.player().spaceID
        if isOnline():
            print 'REQUEST TIME TRIAL'
            BigWorld.player().base.startTimeTrial(trackName(trackID))
            return
        self.space = BigWorld.createSpace()
        addGeometry(self.space, trackName(trackID))
        BigWorld.player().user.teleportSpace(self.space)
        self.acknowledge()
        self.prepare([BigWorld.player().id, trackID])

    def acknowledge(self):
        __import__('Physics').attach(BigWorld.player(), 'Dummy')
        from Bitcasters.mode.cursor import cursor
        cursor('none')
        for entity in BigWorld.entities.values():
            try:
                entity.highlight(False)
            except:
                pass

            try:
                entity.info_gui.hide()
            except:
                pass

        import BWPersonality
        self.screen = BWPersonality.changeMode('Loading', '')

    def prepare(self, racers, trackID):
        self._setup(trackID)
        self.laps = -1
        self.targetWaypoint = 0
        self.startTime = -1
        self.racers = racers
        from LoadScreenController import LoadScreenController
        LoadScreenController(self.screen, callback=self.begin)

    def begin(self):
        player = BigWorld.player()
        user = player.user
        BigWorld.dcursor().yawPitch(player.yaw)
        self.messages = ('Ready', 'Set', 'Go!', '')
        self.msgCount = -1
        self.thread = RepeatedTask(self.countdown)
        user.setVehicle(1, 'Dummy')
        StopContinuousEffect('effects/walk')
        StopContinuousEffect('effects/run')
        PlayContinuousEffect('effects/engineidle')
        BigWorld.callback(0.2, self.showRace)

    def showRace(self):
        import BWPersonality
        BWPersonality.changeMode('RaceMode', self._TRACK)
        if isOnline():
            BigWorld.player().user.avatar.cell.readyToRace()
        else:
            BigWorld.callback(2, self.startCountdown)

    def startCountdown(self):
        print 'START COUNTDOWN'
        self.crystals = 0
        self.boosts = 0
        self.startTime = BigWorld.time()
        self.thread.start()

    def countdown(self):
        from BWPersonality import storage
        self.guilayer = storage().mode.layers['race']
        time = BigWorld.time() - self.startTime
        newMsgCount = int(time / 1.5)
        if newMsgCount != self.msgCount and newMsgCount < len(self.messages):
            self.msgCount = newMsgCount
            from BWPersonality import storage
            self.guilayer.components['info'].text = self.messages[newMsgCount]
            if newMsgCount == 2:
                from Bitcasters.mode.cursor import cursor
                cursor('direction')
                for player in self.racers:
                    BigWorld.entities[player].unlock()

                from Bitcasters.Math import TranslationMatrix
                self.pots = [ BigWorld.addPot(TranslationMatrix(*wp), 35.0, self.hitPot) for wp in self.waypoints
                            ]
        elif newMsgCount >= 2:
            self.guilayer.setText('race_bg', 'timer', str(round(time - 3.0, 1)))

    def hitPot(self, enteredTrap, handle):
        handleIndex = self.pots.index(handle)
        if handleIndex != self.targetWaypoint:
            return
        self.targetWaypoint = (self.targetWaypoint + 1) % len(self.pots)
        if handleIndex != 0:
            return
        self.laps += 1
        if self.laps != self.lapsToFinish:
            self.guilayer.setText('race_bg', 'lap', '%s/%s' % (self.laps + 1, self.lapsToFinish))
            return
        self.doneRace(True)

    def doneRace(self, crossedFinishLine):
        PlayEffect('music/fanfare')
        timeTaken = BigWorld.time() - self.startTime - 4.5
        self.thread.suspend()
        self.targetWaypoint = -1
        p = BigWorld.player()
        if crossedFinishLine:
            self.guilayer.components['info'].text = 'FINISH!'
            p.user.avatar.cell.crossedFinishLine()
        else:
            p.user.avatar.cell.gaveUp()
        print 'CHRIS: DONE WITH RACE'
        BigWorld.callback(2, self.cleanup)

    def cleanup(self):
        BigWorld.player().cell.alight()
        BigWorld.player().user.setVehicle(0, 'Biped')
        for x in self.pots:
            BigWorld.delPot(x)

        StopMusic()
        PlayMusic(0)
        import BWPersonality
        BWPersonality.storage().mode.layers['player'].stop = True
        self.tally_prepared = True
        if hasattr(self, 'ranking'):
            self.showtally()

    def set_rank(self, value):
        self.ranking = value
        if hasattr(self, 'tally_prepared') and self.tally_prepared:
            self.showtally()

    def showtally(self):
        del self.tally_prepared
        rank = self.ranking
        import BWPersonality
        from Bitcasters.layers.Factory import Layer
        if Layer.DIALOG_LAYER:
            return
        from Bitcasters.mode.cursor import cursor
        cursor('mouse')
        from keys import KEY_RETURN
        from Util import SOLO_WIN
        from Bitcasters.layers.Factory import dialog
        earned = {SOLO_WIN: 100, 0: 100}.get(rank, 0)
        dialog('summary', position={SOLO_WIN: 'Top Time!', 
           0: '1st place!', 
           1: '2nd place!'}.get(rank, 'Results'), crystals=str(self.crystals), boosts=str(self.boosts), gold='+%d' % earned if earned else '---', callback=self.postcleanup)

    def collect_crystal(self):
        if isOnline():
            self.crystals += 1

    def collect_boost(self):
        if isOnline():
            self.boosts += 1

    def postcleanup(self):
        user = BigWorld.player().user
        self.cleanedUp = 0
        BigWorld.dcursor().yawPitch(0)
        BigWorld.dcursor().roll = 0
        if isOnline():
            BigWorld.player().base.endTimeTrial()
        else:
            BigWorld.callback(3, self.clientCleanup)

    def clientCleanup(self):
        self.thread.stop()
        user = BigWorld.player().user
        user.teleportSpace(self.startspace)
        BigWorld.destroyEntity(self.bikeID)
        BigWorld.releaseSpace(self.space)
        user.teleport((-170, 0, 354), (0, 0, 0))
        self.abandon()

    def abandon(self):
        import BWPersonality
        screen = BWPersonality.changeMode('Loading', '')
        from LoadScreenController import LoadScreenController
        LoadScreenController(screen, callback=(lambda : BWPersonality.changeMode('WorldMode')))
        del self.laps
        self.cleanedUp = 1