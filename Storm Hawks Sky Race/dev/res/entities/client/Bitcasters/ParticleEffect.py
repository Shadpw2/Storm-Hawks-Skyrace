# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/ParticleEffect.py
# Compiled at: 2008-12-16 09:35:38
import Pixie

class ParticleEffect(object):

    def __init__(self, name, node, offset, direction):
        system = Pixie.create('particles/%s.xml' % name)
        action = system.system(0).action(1)
        action.setPositionSource(['Point', offset])
        action.setVelocitySource(['Line', direction, direction])
        action.ignoreRotation = 1
        self.system = system
        self.node = node
        self.active = False

    def show(self):
        if not self.active:
            self.active = True
            self.node.attach(self.system)

    def hide(self):
        if self.active:
            self.active = False
            self.node.detach(self.system)

    def isVisible(self):
        return self.active

    visible = property(isVisible, (lambda self, v: [self.hide, self.show][v]()))