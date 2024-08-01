# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/prettyprint.py
# Compiled at: 2008-12-16 09:35:38
LINE_SIZE = 78
TAB_SIZE = 8
FLOAT_DP = 3

class truncated_float(object):
    _format = '%%.%df' % FLOAT_DP

    def __init__(self, aFloat):
        self.value = aFloat

    def __repr__(self):
        return truncated_float._format % self.value

    def __str__(self):
        return truncated_float._format % self.value


def prettyprint_impl(structure, indent, current_key):

    def item(key):
        result = prettyprint_impl(key, indent + '\t', '')
        if isinstance(structure, dict):
            result += ': ' + prettyprint_impl(structure[key], indent + '\t', str(key) + ': ').lstrip()
        return result

    def helper(brackets):
        simple = repr(structure)
        if len(indent * TAB_SIZE + simple + str(current_key)) < LINE_SIZE:
            return indent + simple
        (open, close) = brackets
        data = [ item(x) for x in structure ]
        if brackets == '{}':
            data.sort()
        contents = (',\n').join(data)
        if len(structure) == 1 and isinstance(structure, tuple):
            contents += ','
        return '%(indent)s%(open)s\n%(contents)s\n%(indent)s%(close)s' % locals()

    if isinstance(structure, list):
        return helper('[]')
    elif isinstance(structure, tuple):
        return helper('()')
    elif isinstance(structure, dict):
        return helper('{}')
    else:
        return indent + repr(structure)


def convert(structure):
    if isinstance(structure, float):
        return truncated_float(structure)
    if isinstance(structure, list):
        return [ convert(x) for x in structure ]
    if isinstance(structure, tuple):
        return tuple((convert(x) for x in structure))
    if isinstance(structure, dict):
        return dict(((convert(k), convert(v)) for (k, v) in structure.items()))
    return structure


def prettyprint(structure):
    """Format a data structure with indentation, instead of just dumping things
        out the way that repr() normally does. Does not handle recursive structures."""
    return prettyprint_impl(convert(structure), '', '')