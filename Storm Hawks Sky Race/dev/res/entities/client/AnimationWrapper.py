# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/AnimationWrapper.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, Pixie
from Bitcasters.ParticleEffect import ParticleEffect

class AnimationWrapper:
    """Calls the animation and determines if particle effects are attached"""

    def __init__(self, cm, data):
        self.action = cm._body.action(data['name'])
        self.cm = cm
        self.name = data['name']
        self.emotion = data.get('emotion', 'Normal')
        self.particles = [ TimedParticleEffect(model=cm._body, ParticleName=particle['name'], AttachTo=particle['attachTo'], StartDelay=particle['startDelay'], TimeToLive=particle['timeToLive'], Offset=particle['offset'], Direction=particle['direction']) for particle in data.get('particles', ())
                         ]

    def __call__(self):
        self.action()
        for particle in self.particles:
            particle()

        self.cm.emote(self.emotion, self.action.duration)

    def stop(self):
        self.action.stop()
        for particle in self.particles:
            particle.stop()


class TimedParticleEffect:
    """Class for creating particle systems"""

    def __init__(self, model, ParticleName='', AttachTo='', StartDelay=0, TimeToLive=0, Offset=(0, 0, 0), Direction=(0, 0, 0)):
        self.effect = ParticleEffect(ParticleName, model.node(AttachTo), Offset, Direction)
        self.delay = StartDelay
        self.duration = TimeToLive
        self.callbacks = []

    def __call__(self):
        self.stop()
        self.callbacks = [
         BigWorld.callback(self.delay, self.effect.show),
         BigWorld.callback(self.delay + self.duration, self.effect.hide)]

    def stop(self):
        self.effect.hide()
        for callback in self.callbacks:
            BigWorld.cancelCallback(callback)

        self.callbacks = []