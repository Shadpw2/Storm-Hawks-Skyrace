# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /BWPersonality.py
# Compiled at: 2008-12-16 12:44:43
IS_RELEASE_VERSION = False
IS_BETA = False
import BigWorld, keys, GUI
from Bitcasters.RepeatedTask import RepeatedTask
from LoadScreenController import LoadScreenController
from Bitcasters.mode import *
from Math import Vector3
import Math
import Startup
import sys

# Redirect stdout/stderr to log file manually
logfile = open("python.log", "w")
sys.stdout = logfile
sys.stderr = logfile


__import__('__main__').Startup = Startup
myconfig = None
_handler = None
modes = None
VideoModeBeingChanged = False
CheckGraphicsFlag = False
CM = None
LOCK_FULLSCREEN = False
import Bitcasters.Const

def do(func, *args, **kwargs):
    global _handler
    return getattr(_handler.data.mode, func)(*args, **kwargs)


def changeMode(name, *args, **kwargs):
    args = (
     _handler,) + args
    continuation = getattr(globals()[name], name)(*args, **kwargs)
    _handler.continueWith(continuation)
    return continuation


def init(scriptConfig, engineConfig, prefs, startup_gui):
    global CM
    global _handler
    global myconfig
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
        except Exception, detail:
            pass
        else:
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
    global VideoModeBeingChanged
    global modes
    w = BigWorld.isVideoWindowed()
    VideoModeBeingChanged = True
    if w and not LOCK_FULLSCREEN:
        print 'BWPersonality::checkAndFixGraphicsState: Forcing window resize.'
        BigWorld.resizeWindow(800, 600)
    else:
        BigWorld.changeVideoMode(modes[0][0], False)
    CheckGraphicsFlag = False


def start():
    global VideoModeBeingChanged
    global modes
    modes = filter((lambda x: x[1] == 1920 and x[2] == 1080), BigWorld.listVideoModes())
    VideoModeBeingChanged = True
    if modes:
        if LOCK_FULLSCREEN:
            BigWorld.changeVideoMode(modes[0][0], False)
            BigWorld.FullScreenApsectRatio(1920.0/1080.0)
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
        BigWorld.callback(1.5, (lambda : CM.account.loaded(())))
    return


def fini():
    if BigWorld.player() is not None:
        try:
            BigWorld.player().user.avatar.base.logOff()
        except Exception, why:
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

def spawn_console():
    spaceID = BigWorld.player().spaceID
    pos     = Vector3(-160, 0, 360)
    dir     = (0.0, 0.0, 0.0)
    props   = {'itemType': 0}
    BigWorld.createEntity('Console', spaceID, 0, pos, dir, props)

from Vendor import Vendor

def spawn_vendor(x, y, z, yaw=0.0,
                            vendor_type=Vendor.WALLOP_M_1, costume_num=0,
                            retries=50):
    pos = Math.Vector3(float(x), float(y), float(z))
    dir = (float(yaw), 0.0, 0.0)
    data = {'vendorType': int(vendor_type), 'costumeNum': int(costume_num)}

    def _try(remaining):
        p = BigWorld.player()
        if p and getattr(p, 'spaceID', 0):
            BigWorld.createEntity('Vendor', p.spaceID, 0, pos, dir, data)
            print "[Vendor] spawned at", pos
            return
        if remaining <= 0:
            print "[Vendor][WARN] player not ready; gave up"
            return
        BigWorld.callback(0.1, lambda: _try(remaining - 1))

    _try(retries)

def _build_starting_wardrobe(data):
    """NOTE: not called from EnterOfflineWorld() -- character creation
    (Bitcasters/mode/CharCreation.py) builds the starting wardrobe item
    itself, once, at creation time, so player.dat is always the single
    source of truth from then on, including when it's empty. Left here
    in case it's useful again later rather than deleted outright.

    Build a serialized 'equipped' value for a freshly-created Avatar,
    from the raw 'clothes' choice made at character creation/selection.

    Avatar.def has no 'clothes' / 'clothesColour1' / 'clothesColour2'
    properties -- clothing is always carried through the 'equipped'
    inventory slot, normally populated server-side by
    setupStartingInventory (base-side, not present in this client-only
    repo). This reproduces that step on the client, using the same item
    shape Bitcasters/layers/CharCreation.py:scroll() already builds for
    its own live preview.
    """
    from InventoryItem import InventoryItem, serialize
    clothes_choice = data.get('clothes', 0)
    colour1 = data.get('clothesColour1', 128)
    colour2 = data.get('clothesColour2', 128)
    starting_item = InventoryItem()
    starting_item.insert({'prototype_id': clothes_choice + 1,
                           'colour1': colour1,
                           'colour2': colour2,
                           'condition': 0}, 1)
    return serialize({0: starting_item})


