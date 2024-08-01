# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/MainMenu.py
# Compiled at: 2008-12-16 09:35:38
data = {'bg': {'align': (0.5, 0.5), 
          'sprite': 'mainmenu', 
          'labels': {'text': 'MAIN MENU'}, 'type': 'image'}, 
   'exit': {'align': (0.95, 0.1), 
            'parent': 'bg', 
            'sprite': 'exit', 
            'type': 'button'}, 
   'window': {'align': (0.45, 0.85), 
              'minsize': (289, 330), 
              'parent': 'bg', 
              'sprite': '', 
              'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        from rectangle_menu import add_options_to
        add_options_to(code, 'window', 'thick_long', kwargs['labels'], kwargs['menu_tag'])

    def click_fade(self):
        return True