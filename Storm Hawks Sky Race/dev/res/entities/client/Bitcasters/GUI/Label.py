# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/Label.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI
from Component import Component, _linewrap_with_info

def linewrap(text, font, width, height):
    from GUI import Text
    from Component import ScreenToGUISize
    proto = Text(' ')
    proto.font = font
    width = int(width * proto.height / ScreenToGUISize((0, height))[1])
    return _linewrap_with_info(text, width, proto.stringWidth)[0]


class Label(Component):
    """A component that can display text.
        The text is displayed using GUI.Text objects that are children of a
        GUI.Window, which in turn is a child of the base underlying GUI.Simple.
        This allows for making scrolling text boxes, for example.
        Text is displayed at the natural size of the supplied font, although it may
        be squeezed horizontally to fit in some cases. No bilinear filtering is
        applied. The Label may be configured so that text is line-wrapped
        automatically."""

    def __init__(self, **kwargs):
        """Constructor.
                Everything is passed in **kwargs, which ensures that all parameters are
                easily passed to the Component constructor.

                **kwargs:
                MUST contain everything needed for the Component constructor.
                
                MUST also contain:
                font -> (string) name of the font to use, without the '.font' extension.

                behaviour -> (one of 'wrap', 'squeeze' or 'shift') specifies how the Label
                will behave when text is too long to display in the visible area:
                'wrap': the text is line-wrapped, and any excess lines are simply clipped
                by the GUI.Window. Recall that this Window can be scrolled.
                'squeeze': the text is squeezed horizontally to fit in the Label's space.
                'shift': the text is shifted, so that e.g. if the label is left-aligned
                normally, the rightmost portion of the text is shown. This is a commonly
                desired behaviour for text input fields. Effectively, all that happens is
                that the text_align value is temporarily "inverted".

                MAY also contain:
                text_align -> (float in [0.0, 1.0]) how the text is aligned:
                0.0 = left-aligned, 0.5 = centered within the field, 1.0 = right-aligned.
                Other values are of course possible, but unlikely to be desirable.
                Default 0.0 (left-aligned).

                handle_clicks -> (boolean) if True, each line of text is Clickable, and
                when clicked, will dispatch an event called 'line' with the line's text
                as an argument. Default False.
                
                line_padding -> (int) an amount (in pixels) of additional space to insert
                between lines of text (may be negative, to squish them together).
                Irrelevant if the 'behaviour' is not 'wrap'. Default 0."""
        self._behaviour = kwargs['behaviour']
        assert self._behaviour in ('wrap', 'squeeze', 'shift')
        self._font = kwargs['font']
        self._text_align = kwargs.get('text_align', 0)
        self._handle_clicks = kwargs.get('handle_clicks', False)
        f = self._makefield()
        self._fields = [f]
        self._rawtext = kwargs.get('text', '')
        self._text = []
        self._maxtextlength = 0
        Component.__init__(self, **kwargs)
        self._line_height = int(round(self.GUIToScreenSize(f.size)[1]))
        self._line_padding = kwargs.get('line_padding', 0)
        v = GUI.Window()
        v.addChild(f)
        self.bg.addChild(v)
        v.horizontalAnchor = 'LEFT'
        v.verticalAnchor = 'TOP'
        v.widthRelative = False
        v.heightRelative = False
        self._viewport = v
        self._scroll = 0
        self._page_size = 1

    def _fixBWVisibility(self, setting):
        Component._fixBWVisibility(self, setting)
        self._viewport.visible = setting and self._visible

    def _makefield(self):
        f = GUI.Text(' ')
        f.font = self._font + '.font'
        f.filterType = 'POINT'
        f.horizontalAnchor = 'LEFT'
        f.verticalAnchor = 'TOP'
        if self._handle_clicks:
            from Bitcasters.GUI.MouseEventHandler import attachPolicyTo
            attachPolicyTo('Clickable', self, f, act=(lambda : self.dispatch('line', f.text)))
        return f

    def destroy(self):
        if self.DESTROYED:
            return
        self.bg.delChild(self._viewport)
        Component.destroy(self)

    def fit(self):
        Component.fit(self)
        v = self._viewport
        v.size = self.bg.size
        (x, y, z) = self.bg.position
        (sw, sh) = BigWorld.screenSize()
        dx, dy = v.size[0] % 2 / sw, v.size[1] % 2 / sh
        v.position = (x + dx, y - dy, z)
        self._setFields()

    def _getText(self):
        return self._rawtext

    def _setText(self, text):
        self._rawtext = text
        self._setFields()

    text = property(_getText, _setText)

    def limitText(self, lines):
        """Allow only the last N line-wrapped lines to be scrolled over.
                lines -> (int) number of lines to show."""
        assert int(lines) >= 1
        self._maxtextlength = int(lines)

    def unlimitText(self):
        """Remove a limit set by a previous call to limitText()."""
        self._maxtextlength = 0

    def filterText(self, text):
        return text

    def blinkText(self, text):
        return text

    def _setFields(self):
        filtered = self.filterText(self._rawtext)
        self._text = linewrap(filtered, self._font + '.font', self.size[0], self._line_height).split('\n') if self._behaviour == 'wrap' else [filtered]
        self._text = self._text[-self._maxtextlength:]
        required_fields = len(self._text) - len(self._fields)
        for field in xrange(required_fields):
            f = self._makefield()
            self._viewport.addChild(f)
            self._fields.append(f)

        for field in xrange(-required_fields):
            f = self._fields[0]
            self._fields.remove(f)
            self._viewport.delChild(f)

        self._display()

    def scrollTo(self, to):
        from Util import clamp
        self._scroll = clamp(0, to, self.max_scroll)
        self._display()

    def page_unclamped(self, by):
        self._scroll += by * self._page_size
        self._display()

    def scrollBy(self, by):
        self.scrollTo(self._scroll + by)

    def _display(self):
        (x, y) = self.position
        (w, h) = self.size
        assert len(self._text) == len(self._fields)
        v = self._viewport
        scale = self.ScreenToGUISize
        dx, dy = -w / 2, h / 2
        line_spacing = self._line_height + self._line_padding
        self.max_scroll = len(self._fields) - h / line_spacing
        self.max_scroll = (self.max_scroll + self._page_size - 1) / self._page_size * self._page_size
        v.minScroll = scale((dx, dy))
        v.maxScroll = scale((dx, dy + self.max_scroll * line_spacing))
        v.scroll = scale((dx, dy + self._scroll * line_spacing))
        (x, y) = self.GUIToScreenCoordinates((0, 0))
        y += self._line_padding / 2.0
        for (line, field) in zip(self._text, self._fields):
            field.text = self.blinkText(line) if field is self._fields[-1] else line
            text_width = field.stringWidth(line)
            field.explicitSize = False
            if text_width > w:
                if self._behaviour == 'squeeze':
                    field.explicitSize = True
                    field.size = self.ScreenToGUISize((w, self._line_height))
                    offset = 0
                elif self._behaviour == 'shift':
                    offset = (w - text_width) * (1 - self._text_align)
                else:
                    assert False, 'line-wrapped text was over-length'
            else:
                offset = (w - text_width) * self._text_align
            field.position = self.ScreenToGUICoordinates((x + offset, y)) + (0, )
            y += line_spacing

    def extra_dict_keys(self):
        return {'behaviour': self._behaviour, 
           'font': self._font, 
           'text': self.text, 
           'text_align': self._text_align}