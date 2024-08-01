# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/CharCreation.py
# Compiled at: 2008-12-16 09:35:38
data = {'cancel': {'align': (0.894, 0.975), 
              'labels': {'text': 'CANCEL'}, 'orientation': 0, 
              'parent': 'char_creation', 
              'sprite': 'thick_short', 
              'type': 'button', 
              'tooltip': 'Go back to the character selection screen.'}, 
   'char_creation': {'align': (1.0, 0.5), 
                     'orientation': 0, 
                     'sprite': 'char_creation', 
                     'type': 'image'}, 
   'class': {'align': (0.314, 0.316), 
             'column_spacing': (1, 1, 1, 1, 1, 1, 1, 1), 
             'is_radio_group': True, 
             'minsize': (119, 55), 
             'orientation': 0, 
             'parent': 'char_creation', 
             'scroll': (27, 0), 
             'sprite': '', 
             'type': 'viewport', 
             'vsize': (440, 55)}, 
   'class_left': {'align': (0.176, 0.319), 
                  'orientation': 0, 
                  'parent': 'char_creation', 
                  'sprite': 'left', 
                  'type': 'button', 
                  'tooltip': 'Previous class.'}, 
   'class_name': {'align': (0.311, 0.417), 
                  'orientation': 0, 
                  'parent': 'char_creation', 
                  'sprite': 'small_text', 
                  'type': 'image'}, 
   'class_right': {'align': (0.52, 0.321), 
                   'orientation': 0, 
                   'parent': 'char_creation', 
                   'sprite': 'right', 
                   'type': 'button', 
                   'tooltip': 'Next class.'}, 
   'clothesColour1': {'align': (0.488, 0.5), 
                      'hpositions': 256, 
                      'orientation': 0, 
                      'parent': 'clothesColour1_bg', 
                      'sprite': 'slider_knob', 
                      'type': 'slider'}, 
   'clothesColour1_bg': {'align': (0.575, 0.83), 
                         'minsize': (157, 47), 
                         'orientation': 0, 
                         'parent': 'char_creation', 
                         'sprite': '', 
                         'type': 'image'}, 
   'clothesColour2': {'align': (0.504, 0.5), 
                      'hpositions': 256, 
                      'orientation': 0, 
                      'parent': 'clothesColour2_bg', 
                      'sprite': 'slider_knob', 
                      'type': 'slider'}, 
   'clothesColour2_bg': {'align': (1.0, 0.83), 
                         'minsize': (157, 47), 
                         'orientation': 0, 
                         'parent': 'char_creation', 
                         'sprite': '', 
                         'type': 'image'}, 
   'clothes_left': {'align': (0.28, 0.825), 
                    'orientation': 0, 
                    'parent': 'char_creation', 
                    'sprite': 'left', 
                    'type': 'button', 
                    'tooltip': 'Previous outfit.'}, 
   'clothes_right': {'align': (0.366, 0.825), 
                     'orientation': 0, 
                     'parent': 'char_creation', 
                     'sprite': 'right', 
                     'type': 'button', 
                     'tooltip': 'Next outfit.'}, 
   'done': {'align': (0.379, 0.975), 
            'labels': {'text': 'DONE'}, 'orientation': 0, 
            'parent': 'char_creation', 
            'sprite': 'thick_short', 
            'type': 'button', 
            'tooltip': 'Create this character on the server.'}, 
   'eyeColour': {'align': (0.484, 0.5), 
                 'hpositions': 256, 
                 'orientation': 0, 
                 'parent': 'eyeColour_bg', 
                 'sprite': 'slider_knob', 
                 'type': 'slider'}, 
   'eyeColour_bg': {'align': (0.511, 0.519), 
                    'minsize': (249, 47), 
                    'orientation': 0, 
                    'parent': 'char_creation', 
                    'sprite': '', 
                    'type': 'image'}, 
   'gender_right': {'align': (0.962, 0.133), 
                    'altsprite': 'female', 
                    'orientation': 0, 
                    'parent': 'char_creation', 
                    'sprite': 'male', 
                    'type': 'togglebutton', 
                    'tooltip': "Change the character's gender."}, 
   'hairColour1': {'align': (0.457, 0.5), 
                   'hpositions': 256, 
                   'orientation': 0, 
                   'parent': 'hairColour1_bg', 
                   'sprite': 'slider_knob', 
                   'type': 'slider'}, 
   'hairColour1_bg': {'align': (0.575, 0.722), 
                      'minsize': (157, 47), 
                      'orientation': 0, 
                      'parent': 'char_creation', 
                      'sprite': '', 
                      'type': 'image'}, 
   'hairColour2': {'align': (0.45, 0.5), 
                   'hpositions': 256, 
                   'orientation': 0, 
                   'parent': 'hairColour2_bg', 
                   'sprite': 'slider_knob', 
                   'type': 'slider'}, 
   'hairColour2_bg': {'align': (1.0, 0.722), 
                      'minsize': (157, 47), 
                      'orientation': 0, 
                      'parent': 'char_creation', 
                      'sprite': '', 
                      'type': 'image'}, 
   'hair_left': {'align': (0.28, 0.72), 
                 'orientation': 0, 
                 'parent': 'char_creation', 
                 'sprite': 'left', 
                 'type': 'button', 
                 'tooltip': 'Select a different hairstyle.'}, 
   'hair_right': {'align': (0.366, 0.72), 
                  'orientation': 0, 
                  'parent': 'char_creation', 
                  'sprite': 'right', 
                  'type': 'button', 
                  'tooltip': 'Select a different hairstyle.'}, 
   'name': {'align': (0.266, 0.161), 
            'next': 'name', 
            'orientation': 0, 
            'parent': 'char_creation', 
            'sprite': 'medium_text', 
            'type': 'textfield'}, 
   'random_everything': {'align': (0.994, 0.009), 
                         'labels': {'text': 'Random Everything'}, 'orientation': 0, 
                         'parent': 'char_creation', 
                         'sprite': 'thin_long', 
                         'type': 'button', 
                         'tooltip': 'Randomize everything!'}, 
   'random_look': {'align': (1.0, 0.52), 
                   'labels': {'text': 'Random Look'}, 'orientation': 0, 
                   'parent': 'char_creation', 
                   'sprite': 'thin_medium', 
                   'type': 'button', 
                   'tooltip': 'Randomize colours, outfit and hairstyle.'}, 
   'skinColour': {'align': (0.459, 0.5), 
                  'hpositions': 256, 
                  'orientation': 0, 
                  'parent': 'skinColour_bg', 
                  'sprite': 'slider_knob', 
                  'type': 'slider'}, 
   'skinColour_bg': {'align': (1.0, 0.622), 
                     'minsize': (307, 47), 
                     'orientation': 0, 
                     'parent': 'char_creation', 
                     'sprite': '', 
                     'type': 'image'}, 
   'species': {'align': (0.852, 0.317), 
               'column_spacing': (1, 1, 1, 1, 1), 
               'is_radio_group': True, 
               'minsize': (119, 55), 
               'orientation': 0, 
               'parent': 'char_creation', 
               'scroll': (27, 0), 
               'sprite': '', 
               'type': 'viewport', 
               'vsize': (275, 55)}, 
   'species_left': {'align': (0.621, 0.321), 
                    'orientation': 0, 
                    'parent': 'char_creation', 
                    'sprite': 'left', 
                    'type': 'button', 
                    'tooltip': 'Coming Soon!!!'}, 
   'species_name': {'align': (0.86, 0.418), 
                    'orientation': 0, 
                    'parent': 'char_creation', 
                    'sprite': 'small_text', 
                    'type': 'image'}, 
   'species_right': {'align': (0.963, 0.321), 
                     'orientation': 0, 
                     'parent': 'char_creation', 
                     'sprite': 'right', 
                     'type': 'button', 
                     'tooltip': 'Coming Soon!!!'}}
