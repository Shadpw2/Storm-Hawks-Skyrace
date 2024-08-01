# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/summary.py
# Compiled at: 2008-12-16 09:35:38
data = {'accept': {'align': (0.5, 0.97), 
              'orientation': 0, 
              'parent': 'bg', 
              'sprite': 'accept', 
              'type': 'button'}, 
   'bg': {'align': (0.5, 0.5), 
          'labels': {'position': '', 'crystals': '', 'boosts': '', 'gold': ''}, 'orientation': 0, 
          'sprite': 'race_summary', 
          'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        for arg in kwargs:
            if arg in code['bg']['labels']:
                code['bg']['labels'][arg] = kwargs[arg]

        action = lambda : self.dismiss(kwargs['callback'])
        self.click_accept = action
        Layer.bind_key('enter', action)