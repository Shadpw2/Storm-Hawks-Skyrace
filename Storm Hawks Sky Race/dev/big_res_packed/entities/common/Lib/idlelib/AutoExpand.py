# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/idlelib/AutoExpand.py
# Compiled at: 2008-12-16 09:38:16
import string, re

class AutoExpand:
    menudefs = [
     (
      'edit',
      [
       ('E_xpand Word', '<<expand-word>>')])]
    wordchars = string.ascii_letters + string.digits + '_'

    def __init__(self, editwin):
        self.text = editwin.text
        self.state = None
        return

    def expand_word_event(self, event):
        curinsert = self.text.index('insert')
        curline = self.text.get('insert linestart', 'insert lineend')
        if not self.state:
            words = self.getwords()
            index = 0
        else:
            (words, index, insert, line) = self.state
            if insert != curinsert or line != curline:
                words = self.getwords()
                index = 0
        if not words:
            self.text.bell()
            return 'break'
        word = self.getprevword()
        self.text.delete('insert - %d chars' % len(word), 'insert')
        newword = words[index]
        index = (index + 1) % len(words)
        if index == 0:
            self.text.bell()
        self.text.insert('insert', newword)
        curinsert = self.text.index('insert')
        curline = self.text.get('insert linestart', 'insert lineend')
        self.state = (words, index, curinsert, curline)
        return 'break'

    def getwords(self):
        word = self.getprevword()
        if not word:
            return []
        before = self.text.get('1.0', 'insert wordstart')
        wbefore = re.findall('\\b' + word + '\\w+\\b', before)
        del before
        after = self.text.get('insert wordend', 'end')
        wafter = re.findall('\\b' + word + '\\w+\\b', after)
        del after
        if not wbefore and not wafter:
            return []
        words = []
        dict = {}
        wbefore.reverse()
        for w in wbefore:
            if dict.get(w):
                continue
            words.append(w)
            dict[w] = w

        for w in wafter:
            if dict.get(w):
                continue
            words.append(w)
            dict[w] = w

        words.append(word)
        return words

    def getprevword(self):
        line = self.text.get('insert linestart', 'insert')
        i = len(line)
        while i > 0 and line[i - 1] in self.wordchars:
            i = i - 1

        return line[i:]