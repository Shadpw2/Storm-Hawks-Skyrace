# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/handlers.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI
from keys import *
from Bitcasters.Const import DOWN, SHIFT, isOnline
import BWPersonality

class changeClothes:
    """Change the player's outfit to the one in the corresponding inventory slot"""

    def __init__(self, value):
        self.value = value

    def __call__(self):
        BigWorld.player().change(self.value)


def transformBike():
    """Change your skyride between ground and air forms"""
    BigWorld.player().transform()


class crystalhandler:
    """Use a collected crystal"""

    def __init__(self, mode, slot):
        self.slot = slot
        self.mode = mode

    def __call__(self, mods):
        if mods & DOWN and self.mode.layers['race'].useCrystal(self.slot):
            p = BigWorld.player()
            p.boost()
            p.user.avatar.cell.useCrystal(self.slot)


class movekeyhandler:
    """Move around"""

    def __init__(self, x, z, p):
        self.x = x
        self.z = z
        self.p = p

    def __call__(self, mods):
        x = self.x
        z = self.z
        p = self.p
        if x is None:
            x = p.dx
        elif not mods & DOWN:
            x = 0
        if z is None:
            z = p.dz
        elif not mods & DOWN:
            z = 0
        p.dx = x
        p.dz = z
        return


def usehandler():
    """Use the targeted object"""
    try:
        BigWorld.target().usedBy(BigWorld.player())
    except:
        pass


OldCamera = None

def toggleFreeCamera():
    """*Toggle the FreeCamera and (for filming purposes) GUI"""
    global OldCamera
    if BWPersonality.IS_RELEASE_VERSION:
        return
    if OldCamera:
        print 'Free Camera off at ', BigWorld.camera().position, ' facing ', BigWorld.camera().direction
        BigWorld.camera(OldCamera)
        OldCamera = None
    else:
        OldCamera = BigWorld.camera()
        fc = BigWorld.FreeCamera()
        fc.set(BigWorld.camera().matrix)
        BigWorld.camera(fc)
    return


def exitbikehandler():
    """*Get off your bike"""
    if BWPersonality.IS_RELEASE_VERSION:
        return
    user = BigWorld.player().user
    user.alight()


def toggleTurboMode():
    """*Toggle Turbo Mode"""
    if BWPersonality.IS_RELEASE_VERSION:
        return
    BigWorld.player().toggleTurboMode()


def toggleRideInstabike():
    """*Instantly mount/dismount an insta-bike."""
    if BWPersonality.IS_RELEASE_VERSION:
        return
    p = BigWorld.player()
    user = p.user
    if user.instabike:
        user.setVehicle(0, 'Biped')
        user.instabike = 0
    else:
        user.setVehicle(1, 'Bike')
        user.instabike = 1
        p.unlock()


def moveToHome(thing):
    location = BWPersonality.storage().startPosition
    thing.physics.teleport(location, (0, 0, 0))


def teleportToSafeStartingPos():
    """*Teleport to a safe spot in town"""
    if BWPersonality.IS_RELEASE_VERSION:
        return
    if isOnline():
        BigWorld.player().base.recall()
    else:
        moveToHome(BigWorld.player())