# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/lib-tk/ScrolledText.py
# Compiled at: 2008-12-16 09:38:20
from Tkinter import *
from Tkinter import _cnfmerge

class ScrolledText(Text):

    def __init__(self, master=None, cnf=None, **kw):
        if cnf is None:
            cnf = {}
        if kw:
            cnf = _cnfmerge((cnf, kw))
        fcnf = {}
        for k in cnf.keys():
            if type(k) == ClassType or k == 'name':
                fcnf[k] = cnf[k]
                del cnf[k]

        self.frame = Frame(master, **fcnf)
        self.vbar = Scrollbar(self.frame, name='vbar')
        self.vbar.pack(side=RIGHT, fill=Y)
        cnf['name'] = 'text'
        Text.__init__(self, self.frame, **cnf)
        self.pack(side=LEFT, fill=BOTH, expand=1)
        self['yscrollcommand'] = self.vbar.set
        self.vbar['command'] = self.yview
        methods = Pack.__dict__.keys()
        methods = methods + Grid.__dict__.keys()
        methods = methods + Place.__dict__.keys()
        for m in methods:
            if m[0] != '_' and m != 'config' and m != 'configure':
                setattr(self, m, getattr(self.frame, m))

        return