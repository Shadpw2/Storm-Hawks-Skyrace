# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/lib-tk/tkFileDialog.py
# Compiled at: 2008-12-16 09:38:20
from tkCommonDialog import Dialog

class _Dialog(Dialog):

    def _fixoptions(self):
        try:
            self.options['filetypes'] = tuple(self.options['filetypes'])
        except KeyError:
            pass

    def _fixresult(self, widget, result):
        if result:
            import os
            try:
                result = result.string
            except AttributeError:
                pass
            else:
                (path, file) = os.path.split(result)
                self.options['initialdir'] = path
                self.options['initialfile'] = file
        self.filename = result
        return result


class Open(_Dialog):
    """Ask for a filename to open"""
    command = 'tk_getOpenFile'

    def _fixresult(self, widget, result):
        if isinstance(result, tuple):
            result = tuple([ getattr(r, 'string', r) for r in result ])
            if result:
                import os
                (path, file) = os.path.split(result[0])
                self.options['initialdir'] = path
            return result
        if not widget.tk.wantobjects() and 'multiple' in self.options:
            return self._fixresult(widget, widget.tk.splitlist(result))
        return _Dialog._fixresult(self, widget, result)


class SaveAs(_Dialog):
    """Ask for a filename to save as"""
    command = 'tk_getSaveFile'


class Directory(Dialog):
    """Ask for a directory"""
    command = 'tk_chooseDirectory'

    def _fixresult(self, widget, result):
        if result:
            try:
                result = result.string
            except AttributeError:
                pass
            else:
                self.options['initialdir'] = result
        self.directory = result
        return result


def askopenfilename(**options):
    """Ask for a filename to open"""
    return Open(**options).show()


def asksaveasfilename(**options):
    """Ask for a filename to save as"""
    return SaveAs(**options).show()


def askopenfilenames(**options):
    """Ask for multiple filenames to open

    Returns a list of filenames or empty list if
    cancel button selected
    """
    options['multiple'] = 1
    return Open(**options).show()


def askopenfile(mode='r', **options):
    """Ask for a filename to open, and returned the opened file"""
    filename = Open(**options).show()
    if filename:
        return open(filename, mode)
    return


def askopenfiles(mode='r', **options):
    """Ask for multiple filenames and return the open file
    objects

    returns a list of open file objects or an empty list if
    cancel selected
    """
    files = askopenfilenames(**options)
    if files:
        ofiles = []
        for filename in files:
            ofiles.append(open(filename, mode))

        files = ofiles
    return files


def asksaveasfile(mode='w', **options):
    """Ask for a filename to save as, and returned the opened file"""
    filename = SaveAs(**options).show()
    if filename:
        return open(filename, mode)
    return


def askdirectory(**options):
    """Ask for a directory, and return the file name"""
    return Directory(**options).show()


if __name__ == '__main__':
    enc = 'utf-8'
    import sys
    try:
        import locale
        locale.setlocale(locale.LC_ALL, '')
        enc = locale.nl_langinfo(locale.CODESET)
    except (ImportError, AttributeError):
        pass
    else:
        openfilename = askopenfilename(filetypes=[('all files', '*')])
        try:
            fp = open(openfilename, 'r')
            fp.close()
        except:
            print 'Could not open File: '
            print sys.exc_info()[1]
        else:
            print 'open', openfilename.encode(enc)
            saveasfilename = asksaveasfilename()
            print 'saveas', saveasfilename.encode(enc)