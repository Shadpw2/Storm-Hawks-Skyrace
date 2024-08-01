# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Viewport.py
# Compiled at: 2008-12-16 09:35:38
from Component import Component, ComponentBase, partial_sums, distribute, set_default_minsize
from Math import Vector4Animation as ColourSequence
from Util import ignore
import BigWorld, GUI

def safemod(x, y):
    if y == 0:
        assert x == 0
        return 0
    return float(x) % y


def safediv(x, y):
    if y == 0:
        assert x == 0
        return 0
    return float(x) / y


def lerp(arange, numerator, denominator):
    """Linear interpolation. Find the value at aposition within a range."""
    (begin, end) = arange
    if denominator == 0:
        assert begin == end
    unclipped = (end - begin) * safediv(numerator, denominator) + begin
    low, high = min(begin, end), max(begin, end)
    return min(max(low, unclipped), high)


def ilerp(arange, avalue):
    """Inverse linear interpolation. Find out how far avalue is from the beginning to end of the range."""
    (begin, end) = arange
    assert avalue >= min(begin, end) and avalue <= max(begin, end)
    return safediv(avalue - begin, end - begin)


from Bitcasters.Math import MatrixProduct, TranslationMatrix, IdentityMatrix

class Viewport(ComponentBase):
    """The component type used for the root of each Layer;
        also usable within a Layer to make scrolling windows (such as on the
        character creation screen). It is built upon a BigWorld GUI.Window instead
        of a GUI.Simple, and also has a MatrixShader, ColourShader and AlphaShader
        built in with an interface for controlling those.
        
        The MatrixShader controls positioning of the layer and can be used to animate
        it around the screen. This can be used to perform arbitrary matrix
        transformations, but is most commonly used just for translation. It is also
        used to "anchor" the layer to a parent component in another layer
        (or possibly to the layer itself, since that is also a component).
        The final matrix applied to the layer is a product of:
        - Any transformation applied to the parent (handled automatically; the
        anchorOn() method can be used to set up an anchor).
        - A "local matrix" set by anchoring the component to a given screen position
        (via anchorAtCursor(), which is used to control tooltips) or in-game entity
        (via anchorTo(), which accepts a MatrixProvider in world space and adapts it
        using GUI.WorldToClipMP).
        - A "translation" used to store a temporary translation used for animating
        a smooth scrolling effect (accessed with translate() or setTranslation()).

        The ColourShader and AlphaShader are bound together with a common interface,
        so that you can just provide an RGBA colour value. The methods to(), loop()
        and sequence() interact with these shaders.
        """

    def __init__(self, vsize=(0, 0), start_colour=(255, 255, 255, 255), row_spacing=(1, ), column_spacing=(1, ), **kwargs):
        """Constructor.
                vsize -> (pair of ints) the 'virtual' size in pixels of the region that may
                be scrolled over. Default (0, 0).

                start_colour -> (quad of ints) the initial colour (in RGBA, 0..255 for
                each value) to apply to the Viewport's colour shader. 
                Default (255, 255, 255, 255) (no shading).

                row_spacing -> (tuple) weights given to each row of cells when expanding.
                The length of this tuple indicates the number of rows in the grid layout.
                See "The Component Fitting Process" in the main GUI doc. Default (1,).

                column_spacing -> (tuple) weights given to each column when expanding.
                The length of this tuple indicates the number of columns in the grid layout.
                See "The Component Fitting Process" in the main GUI doc. Default (1,).

                **kwargs:
                MUST contain everything needed for the Component constructor.
                
                MAY also contain:
                scroll -> (pair of ints) if given, the initial scroll position, in pixels.
                Otherwise the viewport is not scrolled during initialization."""
        self._offset = (0, 0)
        self.horizontal_expand = column_spacing
        self.vertical_expand = row_spacing
        self.handlers = kwargs.get('event_handlers', ())
        assert sum(self.horizontal_expand) > 0, 'layout refuses to expand horizontally'
        assert sum(self.vertical_expand) > 0, 'layout refuses to expand vertically'
        self._set_vsize(tuple((float(x) for x in vsize)))
        self.alpha = GUI.AlphaShader()
        self.colour = GUI.ColourShader()
        self.transform = GUI.MatrixShader()
        self.colour.start = start_colour
        self.transform.target = MatrixProduct(IdentityMatrix(), IdentityMatrix(), IdentityMatrix())
        self.anchorComponent = None
        self._enabled = True
        ComponentBase.__init__(self, GUI.Window(), **kwargs)
        self.z = kwargs.get('z', 0.9999)
        self.bg.addShader(self.colour)
        self.bg.addShader(self.transform)
        if 'scroll' in kwargs:
            self.initial_scroll = kwargs['scroll']
        return

    def _set_anchor(self, aComponent):
        try:
            self.bg.delShader(self.anchorComponent.parentViewport().transform)
        except:
            pass

        self.bg.delShader(self.transform)
        self.anchorComponent = aComponent
        try:
            self.bg.addShader(self.anchorComponent.parentViewport().transform)
        except:
            pass

        self.bg.addShader(self.transform)

    def __get_parent_translation(self):
        return self.transform.target.a.a

    def __set_parent_translation(self, value):
        self.transform.target.a.a = value

    _parent_translation = property(__get_parent_translation, __set_parent_translation)

    def __get_local_matrix(self):
        return self.transform.target.a.b

    def __set_local_matrix(self, value):
        self.transform.target.a.b = value

    _local_matrix = property(__get_local_matrix, __set_local_matrix)

    def __get_translation(self):
        return self.transform.target.b

    def __set_translation(self, value):
        self.transform.target.b = value

    _translation = property(__get_translation, __set_translation)

    def setTranslation(self, x, y, eta=0.0):
        """Set the translation of the Viewport relative to its anchor.
                x -> (int) amount to translate horizontally, in pixels
                y -> (int) amount to translate vertically, in pixels
                eta -> (float) amount of transition time
                (the translation matrix will be interpolated linearly)."""
        self.transform.eta = eta
        self._offset = (x, y)
        (dx, dy) = self.ScreenToGUISize(self._offset)
        self._translation.setTranslate((dx, -dy, 0))

    def translate(self, dx, dy, eta=0.0):
        """Modify the translation of the Viewport relative to its anchor.
                dx -> (int) change to amount of horizontal translation, in pixels
                dy -> (int) change to amount of vertical translation, in pixels
                eta -> (int) amount of transition time
                (the translation matrix will be interpolated linearly)."""
        (x, y) = self._offset
        self.setTranslation(x + dx, y + dy, eta)

    def anchorTo(self, aMP):
        """Specify the Viewport's anchor as NOT a GUI component.
                aMP -> (MatrixProvider) MP to which the Viewport will be anchored."""
        self.setParent(None)
        target = GUI.WorldToClipMP()
        target.target = aMP
        self._local_matrix = target
        return

    def anchorAtCursor(self):
        """'Anchor' the Viewport relative to the current mouse location.
                The layer will be positioned to the right of the cursor if the cursor is
                in the left half of the screen, and vice-versa; similarly in the vertical
                direction. The intent is to keep the layer entirely on screen whenever
                possible. This is used for positioning tooltips.
                Note that this function actually clears any anchor and sets the translation.
                """
        (w, h) = self.size
        self.setParent(None)
        self._local_matrix = IdentityMatrix()
        (x, y) = GUI.mcursor().position
        dx, dy = -w / 2 if x > 0.0 else w / 2, h / 2 if y > 0.0 else -h / 2
        (x, y) = self.GUIToScreenSize((x, -y))
        self.setTranslation(x + dx, y + dy)
        return

    def anchorOn(self, my_align, aComponent, its_align, eta=0.0):
        """Specify the Viewport's anchor as a GUI component, and also
                translate the component such that a specified point on aComponent
                coincides with a specified point on self.
                my_align -> (pair of floats) specified point on self, as a coordinate.
                (0.0, 0.0) corresponds to top-left of self; (1.0, 1.0) to bottom-right.
                aComponent -> (ComponentBase) the component to attach to.
                its_align -> (pair of floats) specified point on aComponent, as a
                coordinate. Interpreted the same way as my_align.
                eta -> (float) amount of transition time, in seconds."""
        (x, y) = aComponent.position
        (w, h) = aComponent.size
        (x, y) = aComponent.ScreenToGUICoordinates((x + w / 2, y + h / 2))

        def correctFor(x, y, align, size, sense):
            (xalign, yalign) = align
            xalign -= 0.5
            yalign -= 0.5
            (xscale, yscale) = aComponent.ScreenToGUISize(size)
            return (x + xalign * xscale * sense, y + yalign * -yscale * sense)

        (x, y) = correctFor(x, y, its_align, aComponent.size, 1)
        (x, y) = correctFor(x, y, my_align, self.size, -1)
        self._set_anchor(aComponent)
        self._parent_translation = TranslationMatrix(x, y)
        self.transform.eta = eta

    def _getEnabled(self):
        return self._enabled

    def _setEnabled(self, value):
        self._enabled = bool(value)

    enabled = property(_getEnabled, _setEnabled, doc='Enable or disable the component.\n\t\tWhen False, this component, and all components in the component tree under\n\t\tit, ignore keyboard and mouse events.  (Intended to be used on Layers when\n\t\tthey are dimmed out, e.g. when a dialog box is presented.))')

    def parentViewportHelper(self):
        return self

    def to(self, value, time):
        """Change the colour/alpha value to 'value' in 'time' seconds.
                value -> (quad of ints) the new combined colour/alpha value for shading;
                should be an RGBA value (4 ints each in [0..255]).
                time -> (float) number of seconds over which to transition."""
        self.sequence((value, time))

    def sequence(self, *keyframes):
        """Change the colour/alpha value according to each 'keyframe' value in turn.
                Stop when the final value is reached.
                *keyframes -> (tuple of (value, time) pairs as per Viewport.to() arguments)
                """
        self._impl(keyframes, self.revertColour, True)

    def loop(self, *keyframes):
        """Change the colour/alpha value according to each 'keyframe' value in turn.
                Restart at the beginning of the sequence when the final value is reached.
                *keyframes -> (tuple of (value, time) pairs as per Viewport.to() arguments)
                """
        self._impl(keyframes, ignore, False)

    def revertColour(self):
        """Stop all colour animations.
                Fixes the shading colour and alpha value at their current values."""
        c = self.colour
        if c.colourProvider is None:
            return
        col = c.colourProvider.value
        c.colourProvider = None
        c.start = col
        self.bg.addShader(self.alpha)
        self.alpha.value = col[3] / 255.0
        self.alpha.speed = 0
        self.alpha.reset()
        return

    def _impl(self, keyframes, callback, noloop):
        self.bg.delShader(self.alpha)
        (colours, durations) = zip(*keyframes)
        if noloop:
            colours = (
             self.colour.start,) + colours + (colours[-1],)
            durations = durations + (1, )
        else:
            colours = colours + (colours[0],)
        times = partial_sums(durations)
        seq = ColourSequence()
        seq.duration = times[-1]
        seq.keyframes = zip(times, colours)
        BigWorld.callback(seq.duration - noloop * 0.5, callback)
        self.colour.colourProvider = seq

    def fit(self):
        try:
            oldscroll = self.scroll
        except:
            pass

        ComponentBase.fit(self)
        (w, h) = BigWorld.screenSize()
        (x, y, z) = self.bg.position
        self.bg.position = (x - self.size[0] % 2 / w, y + self.size[1] % 2 / h, z)
        self._fixScrollRange()
        try:
            self.scroll = oldscroll
        except:
            pass

    def _fixScrollRange(self):
        b = self.bg
        (w, h) = BigWorld.screenSize()
        w = (self.vsize[0] - self.size[0]) / w
        h = (self.vsize[1] - self.size[1]) / h
        b.minScroll = (-w, -h)
        b.maxScroll = (w, h)
        if hasattr(self, 'initial_scroll'):
            self.scroll = self.initial_scroll

    def bgscrollrange(self, dim):
        b = self.bg
        result = [b.maxScroll[dim], b.minScroll[dim]]
        if dim:
            result.reverse()
        return result

    def vscrollrange(self, dim):
        return self.vsize[dim] - self.size[dim]

    def _get_scroll(self):
        x = tuple((self.vscrollrange(dim) * ilerp(self.bgscrollrange(dim), self.bg.scroll[dim]) for dim in range(2)))
        return x

    def _set_scroll(self, value):
        x = tuple((lerp(self.bgscrollrange(dim), value[dim], self.vscrollrange(dim)) for dim in range(2)))
        self.bg.scroll = x

    scroll = property(_get_scroll, _set_scroll, doc="The amount by which the viewable area is scrolled, in pixels\n\t\t(a pair of ints giving horizontal and vertical scroll amounts).\n\t\tAlternatively, the position in the window's space of whatever is displayed\n\t\tat the top-left of the viewable part of the window.")

    def scrollBy(self, dx, dy):
        """Scroll the viewable area by (dx, dy) in pixels.
                dx -> (int) amount to scroll horizontally.
                dy -> (int) amount to scroll vertically."""
        self.scroll = (
         self.scroll[0] + dx, self.scroll[1] + dy)

    def GUIvsize(self):
        (w, h) = self.vsize
        (screenW, screenH) = BigWorld.screenSize()
        return (w / screenW, h / screenH)

    def _get_vsize(self):
        try:
            size = self.size
        except:
            size = (0, 0)

        child_size = (
         sum(self._minColumnWidths()), sum(self._minRowHeights()))
        return (max(child_size[0], self._vsize[0], size[0]),
         max(child_size[1], self._vsize[1], size[1]))

    def _set_vsize(self, vsize):
        self._vsize = vsize

    vsize = property(_get_vsize, _set_vsize, doc='The size in pixels of the "virtual space" of the Viewport\n\t\tin which children can be placed. Basically, if the vsize of a Viewport is\n\t\t(a, b) and the size (which is the space taken up on screen) is (c, d), then\n\t\tthe components may be scrolled by up to (a - c, b - d) pixels.\n\t\tThe virtual size is always constrained to be at least as large in each\n\t\tdimension as the screen size (for obvious reasons), and at least as large\n\t\tas is needed to hold the entire grid of child components without overlap.')

    def window(self, child):
        column_positions = partial_sums(self._minColumnWidths())
        column_distribution = distribute(self.horizontal_expand, self.vsize[0] - column_positions.pop())
        column_positions = map(sum, zip(column_positions, column_distribution)) + [
         self.vsize[0]]
        row_positions = partial_sums(self._minRowHeights())
        row_distribution = distribute(self.vertical_expand, self.vsize[1] - row_positions.pop())
        row_positions = map(sum, zip(row_positions, row_distribution)) + [
         self.vsize[1]]
        (column, row) = child.cell
        top = row_positions[row]
        height = row_positions[row + 1] - top
        left = column_positions[column]
        width = column_positions[column + 1] - left
        return (
         left, top, width, height)

    def _row_count(self):
        return len(self.vertical_expand)

    def _column_count(self):
        return len(self.horizontal_expand)

    def _minColumnWidths(self):
        return [ max((0, ) + tuple((child.minsize[0] for child in self.allChildren() if child.cell[0] == i)))
         for i in range(self._column_count())
               ]

    def _minRowHeights(self):
        return [ max((0, ) + tuple((child.minsize[1] for child in self.allChildren() if child.cell[1] == i)))
         for i in range(self._row_count())
               ]

    def children_in_cell(self, column, row):
        cell = (
         column, row)
        return [ child for child in self.allChildren() if child.cell == cell
               ]

    def useColourShader(self, setting):
        if setting:
            self.bg.addShader(self.colour)
        else:
            self.bg.delShader(self.colour)
        p = self.parent
        if p:
            p.useColourShader(setting)

    def _setz(self, value):
        from Util import clamp
        value = clamp(0, value, 1)
        bgz = self.parent.bg.position[2] if self.parent else 1
        self._z = value
        self.bg.position[2] = value * bgz
        GUI.reSort()

    def _getz(self):
        return self._z

    z = property(_getz, _setz, doc="float in [0..1]. Controls drawing order of components.\n\t\tSets the actual z component of the underlying GUI widget's position in\n\t\tclip space, scaled to be between the parent component (if any) and the\n\t\tforeground.")

    def connectBackgroundToParent(self, parent):
        GUI.addRoot(self.bg)
        self._set_anchor(parent)

    def removeBackgroundFromParent(self, parent):
        GUI.delRoot(self.bg)
        self._set_anchor(None)
        return

    def as_dict(self):
        """Creates a dict representing the current state and type of the component.
                Used by the Editor for serialization. FIXME: Move to base class."""
        assert self.parent != None, "can't make a dict for the layer root"
        result = self.basic_dict_keys()
        result.update({'type': 'viewport'})
        if hasattr(self, 'initial_scroll'):
            result.update({'scroll': self.initial_scroll})
        try:
            result.update(self.bg.script.policies['Tooltip'].as_dict())
        except:
            pass

        return result