# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/dialog.py
# Compiled at: 2008-12-16 09:35:38
data = {'bg': {'align': (0.454, 0.5), 
          'orientation': 0, 
          'sprite': 'dialog_bg', 
          'type': 'image', 
          'labels': {'text': '', 'title': ''}}, 
   'icon': {'align': (0.049, 0.213), 
            'orientation': 0, 
            'sprite': 'dialog_icons', 
            'type': 'image'}, 
   'panel': {'align': (0.822, 0.814), 
             'orientation': 0, 
             'sprite': 'dialog_panel', 
             'type': 'image'}, 
   'panel_a': {'align': (0.0, 0.5), 
               'minsize': (87, 94), 
               'parent': 'panel', 
               'sprite': '', 
               'type': 'image'}, 
   'panel_b': {'align': (1.0, 0.5), 
               'minsize': (87, 94), 
               'parent': 'panel', 
               'sprite': '', 
               'type': 'image'}, 
   'pipe': {'align': (0.092, 0.474), 
            'orientation': 0, 
            'sprite': 'dialog_pipe', 
            'type': 'image'}}
import Factory, BigWorld
ICON_QUESTION = 0
ICON_ERROR = 1
ICON_WARNING = 2
ICON_NONE = 3

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        panel_mapping = 2
        for (possible_button, sprite, key) in (
         ('ok', 'accept', 'enter'),
         ('cancel', 'refuse', 'escape')):
            if possible_button in kwargs:
                panel_mapping -= 1
                code[possible_button] = {'hfill': (1, 0, 1), 
                   'parent': 'panel_' + ('b' if panel_mapping == 1 else 'a'), 
                   'sprite': sprite, 
                   'type': 'button', 
                   'vfill': (1, 0, 1)}
                action = (lambda x: (lambda : self.dismiss(x)))(kwargs[possible_button])
                setattr(self, 'click_' + possible_button, action)
                Layer.bind_key(key, action)

        assert panel_mapping in (0, 1)
        self.panel_mapping = panel_mapping
        self.icon = kwargs['icon']
        for text_item in kwargs:
            if text_item in code['bg']['labels']:
                code['bg']['labels'][text_item] = kwargs[text_item]

    def postinit(self):
        self.components['icon'].setMapping(self.icon)
        self.components['pipe'].visible = self.icon != ICON_NONE
        self.components['panel'].setMapping(self.panel_mapping)