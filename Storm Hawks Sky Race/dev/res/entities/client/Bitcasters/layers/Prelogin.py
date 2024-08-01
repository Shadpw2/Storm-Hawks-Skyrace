# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Prelogin.py
# Compiled at: 2008-12-16 09:35:38
data = {'createanaccount': {'align': (0.536, 0.601), 
                       'labels': {'text': 'Create an account'}, 'orientation': 0, 
                       'parent': 'prelogin', 
                       'sprite': 'thick_long', 
                       'type': 'button', 
                       'tooltip': 'Click here to create an account.'}, 
   'ihaveanaccount': {'align': (0.536, 0.419), 
                      'labels': {'text': 'I have an account'}, 'orientation': 0, 
                      'parent': 'prelogin', 
                      'sprite': 'thick_long', 
                      'type': 'button', 
                      'tooltip': 'Click here to use an existing account.'}, 
   'prelogin': {'align': (0.501, 0.502), 
                'orientation': 3, 
                'sprite': 'prelogin', 
                'type': 'image'}, 
   'quit': {'align': (0.545, 0.779), 
            'labels': {'text': 'Quit'}, 'orientation': 0, 
            'parent': 'prelogin', 
            'sprite': 'thick_short', 
            'type': 'button', 
            'tooltip': 'Quit the program.'}, 
   'toptitle': {'align': (0.501, 0.0), 
                'orientation': 0, 
                'sprite': 'toptitle', 
                'type': 'image'}, 
   'version': {'align': (1.0, 1.0), 
               'behaviour': 'squeeze', 
               'field_align': (0.49, 0.46), 
               'font': 'Bronic_17', 
               'text_align': 1.0, 
               'minsize': (400, 30), 
               'orientation': 0, 
               'sprite': '', 
               'type': 'label'}}
import Factory, BigWorld
from Avatar import Avatar

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        version = [ v.replace('Version', '').replace('_', '.') for v in dir(Avatar) if v.startswith('Version')
                  ]
        assert len(version) == 1
        code['version']['text'] = version[0]