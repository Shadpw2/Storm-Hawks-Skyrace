# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/doc.py
# Compiled at: 2008-12-16 09:35:38


def _doc_member_func(mf):
    for c in mf.im_class.__mro__:
        x = getattr(c, mf.im_func.func_name, None).__doc__
        if x:
            return x

    return


def _doc_class(c):
    for c2 in c.__mro__:
        x = c2.__doc__
        if x:
            return x


def _process(doc):
    if doc == None:
        return ''
    return ('\n').join((x.strip() for x in doc.split('\n')))


def _firstline(doc):
    return _process(doc).split('\n')[0]


def _doc(x):
    if hasattr(x, 'im_class'):
        return _process(_doc_member_func(x))
    elif hasattr(x, '__mro__'):
        public = tuple(((name, getattr(x, name)) for name in dir(x) if not name.startswith('_')))
        funcs = ('\n').join((mf[0] + ': ' + _firstline(_doc_member_func(mf[1])) for mf in public if hasattr(mf[1], 'im_class')))
        props = ('\n').join((thing[0] + ': ' + _firstline(thing[1].__doc__) for thing in public if not hasattr(thing[1], 'im_class')))
        return ('\n\n').join((_process(_doc_class(x)), 'Try doc(%s.__init__) for constructor arguments.' % x.__name__, 'Methods:', funcs, 'Properties:', props))
    else:
        return process(x.__doc__)


def doc(x, lpp=20):
    print _doc(x)