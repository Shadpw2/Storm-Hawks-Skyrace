# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/TextField.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
from Component import Component
from Label import Label

class Textfield(Component):
    """A place to input text - like a Label, but it can be clicked on to "focus"
        it, and thereafter, key events are sent to the field to write or erase text.
        The insertion cursor is represented with an underscore character. (Currently,
        there is no support for moving the cursor within the text; it is always at
        the end.) It may optionally be set up as a "password field"; in this case,
        the displayed text consists of all asterisks, but the input text is still
        remembered and can be retrieved.
        
        The sprite for this Component must have a region named "text"; the 
        constructor will set up a child Label fitted to that region."""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                **kwargs:
                MUST contain everything needed for the Component constructor.
                
                MAY also contain:
                font -> see Label.__init__ doc. If not specified, a value will be read from
                the spritesheet data.

                text_align -> see Label.__init__ doc.
                
                handle_clicks -> see Label.__init__ doc.

                line_padding -> see Label.__init__ doc.

                password -> (boolean) if True, the field is a password field, per the class
                doc. Default False."""
        self.password = kwargs.get('password', False)
        self.blink = ''
        assert 'behaviour' not in kwargs, "text fields force 'shift' behaviour for the underlying label"
        kwargs['behaviour'] = 'shift'
        Component.__init__(self, **kwargs)
        self.attachPolicy('Clickable', press=(lambda : self.dispatch('click')))
        self.hasFocus = False
        kwargs['parent'] = self
        kwargs['region'] = 'text'
        kwargs['ID'] = 'text'
        kwargs['sprite'] = ''
        kwargs['expand'] = (1, 1)
        if 'minsize' in kwargs:
            del kwargs['minsize']
        kwargs.setdefault('font', self.sprite_data()['labels']['text']['font'])
        self._label = Label(**kwargs)
        self._label.filterText = lambda text: ('*' * len(text) if self.password else text) + '_'
        self._label.blinkText = lambda text: text if self.blink else text[:-1]

    def check_blink(self):
        t = BigWorld.time()
        self.blink = self.hasFocus and t - int(t) <= 0.5

    def fix(self, hasFocus):
        oldblink = self.blink
        self.hasFocus = hasFocus
        self.check_blink()
        if oldblink != self.blink:
            self._label.text = self._label.text

    def _getText(self):
        return self._label.text

    def _setText(self, text):
        self._label.text = text

    text = property(_getText, _setText)

    def editor_rightclick(self):
        self.password = not self.password

    def extra_dict_keys(self):
        return {'password': self.password, 
           'font': self._label._font, 
           'text': self._label.text}

    def char(self, key):
        """Append the provided character to the field.
                key -> (string) the character of text to append (should be one character;
                calling code is responsible for translating from BigWorld key codes)"""
        self.write('text', self.read('text') + key)

    def erase(self):
        """Delete the last character of the field's contents."""
        self.write('text', self.read('text')[:-1])