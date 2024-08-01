# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/lib-tk/tkColorChooser.py
# Compiled at: 2008-12-16 09:38:20
from tkCommonDialog import Dialog

class Chooser(Dialog):
    """Ask for a color"""
    command = 'tk_chooseColor'

    def _fixoptions(self):
        try:
            color = self.options['initialcolor']
            if type(color) == type(()):
                self.options['initialcolor'] = '#%02x%02x%02x' % color
        except KeyError:
            pass

    def _fixresult(self, widget, result):
        if not result:
            return (None, None)
        (r, g, b) = widget.winfo_rgb(result)
        return ((r / 256, g / 256, b / 256), result)


def askcolor(color=None, **options):
    """Ask for a color"""
    if color:
        options = options.copy()
        options['initialcolor'] = color
    return Chooser(**options).show()


if __name__ == '__main__':
    print 'color', askcolor()