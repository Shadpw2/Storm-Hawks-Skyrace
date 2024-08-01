# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Factory.py
# Compiled at: 2008-12-16 09:35:38
from Util import ignore
from keys import KEY_RETURN, KEY_ESCAPE
from Bitcasters.mode.cursor import cursor
import Bitcasters.GUI
__import__('Bitcasters.GUI', fromlist=['*'])
for module in Bitcasters.GUI.__dict__.values():
    if not isinstance(module, type(Bitcasters.GUI)):
        continue
    for (name, klass) in module.__dict__.items():
        if hasattr(klass, '__mro__') and Bitcasters.GUI.Component.ComponentBase in klass.__mro__:
            globals()[name] = klass

def _compile(root, data, size, event_handlers):
    names = data.keys()
    blocked_count = 0

    def _installComponent():
        try:
            component = type(ID=name, parent=parent, event_handlers=event_handlers, **item)
            try:
                component.visible = item.get('visible', True)
            except:
                pass

            root.components[name] = component
        except:
            print "can't make:", item
            __import__('traceback').print_exc()
            raise

    while names:
        name = names.pop(0)
        item = data[name]
        type = globals()[item['type'].title()]
        if 'parent' not in item:
            parent = root
            _installComponent()
            if blocked_count > 0:
                blocked_count -= 1
            continue
        pkey = item['parent']
        if pkey in root.components.keys():
            parent = root.components[pkey]
            del item['parent']
            _installComponent()
            if blocked_count > 0:
                blocked_count -= 1
        elif pkey in names:
            if pkey in names[:blocked_count]:
                print 'cycle detected:', names[:blocked_count]
                raise ValueError
            blocked_count += 1
            names.remove(pkey)
            names = [pkey, name] + names
        else:
            print 'bogus parent:', type, item, pkey
            raise ValueError


