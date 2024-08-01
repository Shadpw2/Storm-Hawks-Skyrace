# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/token.py
# Compiled at: 2008-12-16 09:37:53
"""Token constants (from "token.h")."""
ENDMARKER = 0
NAME = 1
NUMBER = 2
STRING = 3
NEWLINE = 4
INDENT = 5
DEDENT = 6
LPAR = 7
RPAR = 8
LSQB = 9
RSQB = 10
COLON = 11
COMMA = 12
SEMI = 13
PLUS = 14
MINUS = 15
STAR = 16
SLASH = 17
VBAR = 18
AMPER = 19
LESS = 20
GREATER = 21
EQUAL = 22
DOT = 23
PERCENT = 24
BACKQUOTE = 25
LBRACE = 26
RBRACE = 27
EQEQUAL = 28
NOTEQUAL = 29
LESSEQUAL = 30
GREATEREQUAL = 31
TILDE = 32
CIRCUMFLEX = 33
LEFTSHIFT = 34
RIGHTSHIFT = 35
DOUBLESTAR = 36
PLUSEQUAL = 37
MINEQUAL = 38
STAREQUAL = 39
SLASHEQUAL = 40
PERCENTEQUAL = 41
AMPEREQUAL = 42
VBAREQUAL = 43
CIRCUMFLEXEQUAL = 44
LEFTSHIFTEQUAL = 45
RIGHTSHIFTEQUAL = 46
DOUBLESTAREQUAL = 47
DOUBLESLASH = 48
DOUBLESLASHEQUAL = 49
AT = 50
OP = 51
ERRORTOKEN = 52
N_TOKENS = 53
NT_OFFSET = 256
tok_name = {}
for (_name, _value) in globals().items():
    if type(_value) is type(0):
        tok_name[_value] = _name

def ISTERMINAL(x):
    return x < NT_OFFSET


def ISNONTERMINAL(x):
    return x >= NT_OFFSET


def ISEOF(x):
    return x == ENDMARKER


def main():
    import re, sys
    args = sys.argv[1:]
    inFileName = args and args[0] or 'Include/token.h'
    outFileName = 'Lib/token.py'
    if len(args) > 1:
        outFileName = args[1]
    try:
        fp = open(inFileName)
    except IOError, err:
        sys.stdout.write('I/O error: %s\n' % str(err))
        sys.exit(1)

    lines = fp.read().split('\n')
    fp.close()
    prog = re.compile('#define[ \t][ \t]*([A-Z0-9][A-Z0-9_]*)[ \t][ \t]*([0-9][0-9]*)', re.IGNORECASE)
    tokens = {}
    for line in lines:
        match = prog.match(line)
        if match:
            (name, val) = match.group(1, 2)
            val = int(val)
            tokens[val] = name

    keys = tokens.keys()
    keys.sort()
    try:
        fp = open(outFileName)
    except IOError, err:
        sys.stderr.write('I/O error: %s\n' % str(err))
        sys.exit(2)

    format = fp.read().split('\n')
    fp.close()
    try:
        start = format.index('#--start constants--') + 1
        end = format.index('#--end constants--')
    except ValueError:
        sys.stderr.write('target does not contain format markers')
        sys.exit(3)

    lines = []
    for val in keys:
        lines.append('%s = %d' % (tokens[val], val))

    format[start:end] = lines
    try:
        fp = open(outFileName, 'w')
    except IOError, err:
        sys.stderr.write('I/O error: %s\n' % str(err))
        sys.exit(4)

    fp.write(('\n').join(format))
    fp.close()


if __name__ == '__main__':
    main()