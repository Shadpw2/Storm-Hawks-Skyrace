# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/circle_menu.py
# Compiled at: 2008-12-16 09:35:38
data = {'target': {'align': (0.5, 0.25), 
              'behaviour': 'squeeze', 
              'font': 'Bronic_27', 
              'minsize': (240, 30), 
              'text_align': 0.5, 
              'orientation': 0, 
              'sprite': '', 
              'trap_background_clicks': False, 
              'type': 'label'}}

def _arc_position(radius, id, total, rotation):
    from math import pi, cos, sin
    angle = pi * (rotation + (id + 1.0) / (total + 1.0))
    return (
     radius * cos(angle),
     radius * sin(angle))


ABOVE = 1.0
RIGHT = 1.5
import Factory, BigWorld

class Layer(Factory.Layer):
    """A procedurally generated circular menu."""

    def preinit(self, code, **kwargs):
        """Set up a circular menu by procedurally creating data that represents
                several buttons aligned in a semicircle. Should not be called directly;
                use the create() function below. All buttons must be the same size!
                code -> The basic layer code read in from the 'data' global. This just
                describes one "label" for the semicircle.
                **kwargs:
                MUST include:
                menu_tag -> (string) a prefix used to generate component names.
                radius -> (int) The radius in pixels of the semicircle. Components are
                positioned such that their centers are on the circumference of the arc.
                items -> (list of pairs of string) The items to add to the semicircle.
                Each item will be a button. The first string names the sprite to use,
                and the second provides text for a tooltip.
                rotation -> (float) An encoding of the orientation of the semicircle.
                The constant ABOVE = 1.0 creates a semicircle "pointed upward"; the
                constant RIGHT = 1.5 creates a semicircle "pointed to the right".
                MAY include:
                targetname -> (string) If present, writes the given text
                into a label attached near the semicircle. Otherwise that component
                is deleted."""
        r = kwargs['radius']
        for (i, nt) in enumerate(kwargs['items']):
            (name, tooltip) = nt
            (dx, dy) = _arc_position(r, i, len(kwargs['items']), kwargs['rotation'])
            code[kwargs['menu_tag'] + '_' + name] = {'align': (
                       (r + dx) / (2.0 * r), (r + dy) / (2.0 * r)), 
               'sprite': name, 
               'type': 'button', 'tooltip': tooltip}

        if 'targetname' in kwargs:
            code['target']['text'] = kwargs['targetname']
        else:
            del code['target']


def create(parent, items, rotation, owner, child_align=(0.5, 0.5), parent_align=(0.5, 0.5), tag='menu', radius=200, **kwargs):
    """Set up a circular menu by procedurally creating data that represents
        several buttons aligned in a semicircle, and anchor it on a given
        parent component. All buttons must be the same size!
        parent -> (ComponentBase) The component to which the layer will be anchored.
        items -> (list of pairs of string) As for preinit() above.
        rotation -> (float) As for preinit() above.
        owner -> (object) As for Factory.attach_child().
        child_align -> (pair of floats) As for Factory.attach_child().
        parent_align -> (pair of floats) As for Factory.attach_child().
        tag -> (string) As for preinit() above.
        radius -> (int) As for preinit() above.
        **kwargs:
        MAY include:
        targetname -> (string) As for preinit() above."""
    from Factory import attach_child
    from Bitcasters.GUI.Component import Component
    if items:
        sheet_data = Component.DATA['sprites'][items[0][0]]
        sheet_size = sheet_data['rect'][2:]
        sheet_tiles = sheet_data['tiles']
        (XSIZE, YSIZE) = tuple((sheet_size[i] / sheet_tiles[i] - 2 for i in range(2)))
    else:
        (XSIZE, YSIZE) = (0, 0)
    return attach_child(parent, 'circle_menu', 0.45, owner, child_align, parent_align, radius=radius, size=(
     radius * 2 + XSIZE, radius * 2 + YSIZE), menu_tag=tag, rotation=rotation, items=items, trap_background_clicks=False, **kwargs)