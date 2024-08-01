# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/shop.py
# Compiled at: 2008-12-16 09:35:38
data = {'ok': {'align': (0.5, 0.5), 
          'orientation': 0, 
          'sprite': 'accept', 
          'type': 'button', 
          'visible': False}, 
   'shop': {'align': (0.0, 0.6), 
            'orientation': 3, 
            'sprite': 'shop', 
            'type': 'image'}, 
   'shop_frame': {'align': (0.427, 0.766), 
                  'column_spacing': (1, 1, 1), 
                  'minsize': (275, 454), 
                  'orientation': 0, 
                  'parent': 'shop', 
                  'row_spacing': (1, 1, 1, 1, 1), 
                  'sprite': '', 
                  'type': 'viewport', 
                  'vsize': (275, 454)}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        for id in range(15):
            code['buy_%d' % id] = {'type': 'inventorybutton', 
               'cell': (
                      id % 3, id / 3), 
               'parent': 'shop_frame', 
               'sprite': 'object', 
               'hfill': (1, 0, 1), 
               'vfill': (1, 0, 1)}

    def postinit(self):
        self.components['shop_frame'].useColourShader(False)

    def update(self, shop_inventory):
        for id in range(15):
            self.components['buy_%d' % id].reset()

        for (k, v) in shop_inventory.items():
            self.components['buy_%d' % k].setItem(v)