NAMES = {'clothes': ('Civilian', 'Armour', 'Flightsuit'), 
   'hair': ('Bald', 'Normal', 'Mohawk'), 
   'gender': ('Female', 'Male'), 
   'class': ('Mechanic', 'Sharpshooter', 'Leader', 'Technician', 'Navigator', 'Alchemist'), 
   'species': ('Human', 'Merb', 'Wallop')}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        for (i, name) in enumerate(('alchemist', 'mechanic', 'sharpshooter', 'leader',
                                    'technician', 'navigator', 'alchemist', 'mechanic')):
            code['class_%d' % i] = {'cell': (
                      i, 0), 
               'hfill': (1, 0, 1), 
               'parent': 'class', 
               'sprite': name, 
               'type': 'image', 
               'vfill': (1, 0, 1)}

        for (i, name) in enumerate(('wallop', 'human', 'merb', 'wallop', 'human')):
            code['species_%d' % i] = {'cell': (
                      i, 0), 
               'hfill': (1, 0, 1), 
               'parent': 'species', 
               'sprite': name, 
               'type': 'image', 
               'vfill': (1, 0, 1)}

        self.character = {'hair': 0, 
           'class': 0, 
           'species': 0, 
           'gender': 1, 
           'clothes': 0, 
           'eyeColour': 128, 
           'skinColour': 128, 
           'hairColour1': 128, 
           'hairColour2': 128, 
           'clothesColour1': 128, 
           'clothesColour2': 128}
        self.scene = kwargs['scene']
        for (k, v) in self.character.items():
            self.scene.adjustModel(k, v)

    def postinit(self):
        self.scroll('species', 0)
        self.scroll('class', 0)
        self.focus_my('name')

    def character_data(self):
        clone = dict(self.character)
        clone['name'] = self.components['name'].text
        return clone

    def click_name(self):
        pass

    def click_cancel(self):
        pass

    def click_done(self):
        pass

    def click(self, attribute, direction):
        self.scroll(attribute, {'left': -1, 'right': 1}[direction])

    def click_species(self, direction):
        from Bitcasters.layers.Factory import notify
        from Bitcasters.layers.dialog import ICON_NONE
        notify(ICON_NONE, 'COMING SOON...', '\nThe other species will be coming soon.')

    def click_random_everything(self):
        from random import randrange
        self.click_random_look()
        self.scroll_random('class')
        if randrange(2):
            gender_button = self.components['gender_right']
            gender_button.on = not gender_button.on
            self.click('gender', 'right')

    def click_random_look(self):
        from random import randrange
        for colour in ('eyeColour', 'skinColour', 'hairColour1', 'clothesColour1',
                       'clothesColour2'):
            self.components[colour].value = (randrange(256), 0)

        self.components['hairColour2'].value = self.components['hairColour1'].value
        self.scroll_random('hair')
        self.scroll_random('clothes')

    def set(self, slider_name, value):
        assert slider_name in ('eyeColour', 'skinColour', 'hairColour1', 'hairColour2',
                               'clothesColour1', 'clothesColour2')
        value = value[0]
        assert value >= 0 and value <= 255
        self.character[slider_name] = value
        self.scene.adjustModel(slider_name, value)

    def scroll_random(self, attribute):
        from random import randrange
        self.scroll(attribute, randrange(len(NAMES[attribute])))

    def scroll(self, attribute, direction):
        components = self.components
        character = self.character
        scene = self.scene
        if attribute in ('species', 'class'):
            components['%s_%d' % (attribute, character[attribute] + 1)].setMapping(0)
        value = (character[attribute] + direction) % len(NAMES[attribute])
        character[attribute] = value
        if attribute == 'clothes':
            data = self.character
            from InventoryItem import deserialize
            scene.adjustModel('inventory', deserialize([
             {'prototype_id': value + 1, 
                'inventoryLocation': 0, 
                'socketCode': 1, 
                'colour1': data['clothesColour1'], 
                'colour2': data['clothesColour2'], 
                'condition': 0}]))
            return
        scene.adjustModel(attribute, value)
        if attribute in ('species', 'class'):
            components[attribute + '_name'].write('text', NAMES[attribute][value].title())
            components['%s_%d' % (attribute, value + 1)].setMapping(1)
            components[attribute].scroll = (55 * (value + 0.5), 0)