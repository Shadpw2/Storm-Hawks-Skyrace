# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/mimetools.py
# Compiled at: 2008-12-16 09:37:46
"""Various tools used by MIME-reading or MIME-writing programs."""
import os, rfc822, tempfile
__all__ = [
 'Message', 'choose_boundary', 'encode', 'decode', 'copyliteral', 
 'copybinary']

class Message(rfc822.Message):
    """A derived class of rfc822.Message that knows about MIME headers and
    contains some hooks for decoding encoded and multipart messages."""

    def __init__(self, fp, seekable=1):
        rfc822.Message.__init__(self, fp, seekable)
        self.encodingheader = self.getheader('content-transfer-encoding')
        self.typeheader = self.getheader('content-type')
        self.parsetype()
        self.parseplist()

    def parsetype(self):
        str = self.typeheader
        if str is None:
            str = 'text/plain'
        if ';' in str:
            i = str.index(';')
            self.plisttext = str[i:]
            str = str[:i]
        else:
            self.plisttext = ''
        fields = str.split('/')
        for i in range(len(fields)):
            fields[i] = fields[i].strip().lower()

        self.type = ('/').join(fields)
        self.maintype = fields[0]
        self.subtype = ('/').join(fields[1:])
        return

    def parseplist(self):
        str = self.plisttext
        self.plist = []
        while str[:1] == ';':
            str = str[1:]
            if ';' in str:
                end = str.index(';')
            else:
                end = len(str)
            f = str[:end]
            if '=' in f:
                i = f.index('=')
                f = f[:i].strip().lower() + '=' + f[i + 1:].strip()
            self.plist.append(f.strip())
            str = str[end:]

    def getplist(self):
        return self.plist

    def getparam(self, name):
        name = name.lower() + '='
        n = len(name)
        for p in self.plist:
            if p[:n] == name:
                return rfc822.unquote(p[n:])

        return

    def getparamnames(self):
        result = []
        for p in self.plist:
            i = p.find('=')
            if i >= 0:
                result.append(p[:i].lower())

        return result

    def getencoding(self):
        if self.encodingheader is None:
            return '7bit'
        return self.encodingheader.lower()

    def gettype(self):
        return self.type

    def getmaintype(self):
        return self.maintype

    def getsubtype(self):
        return self.subtype


try:
    import thread
except ImportError:
    import dummy_thread as thread

_counter_lock = thread.allocate_lock()
del thread
_counter = 0

def _get_next_counter():
    global _counter
    _counter_lock.acquire()
    _counter += 1
    result = _counter
    _counter_lock.release()
    return result


_prefix = None

def choose_boundary():
    """Return a string usable as a multipart boundary.

    The string chosen is unique within a single program run, and
    incorporates the user id (if available), process id (if available),
    and current time.  So it's very unlikely the returned string appears
    in message text, but there's no guarantee.

    The boundary contains dots so you have to quote it in the header."""
    global _prefix
    import time
    if _prefix is None:
        import socket
        try:
            hostid = socket.gethostbyname(socket.gethostname())
        except socket.gaierror:
            hostid = '127.0.0.1'
        else:
            try:
                uid = repr(os.getuid())
            except AttributeError:
                uid = '1'
            else:
                try:
                    pid = repr(os.getpid())
                except AttributeError:
                    pid = '1'
                else:
                    _prefix = hostid + '.' + uid + '.' + pid
    return '%s.%.3f.%d' % (_prefix, time.time(), _get_next_counter())


def decode(input, output, encoding):
    """Decode common content-transfer-encodings (base64, quopri, uuencode)."""
    if encoding == 'base64':
        import base64
        return base64.decode(input, output)
    if encoding == 'quoted-printable':
        import quopri
        return quopri.decode(input, output)
    if encoding in ('uuencode', 'x-uuencode', 'uue', 'x-uue'):
        import uu
        return uu.decode(input, output)
    if encoding in ('7bit', '8bit'):
        return output.write(input.read())
    if encoding in decodetab:
        pipethrough(input, decodetab[encoding], output)
    else:
        raise ValueError, 'unknown Content-Transfer-Encoding: %s' % encoding


def encode(input, output, encoding):
    """Encode common content-transfer-encodings (base64, quopri, uuencode)."""
    if encoding == 'base64':
        import base64
        return base64.encode(input, output)
    if encoding == 'quoted-printable':
        import quopri
        return quopri.encode(input, output, 0)
    if encoding in ('uuencode', 'x-uuencode', 'uue', 'x-uue'):
        import uu
        return uu.encode(input, output)
    if encoding in ('7bit', '8bit'):
        return output.write(input.read())
    if encoding in encodetab:
        pipethrough(input, encodetab[encoding], output)
    else:
        raise ValueError, 'unknown Content-Transfer-Encoding: %s' % encoding


uudecode_pipe = '(\nTEMP=/tmp/@uu.$$\nsed "s%^begin [0-7][0-7]* .*%begin 600 $TEMP%" | uudecode\ncat $TEMP\nrm $TEMP\n)'
decodetab = {'uuencode': uudecode_pipe, 
   'x-uuencode': uudecode_pipe, 
   'uue': uudecode_pipe, 
   'x-uue': uudecode_pipe, 
   'quoted-printable': 'mmencode -u -q', 
   'base64': 'mmencode -u -b'}
encodetab = {'x-uuencode': 'uuencode tempfile', 
   'uuencode': 'uuencode tempfile', 
   'x-uue': 'uuencode tempfile', 
   'uue': 'uuencode tempfile', 
   'quoted-printable': 'mmencode -q', 
   'base64': 'mmencode -b'}

def pipeto(input, command):
    pipe = os.popen(command, 'w')
    copyliteral(input, pipe)
    pipe.close()


def pipethrough(input, command, output):
    (fd, tempname) = tempfile.mkstemp()
    temp = os.fdopen(fd, 'w')
    copyliteral(input, temp)
    temp.close()
    pipe = os.popen(command + ' <' + tempname, 'r')
    copybinary(pipe, output)
    pipe.close()
    os.unlink(tempname)


def copyliteral(input, output):
    while 1:
        line = input.readline()
        if not line:
            break
        output.write(line)


def copybinary(input, output):
    BUFSIZE = 8192
    while 1:
        line = input.read(BUFSIZE)
        if not line:
            break
        output.write(line)