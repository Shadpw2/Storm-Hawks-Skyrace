# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Component.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI

def texname(simplename):
    if not simplename:
        return ''
    return 'gui/' + simplename + '.dds'


def partial_sums(sequence):
    return [ sum(sequence[:i]) for i in range(len(sequence) + 1) ]


def distribute(weights, to_distribute):
    ps = partial_sums(weights)
    count = len(weights)
    return [ ps[i] * to_distribute / ps[count] for i in range(count) ]


def ScreenToGUISize(xy):
    (x, y) = xy
    (screenW, screenH) = BigWorld.screenSize()
    return (2 * x / screenW, 2 * y / screenH)


def GUIToScreenSize(xy):
    (x, y) = xy
    (screenW, screenH) = BigWorld.screenSize()
    return (x * screenW / 2, y * screenH / 2)


class ComponentBase(object):
    """The root class for all components in the Bitcasters GUI system.
        Each instance wraps some underlying BigWorld GUI component. Since many
        possibly constructor arguments exist for each leaf class, a keyword-argument
        system is used: each subclass forwards **kwargs to superclass constructors.     
        """

    def __init__(self, bg, ID, minsize=(0, 0), align=(0.5, 0.5), expand=(0.0, 0.0), cell=(0, 0), parent=None, region=None, is_radio_group=False, z=1, next=None, **kwargs):
        """Constructor.
                bg -> (BigWorld GUI.Component) component implementing the behaviour
                (normally, derived class constructors instantiate this).

                ID -> (string) gives the component a name.

                minsize -> (pair of ints) the minimum size of the component, in pixels.
                Default (0, 0).

                align -> (pair of floats) the alignment of the component. Default (0.5, 0.5)
                (meaning "centered within parent").

                expand -> (pair of floats) the expand fitting parameter of the component.
                Default (0.0, 0.0) (meaning "never increase size according to parent").

                cell -> (pair of ints) gives the cell of the parent (or region) in which
                the component will be fitted. Default (0, 0).

                parent -> (ComponentBase or None) parent component for this widget, if any.
                Default None.

                region -> (string or None) if present, names the cutout of the parent in
                which this component will be fitted. If None, the component is fitted
                within the entire bounds of the parent. Default None.

                is_radio_group -> (boolean) if the component is a radio group, any Checkbox
                components which are children of the component will behave as radio buttons
                instead (selecting one will deselect all others). Default False.

                z -> (float) controls drawing order of components.

                next -> (string or None) the ID of the component, if any, which is "next" in
                "tab order" - i.e. the one that will be highlighted if this component is
                highlighted and then the tab key is pressed. Default None.

                **kwargs: all ignored (may be passed up from a subclass constructor).
                """
        self.DESTROYED = False
        self._visible = True
        self._tex_name_backup = ''
        self._align = list(align)
        self._expand = list(expand)
        self._minsize = tuple(minsize)
        self.bg = bg
        self.cell = cell
        bg.widthRelative = False
        bg.heightRelative = False
        bg.horizontalAnchor = 'LEFT'
        bg.verticalAnchor = 'TOP'
        self.children = {}
        self._enabled = True
        assert isinstance(ID, str)
        self.ID = ID
        if parent:
            parent.add_child(self)
        else:
            self.parent = None
            GUI.addRoot(self.bg)
        self._region = region
        self.is_radio_group = is_radio_group
        self.z = z
        self.next = next
        return

    def sortChildren(self):
        for child in self.children.values():
            child.removeBackgroundFromParent(self)

        for child in sorted(self.children.values(), (lambda a, b: cmp(b._z, a._z))):
            child.connectBackgroundToParent(self)

    def _setz(self, value):
        from Util import clamp
        value = clamp(0, value, 1)
        self._z = value
        self.parent.sortChildren()

    def _getz(self):
        return self._z

    z = property(_getz, _setz, doc='float in [0..1]. Controls drawing order of components.\n\t\tSiblings in a component tree are drawn in order of decreasing z, with\n\t\tthe lowest-z components on top (unobscured).')

    def radio(self, selected):
        """Acknowledge that a child Checkbox was clicked, and unclick all other
                child checkboxes, if this component is set to hold a radio group."""
        if not self.is_radio_group:
            return False
        for child in self.allChildren():
            try:
                child.on = child == selected
            except:
                pass

        return True

    def window(self, child):
        assert child in self.allChildren()
        b = self.bg
        assert not (b.widthRelative or b.heightRelative)
        (x, y) = self.GUIToScreenCoordinates(b.position[:2])
        (w, h) = b.size
        return (x, y, w, h)

    def _get_halign(self):
        return self._align[0]

    def _set_halign(self, value):
        self._align[0] = value
        self.fit()

    halign = property(_get_halign, _set_halign, doc='float in [0..1]. Controls horizontal alignment within parent, if any.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def _get_valign(self):
        return self._align[1]

    def _set_valign(self, value):
        self._align[1] = value
        self.fit()

    valign = property(_get_valign, _set_valign, doc='float in [0..1]. Controls vertical alignment within parent, if any.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def change_alignment(self, dir, value):
        """Set the horizontal or vertical alignment of the component.
                dir => int - which alignment to set (0 = horizontal, 1 = vertical)
                value => float in [0..1] - the new alignment value"""
        self._align[dir] = value
        self.fit()

    def _get_hexpand(self):
        return self._expand[0]

    def _set_hexpand(self, value):
        self._expand[0] = value
        self.fit()

    hexpand = property(_get_hexpand, _set_hexpand, doc='float in [0..1]. Controls horizontal expansion within parent, if any.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def _get_vexpand(self):
        return self._expand[1]

    def _set_vexpand(self, value):
        self._expand[1] = value
        self.fit()

    vexpand = property(_get_vexpand, _set_vexpand, doc='float in [0..1]. Controls vertical expansion within parent, if any.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def _get_minsize(self):
        return self._minsize

    def _set_minsize(self, minsize):
        self._minsize = tuple(minsize)
        self.fit()

    minsize = property(_get_minsize, _set_minsize, doc='tuple of 2 ints. Specifies the minimum amount of actual screen space\n\t\ttaken up by the underlying GUI widget.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def _get_size(self):
        return self._size

    size = property(_get_size, doc='tuple of 2 ints. The current size of the component, after fitting.\n\t\tRead-only.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def _get_position(self):
        return self._position

    position = property(_get_position, doc='tuple of 2 ints. The current position of the component, in pixels,\n\t\twithin the context within it is fitted. This is typically an actual screen\n\t\tposition, but could be different because of Viewport translations, etc.\n\t\tThis value is more or less meaningless for Viewport instances because of\n\t\thow their fitting and positioning works.\n\t\tRead-only.\n\t\tSee "The Component Fitting Process" in the main GUI doc for details.')

    def fit(self):
        """Fit the component into the specified bounding box.
                Should not normally need to be called explicitly, but is provided just in
                case e.g. to handle creating extra components dynamically.
                Recursively calls fit() on all children.
                Whenever the screen is resized, all Layers being displayed should get
                re-fitted; this can be set up in BWPersonality.onRecreateDevice().
                """
        window = (0, 0) + BigWorld.screenSize()
        if self.parent:
            window = self.parent.window(self)
        position, cellsize = window[:2], window[2:]
        required_space = self.minsize
        if required_space[0] > cellsize[0] or required_space[1] > cellsize[1]:
            if not self.parent:
                BigWorld.resizeWindow(*required_space)
            else:
                print "WARNING: component didn't fit:", self.ID, self.parent.ID, self._region
                print 'REQUIRED SPACE:', required_space
                print 'CELLSIZE:', cellsize
        pos = list(position)
        size = list(self.minsize)
        for direction in range(2):
            to_distribute = cellsize[direction] - required_space[direction]
            expansion = int(to_distribute * self._expand[direction])
            offset = int((to_distribute - expansion) * self._align[direction])
            pos[direction] += offset
            size[direction] += expansion

        self._cellsize = tuple(cellsize)
        self._size = tuple(size)
        self._position = tuple(pos)
        self.setupBWComponent()
        self._fit_children()

    def setupBWComponent(self):
        self.positionBWComponent(self._position, self._size)

    def positionBWComponent(self, pos, size):
        assert self.bg.horizontalAnchor == 'LEFT'
        assert self.bg.verticalAnchor == 'TOP'
        self.bg.size = size
        self.bg.position = self.ScreenToGUICoordinates((pos[0], pos[1])) + self.bg.position[2:]

    def window_clip(self):
        if not self.parent:
            return (1, 1)
        return self.parent.GUIvsize()

    def GUIvsize(self):
        return self.window_clip()

    def ScreenToGUICoordinates(self, xy):
        (x, y) = self.ScreenToGUISize(xy)
        (w, h) = self.window_clip()
        return (x - w, h - y)

    def GUIToScreenCoordinates(self, xy):
        """Convert a clip-space coordinate into a vsize coordinate.
                Ignore scroll. (0, 0) in clip coordinates is the center of the vspace.
                xy -> (pair of floats) The coordinate to convert."""
        (x, y) = xy
        (w, h) = self.window_clip()
        return self.GUIToScreenSize((w + x, h - y))

    def ScreenToGUISize(self, xy):
        return ScreenToGUISize(xy)

    def GUIToScreenSize(self, xy):
        return GUIToScreenSize(xy)

    def mouse_position(self):
        return self.GUIToScreenCoordinates(GUI.mcursor().position)

    def _fit_children(self):
        for child in self.allChildren():
            child.fit()

    def layer(self):
        return self.handlers[0]

    def _fixBWVisibility(self, setting):
        setting = setting and self._visible
        if bool(self.bg.textureName) != setting:
            self.bg.textureName, self._tex_name_backup = self._tex_name_backup, self.bg.textureName
        for child in self.children.values():
            child._fixBWVisibility(setting)

    def show(self):
        """Set component visibility to True. The component will be shown only
                if all ancestors in the component tree are visible."""
        self._set_visible(True)

    def hide(self):
        """Set component visibility to False. The component is therefore hidden."""
        self._set_visible(False)

    def _get_visible(self):
        return self._visible

    def _set_visible(self, setting):
        self._visible = setting
        self.layer()._fixBWVisibility(True)

    visible = property(_get_visible, _set_visible, doc='Control visibility of the component.\n\t\tSetting a component to be invisible makes all its children invisible as \n\t\twell; but the children remember their visibility settings (showing and\n\t\timmediately re-hiding a hidden component, or vice versa, should never affect\n\t\tthe visibility of anything else). Note that invisible components can still\n\t\treceive mouse and keyboard events! (This is so that components can be\n\t\t"blinked" and still be clickable while "blinking".)')

    def destroy(self):
        if self.DESTROYED:
            return
        self.DESTROYED = True
        try:
            del self.layer().components[self.ID]
        except:
            pass

        for child in self.allChildren():
            child.destroy()

        if self.parent:
            self.parent.remove_child(self)
        else:
            GUI.delRoot(self.bg)
        self.removeAllPolicies()

    def onLoad(self, section):
        pass

    def onSave(self, section):
        pass

    def onBound(self):
        pass

    def setParent(self, parent):
        if self.parent:
            self.parent.remove_child(self)
        else:
            GUI.delRoot(self.bg)
        if parent:
            parent.add_child(self)
        else:
            GUI.addRoot(self.bg)

    def add_child(self, child):
        child.parent = self
        self.children[child.ID] = child
        child.connectBackgroundToParent(self)

    def remove_child(self, child):
        assert self.children[child.ID] == child
        child.parent = None
        del self.children[child.ID]
        child.removeBackgroundFromParent(self)
        return

    def connectBackgroundToParent(self, parent):
        self.bg.position[2] = parent.bg.position[2] * 0.9999
        parent.bg.addChild(self.bg)

    def removeBackgroundFromParent(self, parent):
        parent.bg.delChild(self.bg)

    def allChildren(self):
        return self.children.values()

    def useColourShader(self, setting):
        if self.parent:
            self.parent.useColourShader(setting)

    def parentViewport(self):
        return self.parent.parentViewportHelper() if self.parent else None

    def parentViewportHelper(self):
        return self.parent.parentViewportHelper() if self.parent else None

    def _getEnabled(self):
        return self._enabled and self.parentViewport().enabled

    def _setEnabled(self, value):
        self._enabled = bool(value)

    enabled = property(_getEnabled, _setEnabled, doc='Enable or disable the component.\n\t\tWhen False, this component ignores keyboard and mouse events.\n\t\tThe component is implicitly disabled, even if explicitly enabled, if its\n\t\tcontaining Layer (Viewport) is disabled.')

    def attachPolicy(self, policyName, *args, **kwargs):
        from MouseEventHandler import attachPolicyTo
        return attachPolicyTo(policyName, self, self.bg, *args, **kwargs)

    def removePolicy(self, policyName):
        from MouseEventHandler import removePolicyFrom
        return removePolicyFrom(self.bg, policyName)

    def removeAllPolicies(self):
        from MouseEventHandler import removeAllPolicies
        return removeAllPolicies(self.bg)

    def fix(self, hasFocus):
        pass

    def basic_dict_keys(self):
        result = {'minsize': self._minsize, 
           'align': tuple(self._align), 
           'expand': tuple(self._expand), 
           'cell': self.cell, 
           'is_radio_group': self.is_radio_group, 
           'z': self.z, 
           'next': self.next}
        if self.parent != self.layer():
            result['parent'] = self.parent.ID
        return result

    def dispatch(self, type, *args):
        """Use reflection to call event handlers in handler objects."""
        if not self.enabled:
            return
        for handler in self.handlers:
            if self._dispatch_to(handler, type + '_' + self.ID, args):
                break

    def _dispatch_to(self, handler, base, args):
        if hasattr(handler, 'component_' + base):
            return getattr(handler, 'component_' + base)(*((self,) + args))
        if hasattr(handler, base):
            return getattr(handler, base)(*args)
        if '_' not in base:
            return False
        (base, firstarg) = base.rsplit('_', 1)
        return self._dispatch_to(handler, base, (firstarg,) + args)


def loadSprites():
    try:
        try:
            f = file('gui/common.bsd')
            hax = f.read()
            Component.DATA = eval(hax, {}, {})
        except Exception, why:
            print 'ERROR OPENING COMMON.BSD:', why
            Component.DATA = {'sprites': {'': {'sheet': '', 'tiles': (1, 1), 'rect': (0, 0, 0, 0)}}, 'sheets': {}}
            print 'Initialized to default (no sprite data)'

    finally:
        try:
            f1.close()
            f2.close()
        except:
            pass


def rotated(asequence):
    return asequence[1:] + asequence[:1]


def set_default_minsize(adict):
    spritename = adict['sprite']
    spritedata = Component.DATA['sprites'][spritename]
    (tw, th) = spritedata['tiles']
    (x, y, w, h) = spritedata['rect']
    w, h = w / tw, h / th
    if 'minsize' not in adict and spritename != '':
        adict['minsize'] = (
         w - 2, h - 2)


class Component(ComponentBase):
    """A Component built on a GUI.Simple that is cut out of a sprite sheet.
        Represents an unchanging graphical element of the GUI, such as a background
        panel. The region of the sprite sheet used is logically divided vertically
        and horizontally into some number of equal-sized pieces called "mappings",
        one of which is used at a time. These are separated by 2px of divider space
        in each direction (rather, each individual mapping has a 1px border, and all
        the mappings of the sprite are arranged in a block), to simplify the art
        pipeline. See the main GUI documentation for more information.
        Instances of the base class are normally constructed via the alias "Image",
        and use sprites with just one mapping.
        """
    DATA = None

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the ComponentBase constructor.

                **kwargs:
                MUST contain everything needed for the ComponentBase constructor, except
                'bg' (which is constructed here).

                MUST also include:
                type -> (string) the type of the component. Used for creation and
                serialization. The type names are lowercase and consist only of lowercase
                letters; they are the lowercase version of the corresponding class name.
                For example, a type of 'button' is passed when constructing a Button (even
                though that could be inferred from the class being constructed).

                sprite -> (string) the name of the sprite to use for this component, or ''
                (empty string) for a transparent component.

                MAY also include:
                orientation -> (one of 0, 1, 2 or 3) indicates which way to rotate the
                sprite. The sprite will appear rotated by (orientation * 90) degrees; this
                is accomplished by changing the order of 'mapping' coordinates internally.
                Default 0 (no rotation).

                event_handlers -> (tuple) objects to which events received by this component
                will be dispatched, besides the Layer root itself. Default ()
                (no other handlers).

                labels -> (dict of string to string) initial values for auto-labels.
                The keys indicate regions and values are text to put in a corresponding
                auto-label when the component is created. Default {} (no labels).

                tooltip -> (string) if present, text to display in a tooltip for the item.
                A Tooltip policy is automatically attached to the component when this key
                is provided.

                tooltip_size -> (pair of ints) if present, overrides the normally calculated
                size for a tooltip. Has no effect if there is no 'tooltip' kwarg.

                tooltip_style -> (string) name for the layer used for a tooltip. Has no
                effect if there is no 'tooltip' kwarg. Default 'resizable_tooltip'.

                tooltip_delay -> (float) delay (in seconds) before displaying a tooltip.
                Has no effect if there is no 'tooltip' kwarg. Default 1.0."""
        orientation = kwargs.get('orientation', 0)
        self.handlers = kwargs.get('event_handlers', ())
        if Component.DATA is None:
            loadSprites()
        self.type = kwargs['type']
        set_default_minsize(kwargs)
        b = GUI.Simple('')
        b.filterType = 'POINT'
        b.materialFX = 'BLEND'
        ComponentBase.__init__(self, b, **kwargs)
        self.sprite = kwargs['sprite']
        labeldata = self.sprite_data().get('labels', {})
        self._regions = dict(((k, list(v['bounds'])) for (k, v) in labeldata.items()))
        for (k, v) in kwargs.get('labels', {}).items():
            self.write(k, v)

        self.orientation = 0
        self.setMapping(0)
        for i in range(orientation):
            self.rotate(False)

        if 'tooltip' in kwargs:
            self._tt = make_tooltip_for(self, kwargs)
        return

    def read(self, labelname):
        return self.children[labelname].text

    def write(self, labelname, text):
        from Label import Label
        if labelname in self.children:
            self.children[labelname].text = text
        else:
            labeldata = self.sprite_data().get('labels', {})[labelname]
            Label(ID=labelname, type='label', sprite='', expand=(1, 1), parent=self, region=labelname, text=text, line_padding=labeldata.get('line_padding', 0), behaviour=labeldata.get('behaviour', 'squeeze'), font=labeldata['font'], text_align=labeldata['text_align']).fit()

    def sprite_data(self):
        return Component.DATA['sprites'][self.sprite]

    def _get_sprite(self):
        return self._sprite

    def _set_sprite(self, spritename):
        self._sprite = spritename
        data = self.sprite_data()
        texture, tiles, texcoords = data['sheet'], data['tiles'], data['rect']
        (x, y, w, h) = texcoords
        assert not w % tiles[0], "horizontal sprite size doesn't divide evenly"
        assert not h % tiles[1], "vertical sprite size doesn't divide evenly"
        w /= tiles[0]
        h /= tiles[1]
        if not texture:
            self.mappings = tuple((self.bg.mapping for j in range(tiles[1]) for i in range(tiles[0])))
            self.tweak = (0, 0)
        else:
            (wsize, hsize) = [ float(c) for c in Component.DATA['sheets'][texture] ]
            tl = (
             x + 1, y + 1)
            br = (x + w - 1, y + h - 1)
            prototype = (
             (
              tl[0], tl[1]), (tl[0], br[1]), (br[0], br[1]), (br[0], tl[1]))
            self.mappings = tuple((tuple((((x + i * w) / wsize, (y + j * h) / hsize) for (x, y) in prototype)) for j in range(tiles[1]) for i in range(tiles[0])))
            self.bg.textureName = texname(texture)
            self.tweak = (
             1 / (2 * wsize), 1 / (2 * hsize))

    sprite = property(_get_sprite, _set_sprite)

    def filterText(self, text):
        return text

    def rotate(self, doFit=True):
        self.orientation = (self.orientation + 1) % 4
        self.mappings = tuple((rotated(x) for x in self.mappings))
        self.setMapping(self._mapping)
        self.minsize = rotated(self.minsize)
        for (k, v) in self._regions.items():
            (x, y, w, h) = v
            v[:] = (1 - y - h, x, h, w)

        if doFit:
            self.fit()

    def setMapping(self, id):
        self._mapping = id
        t = [
         self.tweak[0] * (-0.001 if self.orientation in (2, 3) else 0.001),
         self.tweak[1] * (-0.001 if self.orientation in (1, 2) else 0.001)]
        self.bg.mapping = tuple(((x + t[0], y + t[1]) for (x, y) in self.mappings[id % len(self.mappings)]))

    def editor_rightclick(self):
        self.rotate()

    def as_dict(self):
        """Creates a dict representing the current state and type of the component.
                Used by the Editor for serialization. FIXME: Move to base class."""
        assert self.parent != None, self.ID + ": can't make a dict for the layer root"
        result = self.basic_dict_keys()
        result.update({'orientation': self.orientation, 
           'sprite': self.sprite, 
           'type': self.type})
        try:
            result.update(self.bg.script.policies['Tooltip'].as_dict())
        except:
            pass

        result.update(self._extra_dict_keys())
        return result

    def _extra_dict_keys(self):
        from Label import Label
        return {'labels': dict(((k, v.text) for (k, v) in self.children.items() if isinstance(v, Label)))}

    def window(self, child):
        (x, y, w, h) = ComponentBase.window(self, child)
        if child._region:
            (dx, dy, pw, ph) = self._regions[child._region]
            x += dx * w
            y += dy * h
            w *= pw
            h *= ph
        return (round(x), round(y), round(w), round(h))


def _lw_paragraph(text, width, lenfunc):
    words = text.split()
    words.reverse()
    result = ''
    if not words:
        return (result, 1, 0)
    line = words.pop()
    linecount = 1
    longest = 0
    while words:
        word = words.pop()
        candidate = (' ').join((line, word))
        if lenfunc(candidate) > width:
            result += line + '\n'
            longest = max(longest, lenfunc(line))
            linecount += 1
            line = word
        else:
            line = candidate

    return (result + line, linecount, max(longest, lenfunc(line)))


def _linewrap_with_info(text, width, lenfunc):
    data = zip(*[ _lw_paragraph(p, width, lenfunc) for p in text.split('\n') ])
    return (('\n').join(data[0]), (sum(data[1]), max(data[2])))


def make_tooltip_for(aComponent, kwargs):
    text = kwargs['tooltip']
    font_tester = GUI.Text(' ')
    font_tester.font = 'Bronic_17.font'
    wrapper = lambda w: _linewrap_with_info(text, w, font_tester.stringWidth)[1]
    (linecount, width) = wrapper(300)
    while True:
        (new_linecount, new_width) = wrapper(width - 1)
        if new_linecount > linecount:
            break
        if new_width == width:
            break
        assert new_width < width
        width = new_width

    return aComponent.attachPolicy('Tooltip', size=kwargs.get('tooltip_size', (24 + width, 24 + 22 * linecount)), style=kwargs.get('tooltip_style', 'resizable_tooltip'), delay=kwargs.get('tooltip_delay', 1.0), text=kwargs['tooltip'], row_spacing=(0,
                                                                                                                                                                                                                                                       1,
                                                                                                                                                                                                                                                       0), column_spacing=(0,
                                                                                                                                                                                                                                                                           1,
                                                                                                                                                                                                                                                                           0))


Image = Component