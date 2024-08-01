# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/target.py
# Compiled at: 2008-12-16 09:35:38
data = {'chat': {'align': (0.4, 0.5), 
            'orientation': 0, 
            'sprite': 'notify_chat', 
            'type': 'image'}, 
   'name': {'align': (0.5, 0.4), 
            'behaviour': 'squeeze', 
            'font': 'Bronic_17', 
            'text_align': 0.5, 
            'minsize': (200, 30), 
            'orientation': 0, 
            'sprite': '', 
            'type': 'label'}, 
   'race_1': {'align': (0.6, 0.5), 
              'orientation': 0, 
              'sprite': 'notify_race_1', 
              'type': 'image'}, 
   'race_2': {'align': (0.6, 0.6), 
              'orientation': 0, 
              'sprite': 'notify_race_2', 
              'type': 'image'}, 
   'trade': {'align': (0.4, 0.6), 
             'orientation': 0, 
             'sprite': 'notify_trade', 
             'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.playername = kwargs['player_name']
        self.matrix = kwargs['matrix']

    def postinit(self):
        self.components['name'].text = self.playername
        self.anchorTo(self.matrix)
        for child in self.children.values():
            child.visible = False

        self.set('name', True)

    def set(self, action, setting):
        print 'TARGET SET:', action, setting
        if action.startswith('race'):
            (action, track) = action.split('_', 1)
            action += {'saharr_test_2': '_1', 'cave_track': '_2'}[track]
        self.components[action].visible = setting