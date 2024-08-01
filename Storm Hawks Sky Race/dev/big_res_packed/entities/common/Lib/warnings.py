# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/warnings.py
# Compiled at: 2008-12-16 09:37:54
"""Python part of the warnings subsystem."""
import sys, types, linecache
__all__ = [
 'warn', 'showwarning', 'formatwarning', 'filterwarnings', 
 'resetwarnings']
filters = []
defaultaction = 'default'
onceregistry = {}

def warn(message, category=None, stacklevel=1):
    """Issue a warning, or maybe ignore it or raise an exception."""
    if isinstance(message, Warning):
        category = message.__class__
    if category is None:
        category = UserWarning
    assert issubclass(category, Warning)
    try:
        caller = sys._getframe(stacklevel)
    except ValueError:
        globals = sys.__dict__
        lineno = 1
    else:
        globals = caller.f_globals
        lineno = caller.f_lineno

    if '__name__' in globals:
        module = globals['__name__']
    else:
        module = '<string>'
    filename = globals.get('__file__')
    if filename:
        fnl = filename.lower()
        if fnl.endswith(('.pyc', '.pyo')):
            filename = filename[:-1]
    else:
        if module == '__main__':
            try:
                filename = sys.argv[0]
            except AttributeError:
                filename = '__main__'

        if not filename:
            filename = module
    registry = globals.setdefault('__warningregistry__', {})
    warn_explicit(message, category, filename, lineno, module, registry, globals)
    return


def warn_explicit(message, category, filename, lineno, module=None, registry=None, module_globals=None):
    if module is None:
        module = filename or '<unknown>'
        if module[-3:].lower() == '.py':
            module = module[:-3]
    if registry is None:
        registry = {}
    if isinstance(message, Warning):
        text = str(message)
        category = message.__class__
    else:
        text = message
        message = category(message)
    key = (
     text, category, lineno)
    if registry.get(key):
        return
    for item in filters:
        (action, msg, cat, mod, ln) = item
        if (msg is None or msg.match(text)) and issubclass(category, cat) and (mod is None or mod.match(module)) and (ln == 0 or lineno == ln):
            break
    else:
        action = defaultaction

    if action == 'ignore':
        registry[key] = 1
        return
    linecache.getlines(filename, module_globals)
    if action == 'error':
        raise message
    if action == 'once':
        registry[key] = 1
        oncekey = (text, category)
        if onceregistry.get(oncekey):
            return
        onceregistry[oncekey] = 1
    elif action == 'always':
        pass
    elif action == 'module':
        registry[key] = 1
        altkey = (text, category, 0)
        if registry.get(altkey):
            return
        registry[altkey] = 1
    elif action == 'default':
        registry[key] = 1
    else:
        raise RuntimeError('Unrecognized action (%r) in warnings.filters:\n %s' % (
         action, item))
    showwarning(message, category, filename, lineno)
    return


def showwarning(message, category, filename, lineno, file=None):
    """Hook to write a warning to a file; replace if you like."""
    if file is None:
        file = sys.stderr
    try:
        file.write(formatwarning(message, category, filename, lineno))
    except IOError:
        pass

    return


def formatwarning(message, category, filename, lineno):
    """Function to format a warning the standard way."""
    s = '%s:%s: %s: %s\n' % (filename, lineno, category.__name__, message)
    line = linecache.getline(filename, lineno).strip()
    if line:
        s = s + '  ' + line + '\n'
    return s


def filterwarnings(action, message='', category=Warning, module='', lineno=0, append=0):
    """Insert an entry into the list of warnings filters (at the front).

    Use assertions to check that all arguments have the right type."""
    import re
    assert action in ('error', 'ignore', 'always', 'default', 'module', 'once'), 'invalid action: %r' % (action,)
    assert isinstance(message, basestring), 'message must be a string'
    assert isinstance(category, (type, types.ClassType)), 'category must be a class'
    assert issubclass(category, Warning), 'category must be a Warning subclass'
    assert isinstance(module, basestring), 'module must be a string'
    assert isinstance(lineno, int) and lineno >= 0, 'lineno must be an int >= 0'
    item = (action, re.compile(message, re.I), category,
     re.compile(module), lineno)
    if append:
        filters.append(item)
    else:
        filters.insert(0, item)


def simplefilter(action, category=Warning, lineno=0, append=0):
    """Insert a simple entry into the list of warnings filters (at the front).

    A simple filter matches all modules and messages.
    """
    assert action in ('error', 'ignore', 'always', 'default', 'module', 'once'), 'invalid action: %r' % (action,)
    assert isinstance(lineno, int) and lineno >= 0, 'lineno must be an int >= 0'
    item = (action, None, category, None, lineno)
    if append:
        filters.append(item)
    else:
        filters.insert(0, item)
    return


def resetwarnings():
    """Clear the list of warning filters, so that no filters are active."""
    filters[:] = []


class _OptionError(Exception):
    """Exception used by option processing helpers."""
    pass


def _processoptions(args):
    for arg in args:
        try:
            _setoption(arg)
        except _OptionError, msg:
            print >> sys.stderr, 'Invalid -W option ignored:', msg


def _setoption(arg):
    import re
    parts = arg.split(':')
    if len(parts) > 5:
        raise _OptionError('too many fields (max 5): %r' % (arg,))
    while len(parts) < 5:
        parts.append('')

    (action, message, category, module, lineno) = [ s.strip() for s in parts ]
    action = _getaction(action)
    message = re.escape(message)
    category = _getcategory(category)
    module = re.escape(module)
    if module:
        module = module + '$'
    if lineno:
        try:
            lineno = int(lineno)
            if lineno < 0:
                raise ValueError
        except (ValueError, OverflowError):
            raise _OptionError('invalid lineno %r' % (lineno,))

    else:
        lineno = 0
    filterwarnings(action, message, category, module, lineno)


def _getaction(action):
    if not action:
        return 'default'
    if action == 'all':
        return 'always'
    for a in ('default', 'always', 'ignore', 'module', 'once', 'error'):
        if a.startswith(action):
            return a

    raise _OptionError('invalid action: %r' % (action,))


def _getcategory(category):
    import re
    if not category:
        return Warning
    if re.match('^[a-zA-Z0-9_]+$', category):
        try:
            cat = eval(category)
        except NameError:
            raise _OptionError('unknown warning category: %r' % (category,))

    else:
        i = category.rfind('.')
        module = category[:i]
        klass = category[i + 1:]
        try:
            m = __import__(module, None, None, [klass])
        except ImportError:
            raise _OptionError('invalid module name: %r' % (module,))

        try:
            cat = getattr(m, klass)
        except AttributeError:
            raise _OptionError('unknown warning category: %r' % (category,))

    if not issubclass(cat, Warning):
        raise _OptionError('invalid warning category: %r' % (category,))
    return cat


_processoptions(sys.warnoptions)
simplefilter('ignore', category=PendingDeprecationWarning, append=1)
simplefilter('ignore', category=ImportWarning, append=1)