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


def save_character_data(player_name, updates):
    """
    Update character data in player.dat for a specific character.
    
    Args:
        player_name: Name of the character to update
        updates: Dict of fields to update (e.g., {'gold': 150, 'inventory': {...}})
    
    Returns:
        True if successful, False otherwise
    """
    try:
        file_chars = []
        
        # Load existing characters
        try:
            f = open('player.dat', 'r')
            for ln in f:
                ln = ln.strip()
                if ln and ln.startswith('{'):
                    try:
                        rec = eval(ln, {'__builtins__': {}}, {})
                        file_chars.append(rec)
                    except:
                        pass
            f.close()
        except:
            print "[save_character_data] Could not read player.dat"
            return False
        
        # Find and update the character
        found = False
        for char in file_chars:
            if char.get('name') == player_name:
                char.update(updates)
                found = True
                print "[save_character_data] Updated character '%s' with: %s" % (player_name, updates)
                break
        
        if not found:
            print "[save_character_data] Character '%s' not found" % player_name
            return False
        
        # Write back to file
        try:
            f = open('player.dat', 'w')
            for rec in file_chars:
                f.write(repr(rec) + '\n')
            f.close()
            print "[save_character_data] player.dat updated successfully"
            return True
        except Exception, e:
            print "[save_character_data] Failed to write player.dat:", e
            return False
            
    except Exception, e:
        print "[save_character_data] Error:", e
        return False


def add_gold(player, amount):
    """
    Add (or subtract) gold from a player and save to file.
    
    Args:
        player: The player entity
        amount: Gold to add (can be negative to subtract)
    
    Returns:
        New gold total, or None if failed
    """
    try:
        old_gold = getattr(player, 'gold', 0)
        new_gold = max(0, old_gold + amount)  # Don't allow negative gold
        player.gold = new_gold
        
        player_name = getattr(player, 'name', None)
        if player_name:
            save_character_data(player_name, {'gold': new_gold})
            print "[add_gold] %s: %d -> %d (%+d)" % (player_name, old_gold, new_gold, amount)
            return new_gold
        else:
            print "[add_gold] Player has no name, cannot save"
            return new_gold
            
    except Exception, e:
        print "[add_gold] Error:", e
        return None


def save_player_state(player):
    """
    Save complete player state (gold, inventory, etc.) to file.
    
    Args:
        player: The player entity
    
    Returns:
        True if successful, False otherwise
    """
    try:
        player_name = getattr(player, 'name', None)
        if not player_name:
            print "[save_player_state] Player has no name"
            return False
        
        updates = {
            'gold': getattr(player, 'gold', 0),
            'inventory': getattr(player, 'inventory', {}),
        }
        
        return save_character_data(player_name, updates)
        
    except Exception, e:
        print "[save_player_state] Error:", e
        return False

# Vendor Start

from Vendor import Vendor

def spawn_vendor(x, y, z, yaw=0.0, pitch=0.0, roll=0.0,
                            vendor_type=Vendor.WALLOP_M_1, costume_num=0,
                            retries=50):
    pos = Math.Vector3(float(x), float(y), float(z))
    dir = (float(yaw), float(pitch), float(roll))
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

def spawn_vendor2(x, y, z, yaw=0.0, pitch=0.0, roll=0.0,
                            vendor_type=Vendor.HUMAN_M_1, costume_num=0,
                            retries=50):
    pos = Math.Vector3(float(x), float(y), float(z))
    dir = (float(yaw), float(pitch), float(roll))
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

def spawn_boost(x, y, z, dir, boost_type=0):
    """
    Spawn a race boost pickup.
    boost_type: 0=GROUND_1, 1=AIR_1, 2=GROUND_2
    """
    pos = Math.Vector3(float(x), float(y), float(z))
    #dir = (0.0, 0.0, 0.0)
    data = {'boostType': int(boost_type)}
    
    p = BigWorld.player()
    if p and getattr(p, 'spaceID', 0):
        BigWorld.createEntity('Race_Boost', p.spaceID, 0, pos, dir, data)
        print "[Race_Boost] spawned at", pos, "type:", boost_type
    else:
        print "[Race_Boost][ERROR] player not ready"

def spawn_crystal(x, y, z, dir, item_type=0):
    """
    Spawn a race crystal.
    item_type: 0=GROUND, 1=AIR_HELI
    """
    pos = Math.Vector3(float(x), float(y), float(z))
    #dir = (0.0, 0.0, 0.0)
    data = {'itemType': int(item_type)}
    
    p = BigWorld.player()
    if p and getattr(p, 'spaceID', 0):
        BigWorld.createEntity('Race_Crystal', p.spaceID, 0, pos, dir, data)
        print "[Race_Crystal] spawned at", pos, "type:", item_type
    else:
        print "[Race_Crystal][ERROR] player not ready"

