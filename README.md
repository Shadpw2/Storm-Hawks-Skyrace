Contained within this repository is the entire Storm Hawks Skyrace Game launcher.
There is a good chance that the client can boot into an offline mode which is being investigated.

Currently within the file BWPersonailty.pyc seems to be the key to this idea, specifically this codeblock:

```Python
IS_RELEASE_VERSION = True
IS_BETA = False
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

```

2/12/22 UPDATE

After editing the Binary pyc file with the help of H4v0c21 (who located the bits in the hex editor)
We have discovered that the issue lies elsewhere, as the edit still gives the init Account Class error.

Current investigation is into Const.pyc in ./dev/res/entites/client/bitcasters has shown the location of the previously hosted ip and port which also opens up the posibility of running an alt server.
![ip address located](https://cdn.discordapp.com/attachments/993060496557224018/1047799723051991100/SPOILER_image.png)

Further more netinfo.pyc located in ./client directory looks to hold some key data to sniff if an alt server is required.