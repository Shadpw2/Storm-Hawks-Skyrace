# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/getpass.py
# Compiled at: 2008-12-16 09:37:44
"""Utilities to get a password and/or the current user name.

getpass(prompt) - prompt for a password, with echo turned off
getuser() - get the user name from the environment or password database

On Windows, the msvcrt module will be used.
On the Mac EasyDialogs.AskPassword is used, if available.

"""
import sys
__all__ = [
 'getpass', 'getuser']

def unix_getpass(prompt='Password: ', stream=None):
    """Prompt for a password, with echo turned off.
    The prompt is written on stream, by default stdout.

    Restore terminal settings at end.
    """
    if stream is None:
        stream = sys.stdout
    try:
        fd = sys.stdin.fileno()
    except:
        return default_getpass(prompt)

    old = termios.tcgetattr(fd)
    new = old[:]
    new[3] = new[3] & ~termios.ECHO
    try:
        termios.tcsetattr(fd, termios.TCSADRAIN, new)
        passwd = _raw_input(prompt, stream)
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

    stream.write('\n')
    return passwd


def win_getpass(prompt='Password: ', stream=None):
    """Prompt for password with echo off, using Windows getch()."""
    if sys.stdin is not sys.__stdin__:
        return default_getpass(prompt, stream)
    import msvcrt
    for c in prompt:
        msvcrt.putch(c)

    pw = ''
    while 1:
        c = msvcrt.getch()
        if c == '\r' or c == '\n':
            break
        if c == '\x03':
            raise KeyboardInterrupt
        if c == '\x08':
            pw = pw[:-1]
        else:
            pw = pw + c

    msvcrt.putch('\r')
    msvcrt.putch('\n')
    return pw


def default_getpass(prompt='Password: ', stream=None):
    print >> sys.stderr, 'Warning: Problem with getpass. Passwords may be echoed.'
    return _raw_input(prompt, stream)


def _raw_input(prompt='', stream=None):
    if stream is None:
        stream = sys.stdout
    prompt = str(prompt)
    if prompt:
        stream.write(prompt)
    line = sys.stdin.readline()
    if not line:
        raise EOFError
    if line[-1] == '\n':
        line = line[:-1]
    return line


def getuser():
    """Get the username from the environment or password database.

    First try various environment variables, then the password
    database.  This works on Windows as long as USERNAME is set.

    """
    import os
    for name in ('LOGNAME', 'USER', 'LNAME', 'USERNAME'):
        user = os.environ.get(name)
        if user:
            return user

    import pwd
    return pwd.getpwuid(os.getuid())[0]


try:
    import termios
    (
     termios.tcgetattr, termios.tcsetattr)
except (ImportError, AttributeError):
    try:
        import msvcrt
    except ImportError:
        try:
            from EasyDialogs import AskPassword
        except ImportError:
            getpass = default_getpass
        else:
            getpass = AskPassword
    else:
        getpass = win_getpass
else:
    getpass = unix_getpass