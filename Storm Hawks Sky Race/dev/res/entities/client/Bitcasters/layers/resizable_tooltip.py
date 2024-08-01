# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/resizable_tooltip.py
# Compiled at: 2008-12-16 09:35:38
data = {}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        for i in range(9):
            row, column = i / 3, i % 3
            code['tt_%d' % i] = {'sprite': 'resizable_tooltip', 
               'type': 'label' if i == 4 else 'image', 
               'expand': (
                        1.0 if column == 1 else 0.0, 1.0 if row == 1 else 0.0), 
               'cell': (
                      column, row)}

        code['tt_4'].update({'text': kwargs['text'], 
           'font': 'Bronic_17', 
           'text_align': 0.5, 
           'behaviour': 'wrap'})

    def postinit(self):
        for i in range(9):
            self.components['tt_%d' % i].setMapping(i)