def EnterOfflineWorld(data):
    spacePosMap = {'saharr_test_2': (-165, 0, 365), 
       'cave_track': (-417.07, 6.38, 306.81), 
       'short_track': (112.198, -4.7, -200)}
    defaultSpaceName = 'saharr_test_2'
    spaceID = BigWorld.createSpace()
    storage = _handler.data
    storage.name = data['name']
    spaceName = storage.offlineSpaceName
    try:
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)
    except Exception, details:
        print "BWPersonality::EnterOfflineWorld: Problem finding chosen space '", spaceName, "': ", details, '. Loading default space instead.'
        spaceName = defaultSpaceName
        storage.offlineSpacePos = ()
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)

    try:
        if storage.offlineSpacePos == ():
            startPosition = spacePosMap[spaceName]
        else:
            startPosition = storage.offlineSpacePos
    except Exception, details:
        print 'BWPersonality::EnterOfflineWorld: Error setting up start position:', details, '. Using default start position instead.'
        startPosition = spacePosMap[defaultSpaceName]

    # BigWorld.createEntity only initializes the properties explicitly
    # present in `data` -- offline entities never go through base/cell,
    # so anything not listed here is simply never set at all (accessing
    # it later throws AttributeError, not a default value). This has
    # bitten us one property at a time (gold, then inventory...), so
    # rather than keep guessing, log every property we touch: whether it
    # was already there (and what value) or had to be seeded, so the
    # next failure (if any) shows up immediately in the log instead of
    # needing another round trip.
    def _ensure_property(entity, name, default):
        try:
            current = getattr(entity, name)
            print '[EnterOfflineWorld] %s already present: %r' % (name, current)
        except AttributeError:
            try:
                setattr(entity, name, default)
                print '[EnterOfflineWorld] %s was MISSING -- seeded default: %r' % (name, default)
            except Exception, details:
                print '[EnterOfflineWorld] %s FAILED to seed default %r: %s' % (name, default, details)

    print '[EnterOfflineWorld] creating entity, entityType=%r startPosition=%r' % (myconfig.readString('player/entityType'), startPosition)
    playerID = BigWorld.createEntity(myconfig.readString('player/entityType'), spaceID, 0, startPosition, myconfig.readVector3('player/startDirection'), data)
    print '[EnterOfflineWorld] createEntity returned playerID=%r' % (playerID,)
    storage.startPosition = startPosition
    BigWorld.player(BigWorld.entities[playerID])
    BigWorld.controlEntity(BigWorld.player(), True)
    print '[EnterOfflineWorld] controlEntity granted, seeding properties...'

    _ensure_property(BigWorld.player(), 'gold', data.get('offline', {}).get('gold', 0))

    # Build the real {slotID: InventoryItem} inventory from this
    # character's saved offline block -- the same deserialize() step
    # ShopMode.updateInventory() already does. Previously this was
    # skipped here entirely (inventory was always seeded as a flat {}),
    # which is why nothing showed up in the Inventory screen until
    # after the first shop visit, since only the shop ever actually
    # loaded this data.
    from InventoryItem import deserialize, serialize
    offline = data.get('offline', {}) or {}
    saved_inventory = {}
    try:
        saved_inventory.update(deserialize(offline.get('inventory_equipped', [])))
    except Exception, e:
        print '[EnterOfflineWorld] failed to deserialize saved equipped:', e
    try:
        saved_inventory.update(deserialize(offline.get('inventory_bag', [])))
    except Exception, e:
        print '[EnterOfflineWorld] failed to deserialize saved bag:', e

    if 0 in saved_inventory:
        # There's a saved equipped item -- use it.
        wardrobe = serialize({0: saved_inventory[0]})
        print '[EnterOfflineWorld] using saved equipped item from player.dat'
    else:
        # player.dat is the single source of truth for what's equipped,
        # including "nothing". CharCreation.py seeds a real starting
        # wardrobe item into inventory_equipped exactly once, at
        # character creation, so an empty equipped slot here means the
        # player deliberately unequipped everything -- it does NOT mean
        # "nothing's ever been set up yet". Re-deriving a fresh outfit
        # from the raw character-creation clothes choice here (like
        # this used to) put a fresh outfit back on the character every
        # single spawn, even after an explicit unequip.
        wardrobe = serialize({})
        print '[EnterOfflineWorld] no equipped item saved -- staying unequipped'

    _ensure_property(BigWorld.player(), 'inventory', saved_inventory)

    BigWorld.player().equipped = wardrobe
    print '[EnterOfflineWorld] equipped set to: %r' % (wardrobe,)

    _ensure_property(BigWorld.player(), 'friends', [[], []])

    # Lower-confidence extras -- not yet confirmed missing by a
    # traceback, but same category as gold/inventory/friends (account
    # progress properties, not part of the original character-creation
    # payload), so seeding them defensively now to head off the next
    # round of whack-a-mole. Logged either way so it's obvious if one of
    # these turns out to already be fine or turns out to be the next
    # thing that breaks.
    _ensure_property(BigWorld.player(), 'race_crystals', 0)
    _ensure_property(BigWorld.player(), 'rank', 0)
    _ensure_property(BigWorld.player(), 'proposals', [])
    _ensure_property(BigWorld.player(), 'offered', [])
    _ensure_property(BigWorld.player(), 'trading_with', 0)

    print '[EnterOfflineWorld] calling enterWorld()...'
    try:
        BigWorld.player().enterWorld()
        print '[EnterOfflineWorld] enterWorld() completed OK'
    except Exception, details:
        import traceback
        print '[EnterOfflineWorld] enterWorld() RAISED:', details
        traceback.print_exc()
        raise

    fixCamera()
    # schedule the console spawn on the next frame
    BigWorld.callback(0.1, spawn_console)
    BigWorld.callback(0.2, lambda: spawn_vendor(-165, 0, 365, yaw=0.0))
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