class Layer(Viewport):
    """A tree of related GUI components rooted by a Viewport with some additional
        functionality."""
    ALL_LAYERS = []
    DIALOG_LAYER = None
    _ACTIVE_COMPONENT = None
    DRAGGING_CLICKABLE = False

    class _KeyAction(object):

        def __init__(self, func):
            self._func = func

        def __call__(self):
            self._func()

    enter = _KeyAction(ignore)
    escape = _KeyAction(ignore)

    @staticmethod
    def bind_key(key, action):
        """Assign the given action to be performed whenever the key is pressed.
                key -> (int) BigWorld key code.
                action -> (callable) what to do."""
        setattr(Layer, key, Layer._KeyAction(action))

    @staticmethod
    def check_focus(component):
        """Return whether the indicated component is the active component.
                component -> (ComponentBase) the component to check for"""
        return Layer._ACTIVE_COMPONENT == component

    @staticmethod
    def expect_focus(component):
        """Complain if the indicated component is not the active component.
                component -> (ComponentBase) the component to check for"""
        if Layer.check_focus(component):
            return
        f = Layer._ACTIVE_COMPONENT
        if f == None:
            raise ValueError, 'CLICK: MISMATCH: NOT EXPECTING A CLICK ON %s' % component.ID
        raise ValueError, 'CLICK: MISMATCH: EXPECTED CLICK ON %s BUT GOT IT ON %s' % (f.ID, component.ID)
        return

    @staticmethod
    def focus(component):
        """Set the active (focussed) component to the indicated component.
                component -> (ComponentBase) the component to focus"""
        f = Layer._ACTIVE_COMPONENT
        if f != None:
            f.fix(False)
        Layer._ACTIVE_COMPONENT = component
        if component != None:
            component.fix(True)
        return

    @staticmethod
    def _fix_current():
        f = Layer._ACTIVE_COMPONENT
        if f != None:
            f.fix(True)
        return

    from Bitcasters.RepeatedTask import RepeatedTask
    blinker = RepeatedTask((lambda : Layer._fix_current()), 2).start()

    @staticmethod
    def tab():
        """Cycle between text fields."""
        f = Layer._ACTIVE_COMPONENT
        if f != None and f.next != None:
            f.layer().focus_my(f.next)
        return

    @staticmethod
    def char(key):
        """Process a character of text: if a text field is selected, append it.
                key -> (string) the character of text to append (should be one character;
                calling code is responsible for translating from BigWorld key codes)"""
        f = Layer._ACTIVE_COMPONENT
        try:
            f.char(key)
            return True
        except:
            return False

    @staticmethod
    def erase():
        """Process the backspace key: if a text field is selected, delete the last
                character of that field's contents."""
        f = Layer._ACTIVE_COMPONENT
        try:
            f.erase()
            return True
        except:
            return False

    def __init__(self, name, data, z, event_handlers, **kwargs):
        """Constructor. Should not be directly called; use the factory functions
                create() or attach_child() instead.
                name -> (string) name of layer. Not used, just stored for reference.
                data -> (dict of string to component-specification) data describing all
                components in the layer.
                z -> (float) z-component of position at which the layer root will appear.
                z-components of children are scaled to appear between the root and the
                foreground.
                event_handlers -> (sequence of objects) the objects to which mouse events
                for each component will be dispatched.
                **kwargs:
                MAY include:
                size -> (pair of int) minimum size, in pixels, of the layer. This will
                also imply a minimum for the virtual size of the scrollable area of the
                layer's window.
                row_spacing -> (sequence of float) The relative weighting of each row used
                by the fitting algorithm to distribute extra space. Default (1,) (i.e. only
                one row in the layout so its weighting is irrelevant).
                column_spacing -> (sequence of float) The relative weighting of each column
                used by the fitting algorithm to distribute extra space. Default (1,)
                (i.e. only one column in the layout so its weighting is irrelevant).
                trap_background_clicks -> (boolean) If True, the Layer component has a
                Clickable policy attached, preventing clicks from being processed by other
                layers underneath this one (default True).
                """
        self.preinit(data, **kwargs)
        size = kwargs.get('size', (0, 0))
        expand = (0, 0) if 'size' in kwargs else (1, 1)
        Viewport.__init__(self, size, minsize=size, ID='fade', z=z, expand=expand, event_handlers=(
         self,) + event_handlers, parent=None, row_spacing=kwargs.get('row_spacing', (1, )), column_spacing=kwargs.get('column_spacing', (1, )))
        self.components = {}
        _compile(self, data, size, (self,) + event_handlers)
        if kwargs.get('trap_background_clicks', True):
            self.attachPolicy('Clickable', act=(lambda : self.dispatch('click')))
        self.fit()
        import GUI
        GUI.reSort()
        self._name = name
        self.postinit()
        Layer.ALL_LAYERS.append(self)
        if Layer.DIALOG_LAYER:
            self.enabled = False
            self.to((63, 63, 63, 192), 0)
        return

    name = property((lambda self: self._name), doc='Name of the module used to construct this layer (read-only).')

    def focus_my(self, component_name):
        """Focus the component of this Layer with the given name.
                component_name -> (string) the component to focus."""
        Layer.focus(self.components[component_name])

    def set_chain_of_command(self, *owners):
        """Reset the list of event handlers for each component in the Layer.
                *owners -> (objects) The new handlers for events. The Layer itself always
                gets the first chance to handle events. After that, events are dispatched
                to the listed handlers, in order."""
        event_handlers = (
         self,) + owners
        for component in self.components.values():
            component.handlers = event_handlers

    def preinit(self, data, **kwargs):
        """Hook for subclasses. Allows for modifying the 'data' that will be used
                for layer construction depending on keyword arguments.
                data -> (dict of string to component-specification) data describing all
                components in the layer. May be modified here.
                **kwargs:
                Forwarded from the constructor. Up to the subclass to interpret.
                """
        pass

    def postinit(self):
        """Hook for subclasses. Code to run at the end of construction."""
        pass

    def cleanup(self):
        """Unregister the layer and destroy all its components."""
        Viewport.destroy(self)
        Layer.ALL_LAYERS.remove(self)

    def read(self, field):
        """Read the default 'text' auto-label of the named component; assumes that
                auto-label exists.
                field -> (string) the name of the component."""
        return self.components[field].read('text')

    def write(self, field, value):
        """Write to the default 'text' auto-label of the named component; assumes
                that a region named 'text' is available for that component.
                field -> (string) the name of the component.
                value -> (string) the text to write."""
        self.components[field].write('text', value)

    def current_field(self):
        """If a component in this layer is currently focussed, return it;
                otherwise return None (even if a component in some *other* layer is
                focussed)."""
        f = Layer._ACTIVE_COMPONENT
        return f if f in self.components.values() else None

    def dismiss(self, action=ignore):
        """"Dismiss" a dialog layer by cleaning it up and restoring all
                the other faded-out layers. This must only be called upon a
                dialog layer, while it is the current dialog; it should only be
                called by that dialog layer's other methods or event handlers
                (see Bitcasters.layers.dialog for an example of binding 'dismiss'
                to button events). The enter and escape keys are returned to
                their former do-nothing roles and an optional 'action' is performed
                after everything else is cleaned up.
                action -> (callable) arbitrary code to run after dismissing the
                dialog; provided for convenience. Default ignore (do nothing)."""
        cursor('previous')
        Layer.DIALOG_LAYER = None
        Layer.bind_key('enter', ignore)
        Layer.bind_key('escape', ignore)
        self.cleanup()
        for layer in Layer.ALL_LAYERS:
            layer.enabled = True
            layer.to((255, 255, 255, 255), 1)

        action()
        return


