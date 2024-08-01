# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/user.py
# Compiled at: 2008-12-16 09:37:54
"""Hook to allow user-specified customization code to run.

As a policy, Python doesn't run user-specified code on startup of
Python programs (interactive sessions execute the script specified in
the PYTHONSTARTUP environment variable if it exists).

However, some programs or sites may find it convenient to allow users
to have a standard customization file, which gets run when a program
requests it.  This module implements such a mechanism.  A program
that wishes to use the mechanism must execute the statement

    import user

The user module looks for a file .pythonrc.py in the user's home
directory and if it can be opened, execfile()s it in its own global
namespace.  Errors during this phase are not caught; that's up to the
program that imports the user module, if it wishes.

The user's .pythonrc.py could conceivably test for sys.version if it
wishes to do different things depending on the Python version.

"""
import os
home = os.curdir
if 'HOME' in os.environ:
    home = os.environ['HOME']
elif os.name == 'posix':
    home = os.path.expanduser('~/')
elif os.name == 'nt':
    if 'HOMEPATH' in os.environ:
        if 'HOMEDRIVE' in os.environ:
            home = os.environ['HOMEDRIVE'] + os.environ['HOMEPATH']
        else:
            home = os.environ['HOMEPATH']
pythonrc = os.path.join(home, '.pythonrc.py')
try:
    f = open(pythonrc)
except IOError:
    pass
else:
    f.close()
    execfile(pythonrc)