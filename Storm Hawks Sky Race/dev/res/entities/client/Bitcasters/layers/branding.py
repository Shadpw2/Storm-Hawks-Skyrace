# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/branding.py
# Compiled at: 2008-12-16 09:35:38
data = {'banner': {'align': (0.492, 1.0), 
              'cell': (0, 0), 
              'expand': (0.0, 0.0), 
              'is_radio_group': False, 
              'labels': {}, 'minsize': (682, 77), 
              'next': None, 
              'orientation': 0, 
              'sprite': 'banner', 
              'type': 'image', 
              'z': 1}, 
   'logos_broadcaster': {'align': (0.288, 0.661), 
                         'cell': (0, 0), 
                         'expand': (0.0, 0.0), 
                         'is_radio_group': False, 
                         'labels': {}, 'minsize': (79, 21), 
                         'next': None, 
                         'orientation': 0, 
                         'parent': 'banner', 
                         'sprite': 'logos_abc', 
                         'type': 'image', 
                         'z': 1}, 
   'logos_bell': {'align': (0.652, 0.711), 
                  'cell': (0, 0), 
                  'expand': (0.0, 0.0), 
                  'is_radio_group': False, 
                  'labels': {}, 'minsize': (78, 25), 
                  'next': None, 
                  'orientation': 0, 
                  'parent': 'banner', 
                  'sprite': 'logos_bell', 
                  'type': 'image', 
                  'z': 1}, 
   'logos_bigworld': {'align': (0.47, 0.667), 
                      'cell': (0, 0), 
                      'expand': (0.0, 0.0), 
                      'is_radio_group': False, 
                      'labels': {}, 'minsize': (107, 23), 
                      'next': None, 
                      'orientation': 0, 
                      'parent': 'banner', 
                      'sprite': 'logos_bigworld', 
                      'type': 'image', 
                      'z': 1}, 
   'logos_bitcasters': {'align': (0.073, 0.558), 
                        'cell': (0, 0), 
                        'expand': (0.0, 0.0), 
                        'is_radio_group': False, 
                        'labels': {}, 'minsize': (115, 25), 
                        'next': None, 
                        'orientation': 0, 
                        'parent': 'banner', 
                        'sprite': 'logos_bitcasters', 
                        'type': 'image', 
                        'z': 1}, 
   'logos_nerdcorps': {'align': (0.936, 0.923), 
                       'cell': (0, 0), 
                       'expand': (0.0, 0.0), 
                       'is_radio_group': False, 
                       'labels': {}, 'minsize': (72, 64), 
                       'next': None, 
                       'orientation': 0, 
                       'parent': 'banner', 
                       'sprite': 'logos_nerdcorps', 
                       'type': 'image', 
                       'z': 1}, 
   'logos_telefilm': {'align': (0.795, 0.635), 
                      'cell': (0, 0), 
                      'expand': (0.0, 0.0), 
                      'is_radio_group': False, 
                      'labels': {}, 'minsize': (59, 25), 
                      'next': None, 
                      'orientation': 0, 
                      'parent': 'banner', 
                      'sprite': 'logos_telefilm', 
                      'type': 'image', 
                      'z': 1}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        try:
            from Bitcasters.Const import CFG_KEYNAME, CFG_MAP
            sponsor = CFG_MAP[CFG_KEYNAME]['sponsor']
        except:
            sponsor = 'ytv'

        code['logos_broadcaster']['sprite'] = 'logos_' + sponsor

    def postinit(self):
        pass