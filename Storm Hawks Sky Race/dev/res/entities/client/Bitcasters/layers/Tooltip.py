# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Tooltip.py
# Compiled at: 2008-12-16 09:35:38
data = {'tt': {'sprite': 'tooltip', 
          'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.text = kwargs['text']

    def postinit(self):
        self.components['tt'].write('text', self.text)