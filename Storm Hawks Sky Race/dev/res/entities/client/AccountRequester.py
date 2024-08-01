# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/AccountRequester.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, BWPersonality, ResMgr

class AccountRequester(BigWorld.Entity):

    def __init__(self):
        BigWorld.Entity.__init__(self)

    def accepted(self):
        BWPersonality.changeMode('AccountCreation')

    def succeedCreate(self, email):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_WARNING
        print 'CREATED AN ACCOUNT FOR:', email
        try:
            ConfigFile = ResMgr.openSection('SHOConfig.xml')
            SaveNameFlag = ConfigFile.child(0).asString
            if SaveNameFlag == 'True':
                ConfigFile.child(1).asString = email
                try:
                    ConfigFile.save()
                except:
                    pass

        except:
            return

        notify(ICON_WARNING, 'Account Info', '\nYour account has been created.')
        BWPersonality.CM.restartLogin()

    def succeedDelete(self, email):
        print 'DELETED THE ACCOUNT:', email
        BWPersonality.changeMode('Login')

    def failCreate(self, email, message):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_WARNING
        notify(ICON_WARNING, "Can't Continue", '\nCould not create an account using this name:\n' + message)
        BWPersonality.changeMode('AccountCreation')

    def failDelete(self, email, message):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_WARNING
        notify(ICON_WARNING, 'Failed', '\nCould not delete the account.')
        BWPersonality.changeMode('AccountCreation')


class PlayerAccountRequester(AccountRequester):

    def handleKeyEvent(self, isDown, key, mods):
        pass