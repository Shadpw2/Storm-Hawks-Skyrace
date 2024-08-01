# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/toaiff.py
# Compiled at: 2008-12-16 09:37:53
"""Convert "arbitrary" sound files to AIFF (Apple and SGI's audio format).

Input may be compressed.
Uncompressed file type may be AIFF, WAV, VOC, 8SVX, NeXT/Sun, and others.
An exception is raised if the file is not of a recognized type.
Returned filename is either the input filename or a temporary filename;
in the latter case the caller must ensure that it is removed.
Other temporary files used are removed by the function.
"""
import os, tempfile, pipes, sndhdr
__all__ = [
 'error', 'toaiff']
table = {}
t = pipes.Template()
t.append('sox -t au - -t aiff -r 8000 -', '--')
table['au'] = t
t = pipes.Template()
t.append('sox -t hcom - -t aiff -r 22050 -', '--')
table['hcom'] = t
t = pipes.Template()
t.append('sox -t voc - -t aiff -r 11025 -', '--')
table['voc'] = t
t = pipes.Template()
t.append('sox -t wav - -t aiff -', '--')
table['wav'] = t
t = pipes.Template()
t.append('sox -t 8svx - -t aiff -r 16000 -', '--')
table['8svx'] = t
t = pipes.Template()
t.append('sox -t sndt - -t aiff -r 16000 -', '--')
table['sndt'] = t
t = pipes.Template()
t.append('sox -t sndr - -t aiff -r 16000 -', '--')
table['sndr'] = t
uncompress = pipes.Template()
uncompress.append('uncompress', '--')

class error(Exception):
    pass


def toaiff(filename):
    temps = []
    ret = None
    try:
        ret = _toaiff(filename, temps)
    finally:
        for temp in temps[:]:
            if temp != ret:
                try:
                    os.unlink(temp)
                except os.error:
                    pass
                else:
                    temps.remove(temp)

    return ret


def _toaiff(filename, temps):
    if filename[-2:] == '.Z':
        (fd, fname) = tempfile.mkstemp()
        os.close(fd)
        temps.append(fname)
        sts = uncompress.copy(filename, fname)
        if sts:
            raise error, filename + ': uncompress failed'
    else:
        fname = filename
    try:
        ftype = sndhdr.whathdr(fname)
        if ftype:
            ftype = ftype[0]
    except IOError, msg:
        if type(msg) == type(()) and len(msg) == 2 and type(msg[0]) == type(0) and type(msg[1]) == type(''):
            msg = msg[1]
        if type(msg) != type(''):
            msg = repr(msg)
        raise error, filename + ': ' + msg

    if ftype == 'aiff':
        return fname
    if ftype is None or ftype not in table:
        raise error, '%s: unsupported audio file type %r' % (filename, ftype)
    (fd, temp) = tempfile.mkstemp()
    os.close(fd)
    temps.append(temp)
    sts = table[ftype].copy(fname, temp)
    if sts:
        raise error, filename + ': conversion to aiff failed'
    return temp