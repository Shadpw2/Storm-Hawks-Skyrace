# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/Math.py
# Compiled at: 2008-12-16 09:35:38
import BWMath
from math import pi
DEGREES = pi / 180
RADIANS = 1.0

def MatrixProduct(*args):
    if len(args) == 0:
        return IdentityMatrix()
    if len(args) == 1:
        return args[0]
    result = BWMath.MatrixProduct()
    result.a = args[0]
    result.b = args[1]
    return MatrixProduct(*((result,) + args[2:]))


class YPRXYZMatrixProvider:
    pass


class Matrix:

    def __init__(self, values=None):
        self.matrix = BWMath.Matrix()
        if not values:
            return
        for row in range(4):
            for col in range(4):
                self.matrix.setElement(col, row, values[row * 4 + col])

    def applyToPoint(self, point):
        try:
            return self.matrix.applyV4Point(point)
        except:
            return self.matrix.applyPoint(point)

    def applyToDirection(self, dir):
        return self.matrix.applyVector(dir)

    def invertible(self):
        return self.matrix.determinant != 0

    def invert(self):
        if not self.invertible():
            raise ValueError
        self.matrix.invert()

    def rotate(self, yaw=0, pitch=0, roll=0):
        r = BWMath.Matrix()
        r.setRotateYPR((yaw, pitch, roll))
        self.matrix.postMultiply(r)

    def translate(self, x=0, y=0, z=0):
        self.matrix.translation = self.matrix.translation + BWMath.Vector3(x, y, z)

    def scale(self, x, y, z):
        s = BWMath.Matrix()
        s.setScale((x, y, z))
        self.matrix.postMultiply(s)

    def rotatedBy(self, yaw=0, pitch=0, roll=0):
        out = Matrix()
        out.matrix.set(self.matrix)
        out.rotate(yaw, pitch, roll)
        return out

    def translatedBy(self, x=0, y=0, z=0):
        out = Matrix()
        out.matrix.set(self.matrix)
        out.translate(x, y, z)
        return out

    def scaledBy(self, x=0, y=0, z=0):
        out = Matrix()
        out.matrix.set(self.matrix)
        out.scale(x, y, z)
        return out

    def inverted(self):
        out = Matrix()
        out.matrix.set(self.matrix)
        out.invert()
        return out


def TranslationMatrix(x=0, y=0, z=0):
    return Matrix().translatedBy(x, y, z).matrix


def RotationMatrix(yaw=0, pitch=0, roll=0):
    return Matrix().rotatedBy(yaw, pitch, roll).matrix


def ScaleMatrix(x=0, y=0, z=0):
    return Matrix.scaledBy(x, y, z).matrix


def CameraMatrix(camera_pos, target_pos, up_dir=(0, 1, 0)):
    result = BWMath.Matrix()
    result.lookAt(camera_pos, TranslationMatrix(*target_pos).applyToOrigin() - camera_pos, up_dir)
    return result


def OrthogonalProjectionMatrix(width, height, near, far):
    result = BWMath.Matrix()
    result.orthogonalProjection(width, height, near, far)
    return result


def PerspectiveProjectionMatrix(fov, aspect, near, far):
    result = BWMath.Matrix()
    result.perspectiveProjection(fov, aspect, near, far)
    return result


def IdentityMatrix():
    result = BWMath.Matrix()
    result.setIdentity()
    return result


def ZeroMatrix():
    result = BWMath.Matrix()
    result.setZero()
    return result


def IVector():
    return BWMath.Vector3(1, 0, 0)


def JVector():
    return BWMath.Vector3(0, 1, 0)


def KVector():
    return BWMath.Vector3(0, 0, 1)


def ZeroVector():
    return BWMath.Vector3(0, 0, 0)