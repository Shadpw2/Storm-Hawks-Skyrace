# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Draggable.py
# Compiled at: 2008-12-16 09:35:38
from Bitcasters.RepeatedTask import RepeatedTask
from Util import ignore, clamp

class Draggable(object):
    """An object that can assume the 'script' role of a BigWorld GUI component.
        It replaces the Bitcasters component in that role. We can make the "knob" of
        a slider or scrollbar by simply making an Image be Draggable. A callback is
        triggered every time the position changes, allowing the program to use the
        object's position information.
        The Draggable script holds a reference to the Bitcasters GUI component (i.e.
        the old script), and delegates non-drag mouse events to it, so that the
        behaviour of the component should be preserved for other mouse motions."""

    def __init__(self, component, positions, reparentable=False, pickup=ignore, putdown=ignore, callback=ignore):
        self.component = component
        self.reparentable = reparentable
        self.positions = positions
        self.callback = callback
        self.pickup = pickup
        self.putdown = putdown
        self._value = [
         None, None]
        self._drag_to_quantized((component.halign, component.valign))
        self.updater = RepeatedTask(self.doUpdates, 100)
        return

    def start_drag(self, pos):
        c = self.component
        self.start_mouse = c.mouse_position()
        self.prev_mouse = self.start_mouse
        self.start_align = (c.halign, c.valign)
        self.updater.resume()
        self.pickup()
        return True

    def stop_drag(self, position):
        self.updater.suspend()
        self.doUpdates()
        self.putdown()
        return True

    def _free(self, dir):
        return self.positions[dir] is None

    def doUpdates(self):
        try:
            c = self.component
            mouse = c.mouse_position()
            if mouse == self.prev_mouse:
                return
            self.prev_mouse = mouse
            wh = c.parent.window(c)[2:]

            def safediv(x, y):
                return 0 if y == 0 else float(x) / y

            self._drag_to_quantized((self.start_align[i] + safediv(mouse[i] - self.start_mouse[i], wh[i] - c.bg.size[i]) for i in range(2)))
            self.callback(self._value)
        except Exception, why:
            print 'Slider broke:', why
            __import__('traceback').print_stack()
            self.updater.suspend()

    def _drag_to_quantized(self, value):
        for (pos, v, i) in zip(self.positions, value, (0, 1)):
            v = clamp(0, v, 1)
            if pos == None:
                self._value[i] = v
                self.component.change_alignment(i, v)
            elif pos == 1:
                assert v == 0.5
                self._value[i] = 0
                self.component.change_alignment(i, 0.5)
            else:
                p = float(pos - 1)
                quantized = int(round(v * p))
                self._value[i] = quantized
                self.component.change_alignment(i, quantized / p)

        return

    def _quantize_value(self, value, i):
        pos, v = self.positions[i], value[i]
        if pos == None:
            return clamp(0, v, 1)
        if pos == 1:
            assert v == 0
            return 0.5
        return clamp(0, v / float(pos - 1), 1)

    def _get_value(self):
        return self._value

    def _set_value(self, value):
        self._drag_to_quantized((self._quantize_value(value, i) for i in range(2)))
        self.callback(self._value)

    value = property(_get_value, _set_value)

    def cleanup(self):
        pass