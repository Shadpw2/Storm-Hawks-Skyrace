# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Gauge.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component
import GUI

class Gauge(Component):
    """A gauge or "thermometer" implemented with a clipped (via GUI.ClipShader)
        "bar" sprite sandwiched between a base image and an "overlay" image.
        Actually, a single sprite with 3 mappings is used: the first mapping
        specifies the background, then the bar and overlay. This makes it easy to
        ensure that everything is properly aligned. The sprite stores an abstract
        "value" between 0 and 1 representing how full the bar is; the surrounding
        code is responsible for mapping this to a value that makes more sense
        in-game. (FIXME: Need a good way to specify endpoints on the bar clipper
        that represent "barely empty" and "barely full" gauges, so that an empty bar
        is not shown when the value is small but nonzero, etc.)"""

    def __init__(self, initial_value=0.0, slant=0.0, **kwargs):
        """Constructor.
                initial_value -> (float in [0.0, 1.0]) initial "value" as described in the
                class doc. Default 0.0.

                slant -> (float) used directly as the 'slant' attribute for the underlying
                GUI.ClipShader(). Default 0.0.

                **kwargs:
                MUST contain everything needed for the Component constructor."""
        Component.__init__(self, **kwargs)
        kwargs['parent'] = self
        kwargs['ID'] += '_bar'
        self.bar = Component(**kwargs)
        kwargs['parent'] = self
        kwargs['ID'] += '_overlay'
        self.overlay = Component(**kwargs)
        self.bar.setMapping(1)
        self.overlay.setMapping(2)
        shader = GUI.ClipShader()
        self.bar.bg.addShader(shader)
        shader.mode = 'RIGHT'
        shader.slant = slant
        self.shader = shader
        self.set(initial_value, 0)

    def set(self, value, delay, allowDecrease=True):
        from Util import clamp
        result = clamp(0 if allowDecrease else self.get(), value, 1)
        self.shader.value = result
        self.shader.speed = delay
        return result

    def get(self):
        return self.shader.currentValue