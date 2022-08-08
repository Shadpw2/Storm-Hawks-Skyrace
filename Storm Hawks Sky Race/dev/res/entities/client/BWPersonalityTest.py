# Embedded file name: /BWPersonality.py
IS_RELEASE_VERSION = False
IS_BETA = True
import BigWorld, keys, GUI
from Bitcasters.RepeatedTask import RepeatedTask
from LoadScreenController import LoadScreenController
from Bitcasters.mode import *
from Math import Vector3
import Startup
__import__('__main__').Startup = Startup
myconfig = None
_handler = None
modes = None
VideoModeBeingChanged = False
CheckGraphicsFlag = False
CM = None
LOCK_FULLSCREEN = IS_RELEASE_VERSION
import Bitcasters.Const

def do(func, *args, **kwargs):
    global _handler
    return getattr(_handler.data.mode, func)(*args, **kwargs)


def changeMode(name, *args, **kwargs):
    args = (_handler,) + args
    continuation = getattr(globals()[name], name)(*args, **kwargs)
    _handler.continueWith(continuation)
    return continuation


def init(scriptConfig, engineConfig, prefs, startup_gui):
    global _handler
    global myconfig
    global CM
    from KeyHandler import KeyHandler
    _handler = KeyHandler()
    storage = _handler.data
    try:
        import ResMgr
        ConfigFile = ResMgr.openSection('SHOConfig.xml')
    except:
        print 'Creating Config file'

    if not ConfigFile:
        import shutil
        shutil.copyfile('SHODefaultConfig.xml', 'SHOConfig.xml')
    storage.offlineSpaceName = ''
    storage.offlineSpacePos = ()
    storage.startPosition = (0, 0, 0)
    offlineData = ()
    if not IS_RELEASE_VERSION:
        try:
            offlineData = file('offline.txt').read().split('\n')
            storage.offlineSpaceName = offlineData[0]
            print 'Offline mode requested. Using space: ', storage.offlineSpaceName
        except Exception as detail:
            pass

        if len(offlineData) > 1:
            if len(offlineData[1]) > 4:
                storage.offlineSpacePos = eval(offlineData[1])
    cfgData = Bitcasters.Const.CFG_MAP[Bitcasters.Const.CFG_KEYNAME]
    serverAddr = cfgData['server_ip']
    script = startup_gui.script
    RepeatedTask.run()
    try:
        BigWorld.setGraphicsSetting('BLOOM_FILTER', 1)
    except:
        print 'ERROR: The graphics card or drivers may be missing the functions needed for bloom/blur.'

    from ConnectionManager import ConnectionManager
    CM = ConnectionManager(serverAddr)

    def onSpaceLoaded():
        BigWorld.callback(1, script.fade)
        BigWorld.callback(1.0, enterGame)

    LoadScreenController(script, callback=onSpaceLoaded)
    myconfig = scriptConfig
    from Sound import InitSound
    InitSound()
    BigWorld.camera(BigWorld.CursorCamera())


def checkAndFixGraphicsState():
    global CheckGraphicsFlag
    global modes
    global VideoModeBeingChanged
    w = BigWorld.isVideoWindowed()
    VideoModeBeingChanged = True
    if w and not LOCK_FULLSCREEN:
        print 'BWPersonality::checkAndFixGraphicsState: Forcing window resize.'
        BigWorld.resizeWindow(800, 600)
    else:
        BigWorld.changeVideoMode(modes[0][0], False)
    CheckGraphicsFlag = False


def start():
    global modes
    global VideoModeBeingChanged
    modes = filter(lambda x: x[1] == 800 and x[2] == 600, BigWorld.listVideoModes())
    VideoModeBeingChanged = True
    if modes:
        if LOCK_FULLSCREEN:
            BigWorld.changeVideoMode(modes[0][0], False)
        else:
            BigWorld.changeVideoMode(modes[0][0], True)
            BigWorld.resizeWindow(800, 600)
    else:
        print 'BWPersonality::start: 800x600 resolution not available.'
        BigWorld.changeVideoMode(0, True)
        BigWorld.resizeWindow(800, 600)


