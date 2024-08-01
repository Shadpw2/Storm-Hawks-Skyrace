# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Loading.py
# Compiled at: 2008-12-16 09:35:38
data = {'loading': {'align': (0.5, 0.5), 
               'expand': (1, 1), 
               'orientation': 0, 
               'sprite': 'loading', 
               'type': 'image'}, 
   'progress': {'align': (0.449, 0.676), 
                'orientation': 0, 
                'parent': 'window', 
                'slant': 0.1, 
                'sprite': 'progress', 
                'type': 'gauge'}, 
   'toptitle': {'align': (0.499, 0.0), 
                'orientation': 0, 
                'parent': 'loading', 
                'sprite': 'toptitle', 
                'type': 'image'}, 
   'window': {'align': (0.5, 0.5), 
              'orientation': 3, 
              'parent': 'loading', 
              'sprite': 'window', 
              'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def set(self, value, time):
        return self.components['progress'].set(value, time, False) >= 1