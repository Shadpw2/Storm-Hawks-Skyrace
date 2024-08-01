# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/ConnectionManager.py
# Compiled at: 2008-12-16 09:35:38
from Bitcasters.Const import addGeometry, addViewer
from BWPersonality import changeMode, storage
from Util import SPACE_NAME, ignore
import BigWorld
DEFS_MISMATCH = -69
ALREADY_CONNECTED = -68
UNKNOWN_USER = -66

class ConnectionManager:

    def __init__(self, server):
        self.spaceID = None
        if storage().offlineSpaceName == '':
            self.server = server
        else:
            self.server = ''
        self.spaceID = BigWorld.createSpace()
        self.geometryID = addGeometry(self.spaceID, SPACE_NAME)
        self.expectedDisconnect = False
        self.inactivityTimeout = 25
        return

    def handleConnectionResponse(self, progress, status, err=''):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_WARNING
        print 'CTBW RESPONSE:', progress, status
        if progress == 2:
            if status == 1:
                pass
        elif progress == 1:
            if status == DEFS_MISMATCH:
                notify(ICON_WARNING, "Can't Continue", '\nYour client is out of date.', ok_callback=BigWorld.quit)
                return
            elif status == ALREADY_CONNECTED:
                notify(ICON_WARNING, 'Connection failed', '\nYou are already connected.' if self.username else '\nThe server is busy, try again later.', ok_callback=(lambda : changeMode('Login')))
                return
            elif status == UNKNOWN_USER:
                notify(ICON_WARNING, 'Connection failed', "\nThe server could not find an account for '%s'." % self.username, ok_callback=(lambda : changeMode('Login')))
                return
            elif status != 1:
                print "Client can't connect to the server !!!"
                notify(ICON_WARNING, "Can't Connect !!!", "\nYour client can't connect to the server.", ok_callback=BigWorld.quit)
        elif progress == 6:
            proceed = lambda : changeMode('Login')
            if self.expectedDisconnect:
                self.expectedDisconnect = False
                proceed()
            else:
                notify(ICON_WARNING, 'Disconnected !!!', '\nYour client has disconnected from the server.', ok_callback=proceed)
        else:
            print 'UNEXPECTED CONNECT PROGRESS VALUE:', progress
            changeMode('Login')
            notify(ICON_WARNING, "Can't Connect !!!", "\nYour client can't connect to the server.", ok_callback=BigWorld.quit)

    def restartLogin(self):
        print 'RESTART LOGIN'
        self.expectedDisconnect = True
        BigWorld.disconnect()

    def connectToBigWorld(self, username, password):
        self.username = username
        self.password = password
        BigWorld.camera().spaceID = self.spaceID
        screen = changeMode('Loading', None)
        BigWorld.callback(0.1, (lambda : BigWorld.connect(self.server, self, self.handleConnectionResponse)))
        return screen

    def makeScene(self):
        from CharCreationScene import CharCreationScene
        from Bitcasters.Math import DEGREES
        return CharCreationScene(BigWorld.entities[addViewer(self.spaceID, (-170, 1.25,
                                                                            354), (180 * DEGREES, 0.0, 0.0))])

    def transmit(self, message, *args, **kwargs):
        print 'TRANSMIT:', message, args, kwargs
        changeMode('Loading', None)
        getattr(BigWorld.player().base, message)(*args, **kwargs)
        return