# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/tos_pp.py
# Compiled at: 2008-12-16 09:35:38
data = {'dialog_scroll': {'align': (1.0, 0.5), 
                     'orientation': 0, 
                     'parent': 'tos_pp', 
                     'sprite': 'dialog_scroll', 
                     'type': 'image'}, 
   'down': {'align': (0.731, 0.891), 
            'orientation': 0, 
            'parent': 'dialog_scroll', 
            'sprite': 'down', 
            'type': 'button'}, 
   'exit': {'align': (0.724, 0.129), 
            'orientation': 0, 
            'parent': 'dialog_scroll', 
            'sprite': 'exit', 
            'type': 'button'}, 
   'knob': {'align': (0.5, 0.5), 
            'orientation': 0, 
            'parent': 'knob_region', 
            'sprite': 'endscroll_knob', 
            'type': 'slider'}, 
   'knob_region': {'align': (0.851, 0.647), 
                   'minsize': (41, 177), 
                   'orientation': 0, 
                   'parent': 'dialog_scroll', 
                   'sprite': '', 
                   'type': 'image'}, 
   'scroll': {'align': (0.851, 0.726), 
              'orientation': 0, 
              'parent': 'dialog_scroll', 
              'sprite': '', 
              'type': 'image'}, 
   'small_text': {'behaviour': 'wrap', 
                  'expand': (1, 1), 
                  'font': 'tos_pp', 
                  'orientation': 0, 
                  'parent': 'tos_pp', 
                  'region': 'small_text', 
                  'sprite': '', 
                  'type': 'label'}, 
   'tos_pp': {'align': (0.5, 0.5), 
              'labels': {'title': ''}, 'orientation': 0, 
              'sprite': 'dialog_bg', 
              'type': 'image'}, 
   'up': {'align': (0.731, 0.248), 
          'orientation': 0, 
          'parent': 'dialog_scroll', 
          'sprite': 'up', 
          'type': 'button'}}
LINE_HEIGHT = 19
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        code['small_text']['text'] = kwargs['text']
        code['tos_pp']['labels']['title'] = kwargs['title']
        Layer.bind_key('escape', self.click_exit)

    def postinit(self):
        c = self.components
        (u, k, d, t) = (c['up'], c['knob'], c['down'], c['small_text'])
        self.t = t
        self.k = k
        k.vpos = t.max_scroll + 1
        k.value = (0, 0)
        u.z = 0
        d.z = 0

    def click_exit(self):
        self.dismiss()

    def click_up(self):
        self.k.v -= 1

    def click_down(self):
        self.k.v += 1

    def set_knob(self, value):
        self.t.scrollTo(value[1])