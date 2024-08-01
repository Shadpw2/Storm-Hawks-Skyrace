# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/trade.py
# Compiled at: 2008-12-16 09:35:38
data = {'accept_refuse': {'align': (0.776, 0.972), 
                     'altsprite': 'refuse', 
                     'orientation': 0, 
                     'parent': 'trading_bg', 
                     'sprite': 'accept', 
                     'type': 'togglebutton'}, 
   'get_frame': {'align': (0.216, 0.397), 
                 'column_spacing': (1, ), 
                 'minsize': (155, 315), 
                 'parent': 'trading_bg', 
                 'row_spacing': (1, 1, 1, 1), 
                 'sprite': '', 
                 'type': 'viewport', 
                 'vsize': (155, 315)}, 
   'give_frame': {'align': (0.788, 0.397), 
                  'column_spacing': (1, ), 
                  'minsize': (155, 315), 
                  'parent': 'trading_bg', 
                  'row_spacing': (1, 1, 1, 1), 
                  'sprite': '', 
                  'type': 'viewport', 
                  'vsize': (155, 315)}, 
   'other_accepted': {'align': (0.12, 0.96), 
                      'orientation': 0, 
                      'parent': 'trading_bg', 
                      'sprite': 'accepted', 
                      'type': 'image'}, 
   'trading_bg': {'align': (0.0, 1.0), 
                  'orientation': 0, 
                  'sprite': 'trading_bg', 
                  'type': 'image'}, 
   'your_accepted': {'align': (0.911, 0.96), 
                     'orientation': 0, 
                     'parent': 'trading_bg', 
                     'sprite': 'accepted', 
                     'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        for id in range(4):
            for type in ('give', 'get'):
                code['%s_%d' % (type, id)] = {'type': 'inventorybutton', 
                   'cell': (
                          0, id), 
                   'parent': '%s_frame' % type, 
                   'sprite': 'object', 
                   'hfill': (1, 0, 1), 
                   'vfill': (1, 0, 1)}

    def postinit(self):
        for frame in ('give_frame', 'get_frame'):
            self.components[frame].useColourShader(False)

    def update(self, giving_details, getting_details):
        for id in range(4):
            self.components['give_%d' % id].reset()
            self.components['get_%d' % id].reset()

        for (i, item) in enumerate(giving_details):
            self.components['give_%d' % i].setItem(item)

        for (i, item) in enumerate(getting_details):
            self.components['get_%d' % i].setItem(item)

    def fade(self, eta=1.0):
        for frame in ('get_frame', 'give_frame'):
            self.components[frame].useColourShader(True)

        self.to((255, 255, 255, 0), 1)