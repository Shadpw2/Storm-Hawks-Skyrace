# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Login.py
# Compiled at: 2008-12-16 09:35:38
data = {'createanaccount': {'align': (0.635, 0.951), 
                       'labels': {'text': 'Create an account'}, 'orientation': 0, 
                       'parent': 'login', 
                       'sprite': 'thick_long', 
                       'type': 'button', 
                       'tooltip': 'Click here to create an account.'}, 
   'done': {'align': (0.196, 0.659), 
            'labels': {'text': 'Login'}, 'orientation': 0, 
            'parent': 'login', 
            'sprite': 'thick_short', 
            'type': 'button', 
            'tooltip': 'Log in to the game world.'}, 
   'login': {'align': (0.5, 0.15), 
             'orientation': 0, 
             'sprite': 'login', 
             'type': 'image'}, 
   'password': {'align': (0.414, 0.437), 
                'next': 'username', 
                'parent': 'login', 
                'password': True, 
                'sprite': 'large_text', 
                'type': 'textfield'}, 
   'pp': {'align': (0.745, 0.517), 
          'minsize': (80, 20), 
          'orientation': 0, 
          'parent': 'login', 
          'sprite': '', 
          'type': 'button', 
          'tooltip': 'Read our privacy policy.'}, 
   'quit': {'align': (0.871, 0.659), 
            'labels': {'text': 'Quit'}, 'orientation': 0, 
            'parent': 'login', 
            'sprite': 'thick_short', 
            'type': 'button', 
            'tooltip': 'Quit the program.'}, 
   'tos': {'align': (0.35, 0.517), 
           'minsize': (120, 20), 
           'orientation': 0, 
           'parent': 'login', 
           'sprite': '', 
           'type': 'button', 
           'tooltip': 'Read the terms of service.'}, 
   'username': {'align': (0.414, 0.287), 
                'next': 'password', 
                'orientation': 0, 
                'parent': 'login', 
                'sprite': 'large_text', 
                'type': 'textfield'}, 
   'version': {'align': (0.025, 0.01), 
               'behaviour': 'squeeze', 
               'field_align': (0.49, 0.46), 
               'font': 'Bronic_17', 
               'text_align': 0.0, 
               'minsize': (400, 30), 
               'orientation': 0, 
               'sprite': '', 
               'type': 'label', 
               'text': 'version number'}}
import Factory, BigWorld
from Avatar import Avatar

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        from BWPersonality import IS_BETA
        if IS_BETA:
            code['createanaccount'] = {'align': (0.635, 0.931), 'behaviour': 'squeeze', 
               'field_align': (0, 0), 
               'font': 'Bronic_27', 
               'text_align': 0.5, 
               'minsize': (289, 30), 
               'orientation': 0, 
               'parent': 'login', 
               'sprite': '', 
               'text': '* BETA VERSION *', 
               'type': 'label'}
        version = [ v.replace('Version', '').replace('_', '.') for v in dir(Avatar) if v.startswith('Version')
                  ]
        assert len(version) == 1
        code['version']['text'] = version[0]

    def postinit(self):
        self.focus_my('username')