def enterGame():
    PlayerName = ''
    try:
        import ResMgr
        PlayerName = ResMgr.openSection('SHOConfig.xml').child(1).asString
    except:
        pass

    if storage().offlineSpaceName == '':
        if PlayerName == '' and not IS_BETA and 1 == 0:
            from Cameras import AimCursorCameraTo
            AimCursorCameraTo(at=Vector3(-170, 1.25, 354), direction=Vector3(0.0, 0.0, 1.0))
            changeMode('Prelogin')
        else:
            changeMode('Login')
    else:
        from Bitcasters.mode.cursor import cursor
        cursor('mouse')
        from Bitcasters.mode.Prelogin import FakeAccount
        changeMode('Loading', None).setProgress(1.0, time=3)
        CM.account = FakeAccount()
        BigWorld.callback(1.5, lambda : CM.account.loaded(()))
    return


def fini():
    if BigWorld.player() is not None:
        try:
            BigWorld.player().user.avatar.base.logOff()
        except Exception as why:
            print 'COULD NOT LOG OFF:', why

    BigWorld.disconnect()
    return


def onChangeEnvironments(inside):
    pass


def handleKeyEvent(down, key, mods):
    if CheckGraphicsFlag:
        checkAndFixGraphicsState()
    GUI.handleKeyEvent(down, key, mods)
    _handler.handleKeyEvent(down, key, mods)
    return False


def handleMouseEvent(dx, dy, dz):
    if CheckGraphicsFlag:
        checkAndFixGraphicsState()
    GUI.handleMouseEvent(dx, dy, dz)
    return False


def handleAxisEvent(axis, value, dTime):
    GUI.handleAxisEvent(axis, value, dTime)
    return False


def onRecreateDevice():
    global CheckGraphicsFlag
    global VideoModeBeingChanged
    from Bitcasters.layers.Factory import Layer
    for layer in Layer.ALL_LAYERS:
        layer.fit()

    if VideoModeBeingChanged:
        VideoModeBeingChanged = False
        return
    if LOCK_FULLSCREEN:
        CheckGraphicsFlag = True
    else:
        checkAndFixGraphicsState()


def storage():
    return _handler.data


def EnterOfflineWorld(data):
    spacePosMap = {'saharr_test_2': (-183.354, 10.819, 442.787),
     'cave_track': (-417.07, 6.38, 306.81),
     'short_track': (112.198, -4.7, -200)}
    defaultSpaceName = 'saharr_test_2'
    spaceID = BigWorld.createSpace()
    storage = _handler.data
    storage.name = data['name']
    spaceName = storage.offlineSpaceName
    try:
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)
    except Exception as details:
        print "BWPersonality::EnterOfflineWorld: Problem finding chosen space '", spaceName, "': ", details, '. Loading default space instead.'
        spaceName = defaultSpaceName
        storage.offlineSpacePos = ()
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)

    try:
        if storage.offlineSpacePos == ():
            startPosition = spacePosMap[spaceName]
        else:
            startPosition = storage.offlineSpacePos
    except Exception as details:
        print 'BWPersonality::EnterOfflineWorld: Error setting up start position:', details, '. Using default start position instead.'
        startPosition = spacePosMap[defaultSpaceName]

    playerID = BigWorld.createEntity(myconfig.readString('player/entityType'), spaceID, 0, startPosition, myconfig.readVector3('player/startDirection'), data)
    storage.startPosition = startPosition
    BigWorld.player(BigWorld.entities[playerID])
    BigWorld.controlEntity(BigWorld.player(), True)
    BigWorld.player().enterWorld()
    fixCamera()
    return


def EnterOnlineWorld(charname):
    CM.transmit('characterBeginPlay', charname)


def fixCamera():
    from Cameras import AimCursorCameraAt
    AimCursorCameraAt(BigWorld.player())


def confirmQuit():
    from Bitcasters.layers.Factory import ask
    from Bitcasters.layers.dialog import ICON_QUESTION
    ask(ICON_QUESTION, 'Really Quit?', 'Are you sure you want to quit the program?', ok_callback=BigWorld.quit)