def EnterOfflineWorld(data):
    """
    Offline boot path. Spawns the playable avatar in the chosen offline space.

    This version has been patched to:
    - remember the init 'data' for later race spawns
    - attach a dummy friends list to avoid offline chat crashing
    """

    spacePosMap = {
        'saharr_test_2': (-165, 0, 365),
        'cave_track': (-417.07, 6.38, 306.81),
        'short_track': (112.198, -4.7, -200),
    }
    defaultSpaceName = 'saharr_test_2'

    # create space
    spaceID = BigWorld.createSpace()

    # storage/_handler are part of the original BWPersonality global state.
    # we keep using that layout so the rest of the game keeps working.
    storage = _handler.data
    storage.name = data['name']

    # which map are we going to load?
    spaceName = storage.offlineSpaceName
    try:
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)
    except Exception, details:
        print "BWPersonality::EnterOfflineWorld: Problem finding chosen space '", spaceName, "': ", details, ". Loading default space instead."
        spaceName = defaultSpaceName
        storage.offlineSpacePos = ()
        BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + spaceName)

    # pick a spawn position for this map
    try:
        if storage.offlineSpacePos == ():
            startPosition = spacePosMap[spaceName]
        else:
            startPosition = storage.offlineSpacePos
    except Exception, details:
        print "BWPersonality::EnterOfflineWorld: Error setting up start position:", details, ". Using default start position instead."
        startPosition = spacePosMap[defaultSpaceName]

    # actually create the avatar entity that will become the player
    try:
        entityTypeName = myconfig.readString('player/entityType')
    except:
        entityTypeName = 'PlayerAvatar'  # fallback, might still fail if not defined

    try:
        startDir = myconfig.readVector3('player/startDirection')
    except:
        startDir = (0, 0, 0)

    playerID = BigWorld.createEntity(
        entityTypeName,
        spaceID,
        0,
        startPosition,
        startDir,
        data
    )

    # hook the BigWorld "player" pointer up to that entity
    storage.startPosition = startPosition
    BigWorld.player(BigWorld.entities[playerID])
    BigWorld.controlEntity(BigWorld.player(), True)
    BigWorld.player().enterWorld()

    # Load gold from character data
    try:
        player = BigWorld.player()
        player.gold = data.get('gold', 0)
        player.inventory = data.get('inventory', {})
        print "[EnterOfflineWorld] Loaded character - Gold:", player.gold, "Inventory items:", len(player.inventory)
    except Exception, e:
        print "[EnterOfflineWorld] Failed to load character state:", e
        player.gold = 0
        player.inventory = {}

    # PATCH: remember the original character init data on the player
    # so RaceInfo can reuse it later for spawning into race spaces.
    try:
        BigWorld.player()._offlineCharData = data
    except:
        pass

    # PATCH: create an empty friends list so the offline ChatConsole
    # does not explode trying to access p.friends
    try:
        BigWorld.player().friends = []
    except:
        pass
        
    # keep camera and other original behavior
    fixCamera()

    #Inventory Patch before load because it's broken
    from RaceInfo import _patchOfflineFriendsAndInventory
    player = BigWorld.player()

    snapshot = {
        "gold": getattr(player, "gold", 0),
        "inventory": getattr(player, "inventory", {})
    }

    _patchOfflineFriendsAndInventory(player, snapshot)

    # PATCH: keep the vendor + console spawns as before
    BigWorld.callback(0.1, spawn_console)
    BigWorld.callback(0.2, lambda: spawn_vendor(-178, 0, 294, yaw=0.0, pitch=0.0, roll=1.51))
    BigWorld.callback(0.2, lambda: spawn_vendor2(-179, 0, 301, yaw=1.51, pitch=0.0, roll=0.76))
    
    #===============Vendor 1(Wallop)=============================
    #PLAYER POSITION: x=-178, y=0, z=294
    #PLAYER ROTATION: yaw=0.0, pitch=-0.0, roll=1.51
    #============================================================
    
    #===============Vendor 2(Human)==============================
    #PLAYER POSITION: x=-178.21, y=0.15, z=293.67
    #PLAYER ROTATION: yaw=1.51, pitch=-0.76, roll=0.00
    #============================================================
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

