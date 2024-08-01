# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/RaceStatus.py
# Compiled at: 2008-12-16 09:35:38
data = {'clip': {'align': (0.795, 0.176), 
            'parent': 'clip_frame', 
            'sprite': 'clip', 
            'type': 'image'}, 
   'clip_frame': {'minsize': (800, 600), 
                  'type': 'viewport', 
                  'vsize': (800, 600), 
                  'z': 0.8}, 
   'holder_1': {'align': (0.791, 1.0), 
                'orientation': 0, 
                'sprite': 'cc_holder', 
                'labels': {'text': '1'}, 'type': 'image', 
                'z': 0}, 
   'holder_1_cc': {'align': (0.836, 0.975), 
                   'orientation': 0, 
                   'sprite': 'cc_connector', 
                   'type': 'image'}, 
   'holder_2': {'align': (0.896, 1.0), 
                'orientation': 0, 
                'sprite': 'cc_holder', 
                'labels': {'text': '2'}, 'type': 'image', 
                'z': 0}, 
   'holder_2_cc': {'align': (0.939, 0.975), 
                   'orientation': 0, 
                   'sprite': 'cc_connector', 
                   'type': 'image'}, 
   'holder_3': {'align': (1.0, 1.0), 
                'orientation': 0, 
                'sprite': 'cc_holder', 
                'labels': {'text': '3'}, 'type': 'image', 
                'z': 0}, 
   'info': {'align': (0.5, 0.5), 
            'behaviour': 'squeeze', 
            'font': 'Bronic+2', 
            'text_align': 0.5, 
            'minsize': (800, 177), 
            'sprite': '', 
            'type': 'label'}, 
   'race_bg': {'align': (0.876, 0.0), 
               'orientation': 0, 
               'sprite': 'race_bg', 
               'type': 'image'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        pass

    def holder(self, num):
        return self.components['holder_%d' % num]

    def postinit(self):
        for x in (1, 2, 3):
            self.holder(x).setMapping(2)

    def updateCrystals(self, crystals):
        for (holder, crystal) in zip((1, 2, 3), crystals):
            self.holder(holder).setMapping(0 if crystal else 2)

    def useCrystal(self, which):
        holder = self.holder(1 + which)
        if holder._mapping != 0:
            return False
        holder.setMapping(2)
        return True

    def setText(self, component, label, message):
        self.components[component].write(label, message)