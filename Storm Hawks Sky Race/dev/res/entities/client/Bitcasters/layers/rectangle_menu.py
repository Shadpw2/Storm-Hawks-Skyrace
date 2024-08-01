# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/rectangle_menu.py
# Compiled at: 2008-12-16 09:35:38
data = {}

def add_options_to(code, parent, button_sprite, labels, tag):
    """Add components to a given dictionary of component specifications.
        Used for creating rectangular menus (as here) and also by the SHO
        'main menu'.
        code -> (dict of string to component spec) Existing components
        (the new ones will be added; None is returned).
        parent -> (string or None) If not None, the name of the component
        that will become the parent of the added components (otherwise they
        are added directly to the layer).
        button_sprite -> (string) The name of the sprite to use for the
        buttons.
        labels -> (sequence of string) The label to apply to each button.
        tag -> (string) a prefix used to generate component names."""
    bottom_pad = len(labels) - 1
    for (i, label) in enumerate(labels):
        code[tag + '_' + str(i)] = {'align': (0.5, i / float(bottom_pad)), 'sprite': button_sprite, 
           'type': 'button', 'labels': {'text': label}}
        if parent != None:
            code[tag + '_' + str(i)]['parent'] = parent

    return


_DDSPRITE = 'large_text'
from Bitcasters.GUI.Component import Component
_sheet_data = Component.DATA['sprites'][_DDSPRITE]
(_W, _H) = tuple((_sheet_data['rect'][2 + i] / _sheet_data['tiles'][i] - 2 for i in range(2)))
import Factory, BigWorld

class Layer(Factory.Layer):
    """A procedurally generated rectangular drop-down menu."""

    def preinit(self, code, **kwargs):
        """Set up a rectangular menu by procedurally creating data that represents
                several buttons one below another in a list. A specified sprite is used for
                each button. Should not be called directly; use the create() function below.
                The menu is hard-coded to use the 'large_text' sprite for buttons (FIXME).
                code -> The basic layer code read in from the 'data' global. This just
                describes one "label" for the semicircle.
                **kwargs:
                menu_tag -> (string) a prefix used to generate component names.
                labels -> (list of strings) the labels for the buttons."""
        add_options_to(code, None, _DDSPRITE, kwargs['labels'], kwargs['menu_tag'])
        return


def create(parent, owner, child_align, parent_align, labels, menu_tag):
    """Set up a circular menu by procedurally creating data that represents
        several buttons aligned in a semicircle, and anchor it on a given
        parent component. All buttons must be the same size!
        parent -> The component to which the layer will be anchored.
        owner -> (object) As for Factory.attach_child().
        child_align -> (pair of floats) As for Factory.attach_child().
        parent_align -> (pair of floats) As for Factory.attach_child().
        menu_tag -> (string) As for preinit() above.
        labels -> (list of strings) As for preinit() above."""
    from Factory import attach_child
    return attach_child(parent, 'rectangle_menu', 0.5, owner, child_align, parent_align, size=(
     _W, _H * len(labels)), labels=labels, menu_tag=menu_tag)