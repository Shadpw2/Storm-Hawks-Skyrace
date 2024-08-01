# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/generate_xml.py
# Compiled at: 2008-12-16 09:35:38
import os

class stream:

    def __init__(self, name):
        self.f = file(name)
        self.count = 0

    def __call__(self):
        assert self.f, 'already closed stream'
        self.count += 1
        result = self.f.readline()
        if result == '':
            self.f.close()
            self.f = None
        return result


def classcontents(input, name):
    line = ''
    result = []
    while not line.startswith('class ' + name):
        line = input()
        assert line != ''

    exposed_args = False
    while True:
        tmp = input()
        if tmp == '':
            break
        tmp = tmp.rstrip()
        level = 0
        while tmp.startswith('\t'):
            level += 1
            tmp = tmp[1:]

        if level == 0 and tmp.startswith('class'):
            break
        tmp = tmp.lstrip()
        if exposed_args:
            if level == 1 and tmp.startswith('):'):
                exposed_args = False
                result.append(tmp)
            else:
                assert level == 2, 'badly formatted function-def'
                result.append(tmp)
        elif level == 1:
            if tmp.startswith('def'):
                if tmp.endswith('('):
                    exposed_args = True
                    result.append(tmp)
            elif tmp.startswith('##'):
                result.append(tmp)

    return result


def grabstuff(folder, name):
    try:
        s = stream(os.path.join(folder, name + '.py'))
    except:
        return []

    try:
        return classcontents(s, name)
    except Exception, why:
        raise why.__class__, str(why) + ' line number: ' + str(s.count)


class XML:

    def __init__(self, name, comment=None, deflate=False, space_elements=False):
        self.name = name
        self.kids = []
        self.comment = comment
        self.deflate = deflate
        self.space_elements = space_elements

    def add(self, kid):
        self.kids.append(kid)

    def add_unique(self, kid):
        if str(kid) not in map(str, self.kids):
            self.kids.append(kid)

    def __str__(self):
        return self.asString(0)

    def stringifyKid(self, kid, level):
        if isinstance(kid, XML):
            return kid.asString(level)
        return '\t' * level + str(kid)

    def asString(self, level):
        kidjoiner = '\n'
        if self.space_elements:
            kidjoiner = '\n\n'
        recurse = kidjoiner.join([ self.stringifyKid(kid, level + 1) for kid in self.kids
                                 ])
        name = self.name
        indent = '\t' * level
        comment = ''
        if self.comment:
            comment = ' <!-- %s -->' % self.comment
        if len(self.kids) == 0:
            if self.deflate:
                return '%(indent)s<%(name)s/>' % locals()
            else:
                return '%(indent)s<%(name)s>\n%(indent)s</%(name)s>' % locals()
        if len(self.kids) == 1 and not isinstance(self.kids[0], XML):
            kid = self.kids[0]
            return '%(indent)s<%(name)s>%(kid)s</%(name)s>%(comment)s' % locals()
        return '%(indent)s<%(name)s>%(comment)s\n%(recurse)s\n%(indent)s</%(name)s>' % locals()


def info(fname):
    b = grabstuff('base', fname)
    base = [ x for x in b if not x.startswith('##') ]
    config = eval(('\n').join([ x[2:].strip() for x in b if x.startswith('##') ]))
    cell = grabstuff('cell', fname)
    client = grabstuff('client', fname)
    output = XML('root', space_elements=True)
    if 'Volatile' in config:
        v = XML('Volatile')
        for item in config['Volatile']:
            v.add(XML(item, deflate=True))

        output.add(v)
    if 'Properties' in config:
        p = XML('Properties')
        for (key, value) in config['Properties'].items():
            node = XML(key)
            for (k2, v2) in value.items():
                if k2 == '':
                    node.comment = v2
                else:
                    n2 = XML(k2)
                    n2.add(v2)
                    node.add(n2)

            p.add(node)

        output.add(p)
    addmethods(output, 'ClientMethods', client)
    addmethods(output, 'CellMethods', cell)
    addmethods(output, 'BaseMethods', base)
    return output


def addmethods(root, type, data):
    m = XML(type)
    parse(m, data)
    root.add(m)


def parse(root, data):
    intag = False
    for line in data:
        if not intag:
            if line.startswith('def'):
                anode = XML(line[4:-1])
                intag = True
        elif line.startswith('):'):
            intag = False
            root.add(anode)
        elif 'self' in line.split('#')[0]:
            if 'exposed' in line or 'caller' in line:
                anode.add(XML('Exposed', deflate=True))
        else:
            assert '#' in line, 'no explanation of type: ' + line
            stuff = line.split('#', 1)[1]
            (type, comment) = ([ x.strip() for x in stuff.split(':') ] + [None])[:2]
            kid = XML('Arg', comment)
            kid.add(type)
            anode.add(kid)

    return


def main():
    from os.path import isfile, join
    catalog = XML('root')
    for x in os.listdir('base'):
        if isfile(join('base', x)) and x.endswith('.py') and x != 'BWPersonality.py':
            x = x[:-3]
            print 'PARSE:', x
            file(join('defs', x + '.def'), 'w').write(str(info(x)))
            catalog.add_unique(XML(x, deflate=True))

    for x in os.listdir('client'):
        path = join('client', x)
        if isfile(path) and x.endswith('.py'):
            for line in file(path):
                if line.startswith('class ') and 'BigWorld.Entity' in line:
                    catalog.add_unique(XML(line.split('(')[0][6:], deflate=True))

    file('entities.xml', 'w').write(str(catalog))


if __name__ == '__main__':
    main()