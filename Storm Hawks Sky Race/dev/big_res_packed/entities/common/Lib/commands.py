# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/commands.py
# Compiled at: 2008-12-16 09:37:42
"""Execute shell commands via os.popen() and return status, output.

Interface summary:

       import commands

       outtext = commands.getoutput(cmd)
       (exitstatus, outtext) = commands.getstatusoutput(cmd)
       outtext = commands.getstatus(file)  # returns output of "ls -ld file"

A trailing newline is removed from the output string.

Encapsulates the basic operation:

      pipe = os.popen('{ ' + cmd + '; } 2>&1', 'r')
      text = pipe.read()
      sts = pipe.close()

 [Note:  it would be nice to add functions to interpret the exit status.]
"""
__all__ = [
 'getstatusoutput', 'getoutput', 'getstatus']

def getstatus(file):
    """Return output of "ls -ld <file>" in a string."""
    return getoutput('ls -ld' + mkarg(file))


def getoutput(cmd):
    """Return output (stdout or stderr) of executing cmd in a shell."""
    return getstatusoutput(cmd)[1]


def getstatusoutput(cmd):
    """Return (status, output) of executing cmd in a shell."""
    import os
    pipe = os.popen('{ ' + cmd + '; } 2>&1', 'r')
    text = pipe.read()
    sts = pipe.close()
    if sts is None:
        sts = 0
    if text[-1:] == '\n':
        text = text[:-1]
    return (
     sts, text)


def mk2arg(head, x):
    import os
    return mkarg(os.path.join(head, x))


def mkarg(x):
    if "'" not in x:
        return " '" + x + "'"
    s = ' "'
    for c in x:
        if c in '\\$"`':
            s = s + '\\'
        s = s + c

    s = s + '"'
    return s