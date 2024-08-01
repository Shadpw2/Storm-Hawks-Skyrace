# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/PlayerStatus.py
# Compiled at: 2008-12-16 09:35:38
data = {'health': {'align': (0.114, 0.067), 
              'orientation': 0, 
              'sprite': 'health', 
              'type': 'gauge'}, 
   'map': {'align': (1.0, 0.088), 
           'orientation': 0, 
           'sprite': 'map', 
           'type': 'image'}, 
   'player_dot': {'align': (0.5, 0.5), 
                  'parent': 'map', 
                  'sprite': 'dot', 
                  'type': 'image', 
                  'z': 1}, 
   'world_topleft': {'align': (0.0, 0.0), 
                     'orientation': 3, 
                     'sprite': 'world_topleft', 
                     'type': 'image'}}

class MinimapTranslation:

    def __init__(self, points):
        """Represents a rotation, scale and translation which map
                 (x0, y0) to (x1, y1) and (x2, y2) to (x3, y3)."""
        (xy0, xy1, xy2, xy3) = points
        (x0, y0) = xy0
        (x1, y1) = xy1
        (x2, y2) = xy2
        (x3, y3) = xy3
        from Bitcasters.Math import Matrix
        mat = Matrix([x0, -y0, 1, 0,
         y0, x0, 0, 1,
         x2, -y2, 1, 0,
         y2, x2, 0, 1])
        mat.invert()
        self.ABCD = mat.applyToPoint((x1, y1, x3, y3))

    def __call__(self, x, y):
        """Applies the transformation to (x, y)."""
        (A, B, C, D) = self.ABCD
        return (A * x - B * y + C, A * y + B * x + D)


import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.terra = kwargs['terra']
        self.dx = 0
        self.dy = 0
        self.dz = 0
        self.stop = False

        def pixelToClip(x, y):
            d = 173.0
            r = d / 2
            return (x / r - 1, 1 - y / r)

        reference = (
         (
          (-260.0, 419.0), pixelToClip(33, 49),
          (209.0, 468.0), pixelToClip(130, 38),
          (57.0, 72.0), pixelToClip(99, 124)),
         (
          (-417.15, 198.83), pixelToClip(36, 71),
          (662.51, 698.67), pixelToClip(123, 32),
          (669.43, -633.7), pixelToClip(123, 138)),
         (
          (-200.74, 383.71), pixelToClip(65, 50),
          (-131.76, 382.46), pixelToClip(117, 52),
          (-170.4, 303.24), pixelToClip(88, 110)))[self.terra]
        self.mappers = (
         MinimapTranslation(reference[:4]),
         MinimapTranslation(reference[2:]),
         MinimapTranslation(reference[4:] + reference[:2]))

    def postinit(self):
        from Bitcasters.RepeatedTask import RepeatedTask
        self.thread = RepeatedTask(self.update)
        self.thread.start()
        self.components['map'].setMapping(self.terra)
        tl = self.components['world_topleft']
        tl.write('text', BigWorld.player().name)
        tl.z = 0
        self.entityIDs = []

    def cleanup(self):
        Factory.Layer.cleanup(self)
        self.thread.stop()

    def create_dot(self, entityID):
        from Bitcasters.GUI.Component import Image
        key = 'dot%d' % entityID
        self.entityIDs.append(entityID)
        result = Image(ID=key, sprite='dot2', event_handlers=self.handlers, parent=self.components['map'], type='image', z=0)
        result.fit()
        self.components[key] = result

    def remove_dot(self, entityID):
        self.entityIDs.remove(entityID)
        self.components['dot%d' % entityID].destroy()

    def update(self):
        player = BigWorld.player()
        user = player.user
        queued = user.avatar.queued
        if queued and queued.name == 'idleaction001':
            if self.dx != 0 or self.dy != 0 or self.dz != 0 or self.stop:
                user.abortGesture()
        if self.stop:
            self.dx = 0
            self.dy = 0
            self.dz = 0
        player.ph.setDirection(self.dx, self.dz)
        player_speed = user.update()
        self.dy = 0
        self.stop = False
        self._update_minimap(self.components['player_dot'], player.position[0], player.position[2], player.yaw)
        for entityID in self.entityIDs:
            player.updateAOIStatus(entityID, self.updateEntity(entityID))

    def updateEntity(self, entityID, positionInfo=None):
        result = False
        entity = BigWorld.entity(entityID)
        if entity != None:
            assert entity.inWorld
            positionInfo = (entity.position, entity.yaw)
            result = True
        if positionInfo != None:
            (xyz, yaw) = positionInfo
            self._update_minimap(self.components['dot%d' % entityID], xyz[0], xyz[2], yaw)
        return result

    def _update_minimap(self, dot, x, z, yaw):
        (map_x, map_y) = map((lambda abc: sum(abc) / 3), zip(*[ mapper(x, z) for mapper in self.mappers ]))
        length = map_x * map_x + map_y * map_y
        if length > 1:
            from math import sqrt
            map_x /= sqrt(length)
            map_y /= sqrt(length)
        dot.halign = (map_x + 1) / 2
        dot.valign = (-map_y + 1) / 2
        dot.fit()