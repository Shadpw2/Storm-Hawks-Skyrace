# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Physics.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

def attach(anEntity, name):
    from keys import DUMMY_PHYSICS, RIPPER_PHYSICS
    rawname = name
    name += 'Physics'
    ph = getattr(__import__(name, fromlist=[name]), name)
    if anEntity == BigWorld.player():
        anEntity.filter = ph.FILTER()
    else:
        anEntity.filter = BigWorld.AvatarFilter()
    if hasattr(anEntity, 'physics'):
        if ph.TYPE != (anEntity.ph.TYPE if hasattr(anEntity, 'ph') else DUMMY_PHYSICS):
            anEntity.physics = ph.TYPE
        if anEntity.physics == None:
            anEntity.physics = ph.TYPE
        physics = ph(anEntity)
        if ph.TYPE == RIPPER_PHYSICS:
            physics.turn = 0
            physics.thrust = 0
            physics.brake = 0
            physics.collide = 1
            physics.fall = 1
            physics.scrambleHeight = 0
            physics.takeoffAndLanding = 0
        anEntity.ph = physics
    elif hasattr(anEntity, 'ph'):
        del anEntity.ph
    anEntity.ph_name = rawname
    return