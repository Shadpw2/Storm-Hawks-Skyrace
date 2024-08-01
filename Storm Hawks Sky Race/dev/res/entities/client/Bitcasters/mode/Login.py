# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/Login.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, BWPersonality, ResMgr
from keys import *
from Util import ignore
from cursor import cursor
from CharCreationScene import CharCreationScene
from Mode import Mode
LoginName = None

class Login(Mode):

    def __init__(self, handler):
        from Cameras import AimCursorCameraTo
        AimCursorCameraTo(at=Vector3(-170, 1.25, 354), direction=Vector3(0.0, 0.0, 1.0))
        cursor('mouse')
        from Bitcasters.layers.Factory import create
        self.layer = create('Login', 0.75, owner=self)
        self.branding = create('branding', 0.76, owner=self, trap_background_clicks=False)
        Mode.__init__(self, handler, {KEY_RETURN: [
                      ignore, self.click_done]})
        try:
            ConfigFile = ResMgr.openSection('SHOConfig.xml')
            PlayerName = ConfigFile.child(1).asString
            if PlayerName != '':
                self.layer.write('username', PlayerName)
                self.layer.tab()
        except:
            return

    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()
        self.branding.cleanup()

    def click_done(self):
        """Log in to StormHawks Online"""
        layer = self.layer
        username, password = layer.read('username'), layer.read('password')
        if not username:
            return
        BWPersonality.CM.connectToBigWorld(username, password)
        try:
            ConfigFile = ResMgr.openSection('SHOConfig.xml')
            SaveNameFlag = ConfigFile.child(0).asString
            if SaveNameFlag == 'True':
                ConfigFile.child(1).asString = username
                ConfigFile.save()
        except:
            pass

    def click_tos(self):
        from Bitcasters.layers.Factory import tos_pp
        from I18N import TOS, PP
        tos_pp('TERMS AND CONDITIONS', TOS)

    def click_pp(self):
        from Bitcasters.layers.Factory import tos_pp
        from I18N import TOS, PP
        tos_pp('PRIVACY POLICY', PP)

    def click_createanaccount(self):
        BWPersonality.CM.connectToBigWorld('', '')

    def click_quit(self):
        BWPersonality.confirmQuit()


# global LoginName ## Warning: Unused global