# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/os2emxpath.py
# Compiled at: 2008-12-16 09:37:47
"""Common pathname manipulations, OS/2 EMX version.

Instead of importing this module directly, import os and refer to this
module as os.path.
"""
import os, stat
__all__ = [
 'normcase', 'isabs', 'join', 'splitdrive', 'split', 'splitext', 
 'basename', 
 'dirname', 'commonprefix', 'getsize', 'getmtime', 
 'getatime', 'getctime', 
 'islink', 'exists', 'lexists', 'isdir', 'isfile', 
 'ismount', 'walk', 
 'expanduser', 'expandvars', 'normpath', 'abspath', 
 'splitunc', 'curdir', 
 'pardir', 'sep', 'pathsep', 'defpath', 'altsep', 
 'extsep', 'devnull', 
 'realpath', 'supports_unicode_filenames']
curdir = '.'
pardir = '..'
extsep = '.'
sep = '/'
altsep = '\\'
pathsep = ';'
defpath = '.;C:\\bin'
devnull = 'nul'

def normcase(s):
    """Normalize case of pathname.

    Makes all characters lowercase and all altseps into seps."""
    return s.replace('\\', '/').lower()


def isabs(s):
    """Test whether a path is absolute"""
    s = splitdrive(s)[1]
    return s != '' and s[:1] in '/\\'


def join(a, *p):
    """Join two or more pathname components, inserting sep as needed"""
    path = a
    for b in p:
        if isabs(b):
            path = b
        elif path == '' or path[-1:] in '/\\:':
            path = path + b
        else:
            path = path + '/' + b

    return path


def splitdrive(p):
    """Split a pathname into drive and path specifiers. Returns a 2-tuple
"(drive,path)";  either part may be empty"""
    if p[1:2] == ':':
        return (
         p[0:2], p[2:])
    return (
     '', p)


def splitunc(p):
    """Split a pathname into UNC mount point and relative path specifiers.

    Return a 2-tuple (unc, rest); either part may be empty.
    If unc is not empty, it has the form '//host/mount' (or similar
    using backslashes).  unc+rest is always the input path.
    Paths containing drive letters never have an UNC part.
    """
    if p[1:2] == ':':
        return (
         '', p)
    firstTwo = p[0:2]
    if firstTwo == '//' or firstTwo == '\\\\':
        normp = normcase(p)
        index = normp.find('/', 2)
        if index == -1:
            return ('', p)
        index = normp.find('/', index + 1)
        if index == -1:
            index = len(p)
        return (
         p[:index], p[index:])
    return (
     '', p)


def split(p):
    """Split a pathname.

    Return tuple (head, tail) where tail is everything after the final slash.
    Either part may be empty."""
    (d, p) = splitdrive(p)
    i = len(p)
    while i and p[i - 1] not in '/\\':
        i = i - 1

    head, tail = p[:i], p[i:]
    head2 = head
    while head2 and head2[-1] in '/\\':
        head2 = head2[:-1]

    head = head2 or head
    return (d + head, tail)


def splitext(p):
    """Split the extension from a pathname.

    Extension is everything from the last dot to the end.
    Return (root, ext), either part may be empty."""
    (root, ext) = ('', '')
    for c in p:
        if c in ('/', '\\'):
            root, ext = root + ext + c, ''
        elif c == '.':
            if ext:
                root, ext = root + ext, c
            else:
                ext = c
        elif ext:
            ext = ext + c
        else:
            root = root + c

    return (
     root, ext)


def basename(p):
    """Returns the final component of a pathname"""
    return split(p)[1]


def dirname(p):
    """Returns the directory component of a pathname"""
    return split(p)[0]


def commonprefix(m):
    """Given a list of pathnames, returns the longest common leading component"""
    if not m:
        return ''
    s1 = min(m)
    s2 = max(m)
    n = min(len(s1), len(s2))
    for i in xrange(n):
        if s1[i] != s2[i]:
            return s1[:i]

    return s1[:n]


def getsize(filename):
    """Return the size of a file, reported by os.stat()"""
    return os.stat(filename).st_size


def getmtime(filename):
    """Return the last modification time of a file, reported by os.stat()"""
    return os.stat(filename).st_mtime


def getatime(filename):
    """Return the last access time of a file, reported by os.stat()"""
    return os.stat(filename).st_atime


