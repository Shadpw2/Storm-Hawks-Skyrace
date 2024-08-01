# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/Const.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
DOWN = 1
SHIFT = 2
CTRL = 4
ALT = 8
try:
    serverPort = file('server_id.txt').read().strip()
except:
    from BWPersonality import IS_RELEASE_VERSION
    if not IS_RELEASE_VERSION:
        print 'Const:: ERROR: Could not find text file with port number. Please run the appropriate batch file. Using default port for now.'
    serverPort = '20051'

CFG_MAP = {'abc': {'sponsor': 'abc', 
           #'server_ip': '202.125.47.138:20040'}}
            'server_ip': '127.0.0.1:8000'}}
CFG_KEYNAME = 'abc'

def addGeometry(spaceID, space_name):
    return BigWorld.addSpaceGeometryMapping(spaceID, None, 'spaces/' + space_name)


def addViewer(spaceID, pos, dir):
    return BigWorld.createEntity('SpaceViewer', spaceID, 0, pos, dir, {})


def addGeometryAndViewer(spaceID, space_name, viewer_position, viewer_direction):
    """Add the named geometry to the space and a viewer positioned within it.
        spaceID -> the pre-existing space.
        space_name -> name of space to load from spaces/ folder
        viewer_position, viewer_direction -> self-explanatory (in world coordinates)
        """
    return (
     addGeometry(spaceID, space_name),
     addViewer(spaceID, viewer_position, viewer_direction))


def makeSpaceAndViewer(space_name, viewer_position, viewer_direction):
    """Create a new space with a viewer positioned within it.
        space_name -> name of space to load from spaces/ folder
        viewer_position, viewer_direction -> self-explanatory (in world coordinates)
        """
    spaceID = BigWorld.createSpace()
    (geometry, viewer) = addGeometryAndViewer(spaceID, space_name, viewer_position, viewer_direction)
    return (
     spaceID, viewer, geometry)


def isOnline():
    return BigWorld.player().id < 1073741824


def weightedAverage(weights, values):
    return sum([ x * y for (x, y) in zip(weights, values) ]) / sum(weights)


def make_trivial_property(cls, name, doc):
    """A utility to make trivial properties for objects.
        This makes it easier to conform to a coding standard whereby every data
        member of a class which should be "public", is wrapped in a documented
        property.
        cls -> (Class) the class to which the property will belong.
        name -> (string) the property name that will appear to the outside world.
        The internal variable name will have an underscore prepended.
        doc -> (string) documentation for the property."""
    setattr(cls, name, property((lambda __x: getattr(__x, '_' + name)), (lambda __x, __v: setattr(__x, '_' + name, __v)), doc=doc))