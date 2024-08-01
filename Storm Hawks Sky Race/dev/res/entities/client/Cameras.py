# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Cameras.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, Math

def _setCamera(cam):
    BigWorld.camera(cam)
    BigWorld.target.source = cam.invViewMatrix


def AimCursorCameraTo(at, direction):
    BigWorld.projection().rampFov(1, 0)
    cam = BigWorld.CursorCamera()
    thl, mhl, mv = cam.turningHalfLife, cam.movementHalfLife, cam.maxVelocity
    cam.turningHalfLife = 0
    cam.movementHalfLife = 0
    cam.maxVelocity = 1000
    from Bitcasters.Math import CameraMatrix, TranslationMatrix
    cam.source = CameraMatrix(at, at + direction)
    cam.target = TranslationMatrix(*(at + direction))
    _setCamera(cam)

    def restoreCameraOptions():
        cam.turningHalfLife = thl
        cam.movementHalfLife = mhl
        cam.maxVelocity = mv

    BigWorld.callback(0.01, restoreCameraOptions)


def AimCursorCameraAt(entity):
    BigWorld.projection().rampFov(1, 0)
    cam = BigWorld.CursorCamera()
    cam.source = BigWorld.dcursor().matrix
    cam.target = entity.matrix
    _setCamera(cam)


def AimFlexiCamAt(entity):
    BigWorld.projection().rampFov(0.8, 0)
    f = BigWorld.FlexiCam()
    f.timeMultiplier = 1000

    def fixSpring():
        f.timeMultiplier = 30

    BigWorld.callback(0.1, fixSpring)
    f.viewOffset = (0, 2.5, 0)
    f.preferredPos = (0, 3, -7.75)
    _setCamera(f)
    f.target = entity.matrix
    f.set(entity.matrix)


def AimInventoryCameraAt(entity):
    from BWMath import Vector3
    from Bitcasters.Math import CameraMatrix, TranslationMatrix
    from math import sin, cos
    from math import pi
    BigWorld.projection().rampFov(1, 0)
    cam = BigWorld.CursorCamera()
    yaw = BigWorld.player().model.yaw
    perpendicular = Vector3(cos(yaw), 0, -sin(yaw))
    lookAtThis = BigWorld.player().position + (0, -0.9, 0) + 1.18 * perpendicular
    lookFrom = Math.Matrix()
    lookFrom.setRotateYPR(Vector3(yaw + pi, pi * 1.975, 0))
    cam.source = lookFrom
    cam.target = TranslationMatrix(*lookAtThis)
    _setCamera(cam)