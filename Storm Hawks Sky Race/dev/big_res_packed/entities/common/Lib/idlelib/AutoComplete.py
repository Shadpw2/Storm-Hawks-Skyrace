# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/idlelib/AutoComplete.py
# Compiled at: 2008-12-16 09:38:16
"""AutoComplete.py - An IDLE extension for automatically completing names.

This extension can complete either attribute names of file names. It can pop
a window with all available names, for the user to select from.
"""
import os, sys, string
from configHandler import idleConf
import AutoCompleteWindow
from HyperParser import HyperParser
import __main__
FILENAME_CHARS = string.ascii_letters + string.digits + os.curdir + '._~#$:-'
ID_CHARS = string.ascii_letters + string.digits + '_'
(COMPLETE_ATTRIBUTES, COMPLETE_FILES) = range(1, 3)

class AutoComplete:
    menudefs = [
     (
      'edit',
      [
       ('Show Completions', '<<force-open-completions>>')])]
    popupwait = idleConf.GetOption('extensions', 'AutoComplete', 'popupwait', type='int', default=0)

    def __init__(self, editwin=None):
        if editwin == None:
            self.editwin = None
            return
        self.editwin = editwin
        self.text = editwin.text
        self.autocompletewindow = None
        self._delayed_completion_id = None
        self._delayed_completion_index = None
        return

    def _make_autocomplete_window(self):
        return AutoCompleteWindow.AutoCompleteWindow(self.text)

    def _remove_autocomplete_window(self, event=None):
        if self.autocompletewindow:
            self.autocompletewindow.hide_window()
            self.autocompletewindow = None
        return

    def force_open_completions_event(self, event):
        """Happens when the user really wants to open a completion list, even
        if a function call is needed.
        """
        self.open_completions(True, False, True)

    def try_open_completions_event(self, event):
        """Happens when it would be nice to open a completion list, but not
        really neccesary, for example after an dot, so function
        calls won't be made.
        """
        lastchar = self.text.get('insert-1c')
        if lastchar == '.':
            self._open_completions_later(False, False, False, COMPLETE_ATTRIBUTES)
        elif lastchar == os.sep:
            self._open_completions_later(False, False, False, COMPLETE_FILES)

    def autocomplete_event(self, event):
        """Happens when the user wants to complete his word, and if neccesary,
        open a completion list after that (if there is more than one
        completion)
        """
        if hasattr(event, 'mc_state') and event.mc_state:
            return
        if self.autocompletewindow and self.autocompletewindow.is_active():
            self.autocompletewindow.complete()
            return 'break'
        else:
            opened = self.open_completions(False, True, True)
            if opened:
                return 'break'

    def _open_completions_later(self, *args):
        self._delayed_completion_index = self.text.index('insert')
        if self._delayed_completion_id is not None:
            self.text.after_cancel(self._delayed_completion_id)
        self._delayed_completion_id = self.text.after(self.popupwait, self._delayed_open_completions, *args)
        return

    def _delayed_open_completions(self, *args):
        self._delayed_completion_id = None
        if self.text.index('insert') != self._delayed_completion_index:
            return
        self.open_completions(*args)
        return

    def open_completions(self, evalfuncs, complete, userWantsWin, mode=None):
        """Find the completions and create the AutoCompleteWindow.
        Return True if successful (no syntax error or so found).
        if complete is True, then if there's nothing to complete and no
        start of completion, won't open completions and return False.
        If mode is given, will open a completion list only in this mode.
        """
        if self._delayed_completion_id is not None:
            self.text.after_cancel(self._delayed_completion_id)
            self._delayed_completion_id = None
        hp = HyperParser(self.editwin, 'insert')
        curline = self.text.get('insert linestart', 'insert')
        i = j = len(curline)
        if hp.is_in_string() and (not mode or mode == COMPLETE_FILES):
            self._remove_autocomplete_window()
            mode = COMPLETE_FILES
            while i and curline[i - 1] in FILENAME_CHARS:
                i -= 1

            comp_start = curline[i:j]
            j = i
            while i and curline[i - 1] in FILENAME_CHARS + os.sep:
                i -= 1

            comp_what = curline[i:j]
        elif hp.is_in_code() and (not mode or mode == COMPLETE_ATTRIBUTES):
            self._remove_autocomplete_window()
            mode = COMPLETE_ATTRIBUTES
            while i and curline[i - 1] in ID_CHARS:
                i -= 1

            comp_start = curline[i:j]
            if i and curline[i - 1] == '.':
                hp.set_index('insert-%dc' % (len(curline) - (i - 1)))
                comp_what = hp.get_expression()
                if not comp_what or not evalfuncs and comp_what.find('(') != -1:
                    return
            else:
                comp_what = ''
        else:
            return
        if complete and not comp_what and not comp_start:
            return
        comp_lists = self.fetch_completions(comp_what, mode)
        if not comp_lists[0]:
            return
        self.autocompletewindow = self._make_autocomplete_window()
        self.autocompletewindow.show_window(comp_lists, 'insert-%dc' % len(comp_start), complete, mode, userWantsWin)
        return True

    def fetch_completions(self, what, mode):
        """Return a pair of lists of completions for something. The first list
        is a sublist of the second. Both are sorted.

        If there is a Python subprocess, get the comp. list there.  Otherwise,
        either fetch_completions() is running in the subprocess itself or it
        was called in an IDLE EditorWindow before any script had been run.

        The subprocess environment is that of the most recently run script.  If
        two unrelated modules are being edited some calltips in the current
        module may be inoperative if the module was not the last to run.
        """
        try:
            rpcclt = self.editwin.flist.pyshell.interp.rpcclt
        except:
            rpcclt = None

        if rpcclt:
            return rpcclt.remotecall('exec', 'get_the_completion_list', (
             what, mode), {})
        else:
            if mode == COMPLETE_ATTRIBUTES:
                if what == '':
                    namespace = __main__.__dict__.copy()
                    namespace.update(__main__.__builtins__.__dict__)
                    bigl = eval('dir()', namespace)
                    bigl.sort()
                    if '__all__' in bigl:
                        smalll = eval('__all__', namespace)
                        smalll.sort()
                    else:
                        smalll = filter((lambda s: s[:1] != '_'), bigl)
                else:
                    try:
                        entity = self.get_entity(what)
                        bigl = dir(entity)
                        bigl.sort()
                        if '__all__' in bigl:
                            smalll = entity.__all__
                            smalll.sort()
                        else:
                            smalll = filter((lambda s: s[:1] != '_'), bigl)
                    except:
                        return ([], [])

            elif mode == COMPLETE_FILES:
                if what == '':
                    what = '.'
                try:
                    expandedpath = os.path.expanduser(what)
                    bigl = os.listdir(expandedpath)
                    bigl.sort()
                    smalll = filter((lambda s: s[:1] != '.'), bigl)
                except OSError:
                    return ([], [])

            if not smalll:
                smalll = bigl
            return (
             smalll, bigl)
        return

    def get_entity(self, name):
        """Lookup name in a namespace spanning sys.modules and __main.dict__"""
        namespace = sys.modules.copy()
        namespace.update(__main__.__dict__)
        return eval(name, namespace)