# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/xml/etree/ElementPath.py
# Compiled at: 2008-12-16 09:38:23
import re
xpath_tokenizer = re.compile('(::|\\.\\.|\\(\\)|[/.*:\\[\\]\\(\\)@=])|((?:\\{[^}]+\\})?[^/:\\[\\]\\(\\)@=\\s]+)|\\s+').findall

class xpath_descendant_or_self:
    pass


class Path:

    def __init__(self, path):
        tokens = xpath_tokenizer(path)
        self.path = []
        self.tag = None
        if tokens and tokens[0][0] == '/':
            raise SyntaxError('cannot use absolute path on element')
        while tokens:
            (op, tag) = tokens.pop(0)
            if tag or op == '*':
                self.path.append(tag or op)
            elif op == '.':
                pass
            elif op == '/':
                self.path.append(xpath_descendant_or_self())
                continue
            else:
                raise SyntaxError('unsupported path syntax (%s)' % op)
            if tokens:
                (op, tag) = tokens.pop(0)
                if op != '/':
                    raise SyntaxError('expected path separator (%s)' % (op or tag))

        if self.path and isinstance(self.path[-1], xpath_descendant_or_self):
            raise SyntaxError('path cannot end with //')
        if len(self.path) == 1 and isinstance(self.path[0], type('')):
            self.tag = self.path[0]
        return

    def find(self, element):
        tag = self.tag
        if tag is None:
            nodeset = self.findall(element)
            if not nodeset:
                return
            return nodeset[0]
        for elem in element:
            if elem.tag == tag:
                return elem

        return

    def findtext(self, element, default=None):
        tag = self.tag
        if tag is None:
            nodeset = self.findall(element)
            if not nodeset:
                return default
            return nodeset[0].text or ''
        for elem in element:
            if elem.tag == tag:
                return elem.text or ''

        return default

    def findall(self, element):
        nodeset = [
         element]
        index = 0
        while 1:
            try:
                path = self.path[index]
                index = index + 1
            except IndexError:
                return nodeset

            set = []
            if isinstance(path, xpath_descendant_or_self):
                try:
                    tag = self.path[index]
                    if not isinstance(tag, type('')):
                        tag = None
                    else:
                        index = index + 1
                except IndexError:
                    tag = None
                else:
                    for node in nodeset:
                        new = list(node.getiterator(tag))
                        if new and new[0] is node:
                            set.extend(new[1:])
                        else:
                            set.extend(new)

            else:
                for node in nodeset:
                    for node in node:
                        if path == '*' or node.tag == path:
                            set.append(node)

            if not set:
                return []
            nodeset = set

        return


_cache = {}

def _compile(path):
    p = _cache.get(path)
    if p is not None:
        return p
    p = Path(path)
    if len(_cache) >= 100:
        _cache.clear()
    _cache[path] = p
    return p


def find(element, path):
    return _compile(path).find(element)


def findtext(element, path, default=None):
    return _compile(path).findtext(element, default)


def findall(element, path):
    return _compile(path).findall(element)