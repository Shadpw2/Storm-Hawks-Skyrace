# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/target_npc.py
# Compiled at: 2008-12-16 09:35:38
data = {'name': {'align': (0.5, 0.4), 
            'behaviour': 'squeeze', 
            'font': 'Bronic_17', 
            'text_align': 0.5, 
            'minsize': (500, 30), 
            'orientation': 0, 
            'sprite': '', 
            'type': 'label'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.playername = kwargs['player_name']
        self.matrix = kwargs['matrix']

    def postinit(self):
        self.components['name'].text = self.playername
        self.anchorTo(self.matrix)

    def set(self, action, setting):
        self.components[action].visible = setting