def getctime(filename):
    """Return the creation time of a file, reported by os.stat()."""
    return os.stat(filename).st_ctime


def islink(path):
    """Test for symbolic link.  On OS/2 always returns false"""
    return False


def exists(path):
    """Test whether a path exists"""
    try:
        st = os.stat(path)
    except os.error:
        return False

    return True


lexists = exists

def isdir(path):
    """Test whether a path is a directory"""
    try:
        st = os.stat(path)
    except os.error:
        return False

    return stat.S_ISDIR(st.st_mode)


def isfile(path):
    """Test whether a path is a regular file"""
    try:
        st = os.stat(path)
    except os.error:
        return False

    return stat.S_ISREG(st.st_mode)


def ismount(path):
    """Test whether a path is a mount point (defined as root of drive)"""
    (unc, rest) = splitunc(path)
    if unc:
        return rest in ('', '/', '\\')
    p = splitdrive(path)[1]
    return len(p) == 1 and p[0] in '/\\'


def walk(top, func, arg):
    """Directory tree walk whth callback function.

    walk(top, func, arg) calls func(arg, d, files) for each directory d
    in the tree rooted at top (including top itself); files is a list
    of all the files and subdirs in directory d."""
    try:
        names = os.listdir(top)
    except os.error:
        return

    func(arg, top, names)
    exceptions = ('.', '..')
    for name in names:
        if name not in exceptions:
            name = join(top, name)
            if isdir(name):
                walk(name, func, arg)


def expanduser(path):
    """Expand ~ and ~user constructs.

    If user or $HOME is unknown, do nothing."""
    if path[:1] != '~':
        return path
    i, n = 1, len(path)
    while i < n and path[i] not in '/\\':
        i = i + 1

    if i == 1:
        if 'HOME' in os.environ:
            userhome = os.environ['HOME']
        elif 'HOMEPATH' not in os.environ:
            return path
        else:
            try:
                drive = os.environ['HOMEDRIVE']
            except KeyError:
                drive = ''
            else:
                userhome = join(drive, os.environ['HOMEPATH'])
    else:
        return path
    return userhome + path[i:]


def expandvars(path):
    """Expand shell variables of form $var and ${var}.

    Unknown variables are left unchanged."""
    if '$' not in path:
        return path
    import string
    varchars = string.letters + string.digits + '_-'
    res = ''
    index = 0
    pathlen = len(path)
    while index < pathlen:
        c = path[index]
        if c == "'":
            path = path[index + 1:]
            pathlen = len(path)
            try:
                index = path.index("'")
                res = res + "'" + path[:index + 1]
            except ValueError:
                res = res + path
                index = pathlen - 1

        elif c == '$':
            if path[index + 1:index + 2] == '$':
                res = res + c
                index = index + 1
            elif path[index + 1:index + 2] == '{':
                path = path[index + 2:]
                pathlen = len(path)
                try:
                    index = path.index('}')
                    var = path[:index]
                    if var in os.environ:
                        res = res + os.environ[var]
                except ValueError:
                    res = res + path
                    index = pathlen - 1

            else:
                var = ''
                index = index + 1
                c = path[index:index + 1]
                while c != '' and c in varchars:
                    var = var + c
                    index = index + 1
                    c = path[index:index + 1]

                if var in os.environ:
                    res = res + os.environ[var]
                if c != '':
                    res = res + c
        else:
            res = res + c
        index = index + 1

    return res


def normpath(path):
    """Normalize path, eliminating double slashes, etc."""
    path = path.replace('\\', '/')
    (prefix, path) = splitdrive(path)
    while path[:1] == '/':
        prefix = prefix + '/'
        path = path[1:]

    comps = path.split('/')
    i = 0
    while i < len(comps):
        if comps[i] == '.':
            del comps[i]
        elif comps[i] == '..' and i > 0 and comps[i - 1] not in ('', '..'):
            del comps[i - 1:i + 1]
            i = i - 1
        elif comps[i] == '' and i > 0 and comps[i - 1] != '':
            del comps[i]
        else:
            i = i + 1

    if not prefix and not comps:
        comps.append('.')
    return prefix + ('/').join(comps)


def abspath(path):
    """Return the absolute version of a path"""
    if not isabs(path):
        path = join(os.getcwd(), path)
    return normpath(path)


realpath = abspath
supports_unicode_filenames = False