# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/inventory.py
# Compiled at: 2008-12-16 09:35:38
data = {'exit': {'align': (0.032, 0.047), 
            'orientation': 0, 
            'parent': 'inventory_bg', 
            'sprite': 'exit', 
            'type': 'button'}, 
   'frame': {'align': (0.139, 0.535), 
             'column_spacing': (1, 1, 1), 
             'minsize': (275, 355), 
             'orientation': 0, 
             'parent': 'inventory_bg', 
             'row_spacing': (1, 1, 1, 1), 
             'sprite': '', 
             'type': 'viewport', 
             'vsize': (275, 355)}, 
   'inventory_bg': {'align': (0.5, 0.5), 
                    'expand': (1, 1), 
                    'orientation': 0, 
                    'sprite': 'inventory_bg', 
                    'type': 'image'}, 
   'lframe': {'align': (0.565, 0.479), 
              'minsize': (108, 360), 
              'orientation': 0, 
              'parent': 'inventory_bg', 
              'row_spacing': (1, 1, 1, 1), 
              'sprite': '', 
              'type': 'viewport', 
              'vsize': (108, 360)}, 
   'rframe': {'align': (0.974, 0.479), 
              'minsize': (108, 360), 
              'orientation': 0, 
              'parent': 'inventory_bg', 
              'row_spacing': (1, 1, 1, 1), 
              'sprite': '', 
              'type': 'viewport', 
              'vsize': (108, 360)}, 
   'total_gold': {'align': (0.134, 0.904), 
                  'orientation': 0, 
                  'parent': 'inventory_bg', 
                  'sprite': 'amount', 
                  'type': 'image'}}
DISTANCE = 415
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self._pulled_out = kwargs.get('full', False)
        for id in range(12):
            code['icon_%d' % id] = {'type': 'inventorybutton', 
               'cell': (
                      id % 3, id / 3), 
               'parent': 'frame', 
               'sprite': 'object', 
               'hfill': (1, 0, 1), 
               'vfill': (1, 0, 1)}

        from InventoryItem import WEAR_SLOTS
        for id in range(8):
            code[WEAR_SLOTS[id] if WEAR_SLOTS[id] else 'unused_%d' % id] = {'type': 'inventorybutton', 
               'cell': (
                      0, id % 4), 
               'parent': 'lframe' if id < 4 else 'rframe', 
               'placeholder': (12, 8, 0, 4, 24, 28, 26, 31)[id], 
               'sprite': 'object', 
               'hfill': (1, 0, 1), 
               'vfill': (1, 0, 1)}

    def postinit(self):
        for frame in ('frame', 'lframe', 'rframe'):
            self.components[frame].useColourShader(False)

        if not self._pulled_out:
            self.translate(DISTANCE, 0)
        p = BigWorld.player()
        from CharCreation import NAMES

        def nameOf(attr):
            return NAMES[attr][getattr(p, attr)]

        self.components['inventory_bg'].write('name_title', ('\n').join((
         p.name,
         'Level 1 ' + nameOf('class'),
         nameOf('species') + ' ' + nameOf('gender'))))

    def update(self, gold, inventory, giving=()):
        """Update the listed inventory.
                inventory -> (dict of int to InventoryItem) what the player has.
                gold -> (int) the player's gold.
                giving -> (list of int) slot IDs of what the player is currently.
                offering to trade, if anything. Default () (nothing traded)."""
        self.components['total_gold'].write('text', str(gold))
        for component in self.components.values():
            try:
                component.reset()
            except:
                pass

        for (k, v) in inventory.items():
            if k in giving:
                continue
            from InventoryItem import slotIDToKey
            key = slotIDToKey(k)
            if isinstance(key, tuple) and key[0] == 0:
                key = 'icon_%d' % key[1]
            if key in self.components:
                self.components[key].setItem(v)

    def pull_out(self, eta=1.0):
        """Slide the frame out to expose the "dress-up" portion.
                eta -> (float) time in seconds over which to animate."""
        if self._pulled_out:
            return
        self._pulled_out = True
        self.translate(-DISTANCE, 0, eta)

    def push_in(self, eta=1.0):
        """Slide the frame in to conceal the "dress-up" portion.
                eta -> (float) time in seconds over which to animate."""
        if not self._pulled_out:
            return
        self._pulled_out = False
        self.translate(DISTANCE, 0, eta)

    def fade(self, eta=1.0):
        """Fade out (used when other player aborts trading).
                eta -> (float) time in seconds over which to animate."""
        for frame in ('frame', 'lframe', 'rframe'):
            self.components[frame].useColourShader(True)

        self.to((255, 255, 255, 0), 1)