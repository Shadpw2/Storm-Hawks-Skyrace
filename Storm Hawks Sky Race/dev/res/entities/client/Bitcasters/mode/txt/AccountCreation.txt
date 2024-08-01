# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/AccountCreation.py
# Compiled at: 2008-12-16 09:35:38
import BWPersonality
from keys import *
from Util import ignore
from cursor import cursor
from Mode import Mode

class AccountCreation(Mode):

    def __init__(self, handler):
        cursor('mouse')
        from Bitcasters.layers.Factory import create
        self.layer = create('AccountCreation', 0.75, owner=self)
        Mode.__init__(self, handler, {KEY_RETURN: [
                      ignore, self.click_done], 
           KEY_ESCAPE: [
                      ignore, self.click_back]})

    def cleanup(self):
        self.layer.cleanup()

    def click_done(self):
        """Create the account."""
        layer = self.layer
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_WARNING
        from I18N import TOS, PP
        ErrorText = ''
        if layer.read('username') == '':
            ErrorText += 'You must provide a user name.\n'
        if layer.read('your_email') == '':
            ErrorText += 'You must provide your email.\n'
        if layer.read('password') == '':
            ErrorText += 'You must provide a password.\n'
        elif layer.read('password') != layer.read('retype_password'):
            ErrorText += 'You mistyped your password.\n'
            layer.write('password', '')
            layer.write('retype_password', '')
            layer.focus_my('password')
        if not layer.components['terms_and_conditions'].on:
            ErrorText += 'You must read and agree to the terms & conditions.\n'
        if not layer.components['privacy_policy'].on:
            ErrorText += 'You must read and agree to the privacy policy.\n'
        if ErrorText == '':
            BWPersonality.CM.transmit('create', layer.read('username'), layer.read('password'), layer.read('your_email'), layer.read('parent_email'))
        else:
            notify(ICON_WARNING, "Can't Continue", ErrorText)

    def click_tos(self):
        from Bitcasters.layers.Factory import tos_pp
        from I18N import TOS, PP
        tos_pp('TERMS AND CONDITIONS', TOS)

    def click_pp(self):
        from Bitcasters.layers.Factory import tos_pp
        from I18N import TOS, PP
        tos_pp('PRIVACY POLICY', PP)

    def click_back(self):
        """Go back to the previous screen."""
        BWPersonality.CM.restartLogin()