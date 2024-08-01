# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/compiler/syntax.py
# Compiled at: 2008-12-16 09:37:59
"""Check for errs in the AST.

The Python parser does not catch all syntax errors.  Others, like
assignments with invalid targets, are caught in the code generation
phase.

The compiler package catches some errors in the transformer module.
But it seems clearer to write checkers that use the AST to detect
errors.
"""
from compiler import ast, walk

def check(tree, multi=None):
    v = SyntaxErrorChecker(multi)
    walk(tree, v)
    return v.errors


class SyntaxErrorChecker:
    """A visitor to find syntax errors in the AST."""

    def __init__(self, multi=None):
        """Create new visitor object.

        If optional argument multi is not None, then print messages
        for each error rather than raising a SyntaxError for the
        first.
        """
        self.multi = multi
        self.errors = 0

    def error(self, node, msg):
        self.errors = self.errors + 1
        if self.multi is not None:
            print '%s:%s: %s' % (node.filename, node.lineno, msg)
        else:
            raise SyntaxError, '%s (%s:%s)' % (msg, node.filename, node.lineno)
        return

    def visitAssign(self, node):
        pass