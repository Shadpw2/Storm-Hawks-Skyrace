# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/CharSelection.py
# Compiled at: 2008-12-16 09:35:38
data = {'back': {'align': (0.053, 1.0), 
            'orientation': 0, 
            'parent': 'char_selection', 
            'sprite': 'back', 
            'type': 'button', 
            'tooltip': 'Back to login screen.'}, 
   'char_selection': {'align': (1.0, 0.5), 
                      'orientation': 0, 
                      'sprite': 'char_selection', 
                      'type': 'image'}, 
   'character_pane': {'align': (0.92, 0.319), 
                      'column_spacing': (1, ), 
                      'is_radio_group': True, 
                      'minsize': (270, 384), 
                      'orientation': 0, 
                      'parent': 'char_selection', 
                      'type': 'viewport', 
                      'z': 0.75}, 
   'delete_character': {'align': (0.485, 0.838), 
                        'labels': {'text': 'Delete character'}, 'orientation': 0, 
                        'parent': 'char_selection', 
                        'sprite': 'thin_long', 
                        'type': 'button', 
                        'tooltip': 'Delete the selected character from the server.'}, 
   'done': {'align': (0.731, 0.967), 
            'labels': {'text': 'DONE'}, 'orientation': 0, 
            'parent': 'char_selection', 
            'sprite': 'thick_short', 
            'type': 'button'}, 
   'down': {'align': (0.5, 1.0), 
            'orientation': 0, 
            'parent': 'scrollbar', 
            'sprite': 'down', 
            'type': 'button'}, 
   'new_character': {'align': (1.0, 0.838), 
                     'labels': {'text': 'New character'}, 'orientation': 0, 
                     'parent': 'char_selection', 
                     'sprite': 'thin_medium', 
                     'type': 'button', 
                     'tooltip': 'Create a new character.'}, 
   'overlay': {'align': (0.92, 0.319), 
               'minsize': (270, 384), 
               'parent': 'char_selection', 
               'type': 'viewport', 
               'vsize': (270, 384), 
               'z': 0.5}, 
   'scrollbar': {'align': (1.0, 0.5), 
                 'orientation': 0, 
                 'parent': 'overlay', 
                 'sprite': 'scrollbar', 
                 'type': 'image'}, 
   'scrollbar_knob': {'align': (0.5, 0.5), 
                      'expand': (1.0, 0.0), 
                      'orientation': 0, 
                      'parent': 'scrollbar_middle', 
                      'sprite': 'scroll_knob', 
                      'type': 'slider'}, 
   'scrollbar_middle': {'align': (0.5, 0.5), 
                        'expand': (1.0, 0.0), 
                        'minsize': (22, 340), 
                        'orientation': 0, 
                        'parent': 'scrollbar', 
                        'sprite': '', 
                        'type': 'image'}, 
   'selected_name': {'align': (0.099, 0.961), 
                     'behaviour': 'squeeze', 
                     'field_align': (0.0, 0.0), 
                     'font': 'Bronic_27', 
                     'text_align': 0.5, 
                     'minsize': (245, 30), 
                     'orientation': 0, 
                     'sprite': '', 
                     'text': '', 
                     'type': 'label'}, 
   'up': {'align': (0.5, 0.0), 
          'orientation': 0, 
          'parent': 'scrollbar', 
          'sprite': 'up', 
          'type': 'button'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.scene = kwargs['scene']
        self.chardata = kwargs['chardata']
        self.charcount = len(self.chardata)
        assert self.charcount in range(1, 6)
        rows = max(3, self.charcount)
        code['character_pane']['vsize'] = (270, 128 * rows)
        for char_id in range(self.charcount):
            code['char_%d' % char_id] = {'align': (0, (char_id + 0.0) / (rows - 1)), 'parent': 'character_pane', 
               'sprite': 'highlight', 
               'type': 'checkbox'}

    def postinit(self):
        self.components['scrollbar_knob'].value = (0, 0)
        from CharCreation import NAMES
        for (i, character) in enumerate(self.chardata):
            box = self.components['char_%d' % i]
            box.write('name', character['name'])
            box.write('data', 'Level 1\n%(class)s\n%(species)s %(gender)s' % dict(((k, NAMES[k][character[k]]) for k in ('class',
                                                                                                                         'species',
                                                                                                                         'gender'))))

        self.components['char_0'].on = True
        self.components['scrollbar'].visible = self.charcount > 3
        self.components['new_character'].visible = self.charcount < 5
        self.selected = -1

    def click_char(self, id):
        selected = int(id)
        if selected == self.selected:
            return
        self.selected = selected
        self.scene.show()
        character = self.chardata[selected]
        self.components['selected_name'].text = character['name']
        for (k, v) in character.items():
            self.scene.adjustModel(k, v)

    def _page(self, delta):
        self.components['scrollbar_knob'].v += delta / (self.charcount - 3)

    def click_up(self):
        self._page(-1.0)

    def click_down(self):
        self._page(1.0)

    def set_scrollbar_knob(self, value):
        self.components['character_pane'].scroll = (
         0, value[1] * 128 * (self.charcount - 3))