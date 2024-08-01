# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Sound.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, ResMgr
SoundFlag = None
MusicList = {}
SoundListPlaying = {}
SoundList = {}
LastMusicPlayed = 0

def InitSound():
    global SoundFlag
    SoundConfigFile = ResMgr.openSection('SHOConfig.xml')
    SoundFlag = SoundConfigFile.child(2).asString


def TurnSound(flag):
    global SoundFlag
    SoundFlag = flag
    SoundConfigFile = ResMgr.openSection('SHOConfig.xml')
    SoundConfigFile.child(2).asString = flag
    if flag != 'On':
        StopMusic()
        BigWorld.setMasterVolume(0)
    else:
        PlayMusic(0)
        BigWorld.setMasterVolume(1)
    try:
        SoundConfigFile.save()
    except:
        pass


def PlayMusic(spaceID):
    global LastMusicPlayed
    global MusicList
    if SoundFlag == 'On':
        assert spaceID in range(3)
        if MusicList.get(spaceID, None):
            MusicList[spaceID].play()
        else:
            MusicList[spaceID] = BigWorld.playSound(('music/tenttown', 'music/racetrackone',
                                                     'music/racetracktwo')[spaceID])
            LastMusicPlayed = spaceID
    return


def StopMusic(spaceID=-1):
    if spaceID == -1:
        spaceID = LastMusicPlayed
    assert spaceID in range(3)
    if MusicList.get(spaceID, None):
        MusicList[spaceID].stop()
    return


def PlayContinuousEffect(text):
    if SoundFlag == 'On':
        if SoundList.get(text, None):
            if SoundListPlaying[text] == 0:
                SoundListPlaying[text] = 1
                SoundList[text].play()
        else:
            SoundListPlaying[text] = 1
            SoundList[text] = BigWorld.playSound(text)
    return


def StopContinuousEffect(text):
    if SoundList.get(text, None):
        SoundListPlaying[text] = 0
        SoundList[text].stop()
    return


def PlayEffect(text):
    if SoundFlag == 'On':
        if SoundList.get(text, None):
            SoundListPlaying[text] = 1
            SoundList[text].play()
        else:
            SoundListPlaying[text] = 1
            SoundList[text] = BigWorld.playSound(text)
    return


def StopEffect(text):
    if SoundList.get(text, None):
        SoundListPlaying[text] = 0
        SoundList[text].stop()
    return


def AttachFootSound(i):
    footTrigger = None
    if SoundFlag == 'On':
        footTrigger = BigWorld.FootTrigger(i, 'effects/step')
    return footTrigger