def create(name, z, owner, **kwargs):
    """Factory function to create a layer which is fit within the screen rect.
        The data for layer components will be dynamically imported from a module
        and optionally processed by the Layer subclass that is constructed,
        before being "compiled" into a tree of Components. The layer is
        automatically added to the display.
        name -> (string) name of the type of layer to create (will be looked up
        for dynamic import).
        z -> (float) z-component of position at which the layer root will appear.
        z-components of children are scaled to appear between the root and the
        foreground.
        owner -> (object) An object that will handle events generated in the Layer.
        **kwargs:
        MAY include:
        size -> (pair of int) minimum size, in pixels, of the layer. This will
        also imply a minimum for the virtual size of the scrollable area of the
        layer's window. If no size is specified, the layer will have a minimum
        size of (0, 0), but the layer root will have an expand parameter of (1, 1),
        causing the layer to fill the screen.
        row_spacing -> (sequence of float) The relative weighting of each row used
        by the fitting algorithm to distribute extra space. Default (1,) (i.e. only
        one row in the layout so its weighting is irrelevant).
        column_spacing -> (sequence of float) The relative weighting of each column
        used by the fitting algorithm to distribute extra space. Default (1,)
        (i.e. only one column in the layout so its weighting is irrelevant).
        trap_background_clicks -> (boolean) If True, the Layer component has a
        Clickable policy attached, preventing clicks from being processed by other
        layers underneath this one (default True).
        """
    package = __import__('Bitcasters.layers', fromlist=[name])
    module = getattr(package, name)
    from copy import deepcopy
    return module.Layer(name, deepcopy(module.data), z, (owner,), **kwargs)


def attach_child(parent, name, z, owner, child_align, parent_align, **kwargs):
    """Factory function to create a layer which is attached to the specified
        'owner' (a component in another Layer, possibly the Layer root itself).
        The data for layer components will be dynamically imported from a module
        and optionally processed by the Layer subclass that is constructed,
        before being "compiled" into a tree of Components. The layer is
        automatically added to the display.
        name -> (string) As for create().
        z -> (float) As for create().
        owner -> (object) As for create().
        child_align -> (pair of floats) Position on the Layer used for
        anchoring ((0, 0) = top-left, (0.5, 0.5) = middle, (1, 1) = bottom-right).
        parent_align -> (pair of floats) Position on the parent component used for
        anchoring ((0, 0) = top-left, (0.5, 0.5) = middle, (1, 1) = bottom-right).
        The layer is positioned such that the positions specified by child_align
        and parent_align coincide.
        **kwargs:
        As for create()."""
    child = create(name, z, owner, **kwargs)
    child.anchorOn(child_align, parent, parent_align)
    return child


def dialog(name, **kwargs):
    """Factory function to create a "dialog" layer which is centered on screen.
        The layer is automatically added to the display. This layer represents a
        modal dialog: all other layers will fade out and be temporarily disabled
        until the user selects an option.
        name -> (string) as for create().
        icon -> (int) passed as a keyword argument to the Layer subclass. A code
        that may used to select a graphical icon associated with the dialog.
        *kwargs:
        As for create()."""
    cursor('mouse')
    for layer in Layer.ALL_LAYERS:
        layer.enabled = False
        layer.to((63, 63, 63, 192), 1)

    result = create(name, 0.01, None, **kwargs)
    Layer.DIALOG_LAYER = result
    return result


def notify(icon, title, text, ok_callback=ignore):
    """Shortcut: create the default dialog layer for a notification message.
        There will be one button provided to dismiss the dialog: an ok button, also
        triggerable with the return key.
        icon -> (int) mapping to use for the dialog box icon.
        title -> (string) caption for the dialog box.
        text -> (string) dialog box message.
        ok_callback -> (callable) run when the dialog is dismissed."""
    dialog('dialog', icon=icon, title=title, text=text, ok=ok_callback)


def ask(icon, title, text, ok_callback=ignore, cancel_callback=ignore):
    """Shortcut: create the default dialog layer for a yes-or-no question.
        There will be two buttons provided to dismiss the dialog: an ok button, also
        triggerable with the return key, and a cancel button, also triggerable with
        the escape key.
        icon -> (int) mapping to use for the dialog box icon.
        title -> (string) caption for the dialog box.
        text -> (string) dialog box message.
        ok_callback -> (callable) run when the dialog is answered with OK.
        cancel_callback -> (callable) run when the dialog is answered with Cancel."""
    dialog('dialog', icon=icon, title=title, text=text, ok=ok_callback, cancel=cancel_callback)


def help(text):
    """Shortcut: set up a help dialog.
        text -> (string) the help text."""
    dialog('help', text=text)


def tos_pp(title, text):
    """Shortcut: set up a dialog for terms of service or privacy policy info.
        title -> (string) caption for the window.
        text -> (string) the terms of service / privacy policy text."""
    dialog('tos_pp', title=title, text=text)