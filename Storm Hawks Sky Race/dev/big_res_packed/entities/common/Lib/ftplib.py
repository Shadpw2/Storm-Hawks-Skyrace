# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ftplib.py
# Compiled at: 2008-12-16 09:37:44
"""An FTP client class and some helper functions.

Based on RFC 959: File Transfer Protocol (FTP), by J. Postel and J. Reynolds

Example:

>>> from ftplib import FTP
>>> ftp = FTP('ftp.python.org') # connect to host, default port
>>> ftp.login() # default, i.e.: user anonymous, passwd anonymous@
'230 Guest login ok, access restrictions apply.'
>>> ftp.retrlines('LIST') # list directory contents
total 9
drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 .
drwxr-xr-x   8 root     wheel        1024 Jan  3  1994 ..
drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 bin
drwxr-xr-x   2 root     wheel        1024 Jan  3  1994 etc
d-wxrwxr-x   2 ftp      wheel        1024 Sep  5 13:43 incoming
drwxr-xr-x   2 root     wheel        1024 Nov 17  1993 lib
drwxr-xr-x   6 1094     wheel        1024 Sep 13 19:07 pub
drwxr-xr-x   3 root     wheel        1024 Jan  3  1994 usr
-rw-r--r--   1 root     root          312 Aug  1  1994 welcome.msg
'226 Transfer complete.'
>>> ftp.quit()
'221 Goodbye.'
>>>

A nice test that reveals some of the network dialogue would be:
python ftplib.py -d localhost -l -p -l
"""
import os, sys
try:
    import SOCKS
    socket = SOCKS
    del SOCKS
    from socket import getfqdn
    socket.getfqdn = getfqdn
    del getfqdn
except ImportError:
    import socket

__all__ = [
 'FTP', 'Netrc']
MSG_OOB = 1
FTP_PORT = 21

class Error(Exception):
    pass


class error_reply(Error):
    pass


class error_temp(Error):
    pass


class error_perm(Error):
    pass


class error_proto(Error):
    pass


all_errors = (
 Error, socket.error, IOError, EOFError)
CRLF = '\r\n'

class FTP():
    """An FTP client class.

    To create a connection, call the class using these argument:
            host, user, passwd, acct
    These are all strings, and have default value ''.
    Then use self.connect() with optional host and port argument.

    To download a file, use ftp.retrlines('RETR ' + filename),
    or ftp.retrbinary() with slightly different arguments.
    To upload a file, use ftp.storlines() or ftp.storbinary(),
    which have an open file as argument (see their definitions
    below for details).
    The download/upload functions first issue appropriate TYPE
    and PORT or PASV commands.
"""
    debugging = 0
    host = ''
    port = FTP_PORT
    sock = None
    file = None
    welcome = None
    passiveserver = 1

    def __init__(self, host='', user='', passwd='', acct=''):
        if host:
            self.connect(host)
            if user:
                self.login(user, passwd, acct)

    def connect(self, host='', port=0):
        """Connect to host.  Arguments are:
        - host: hostname to connect to (string, default previous host)
        - port: port to connect to (integer, default previous port)"""
        if host:
            self.host = host
        if port:
            self.port = port
        msg = 'getaddrinfo returns an empty list'
        for res in socket.getaddrinfo(self.host, self.port, 0, socket.SOCK_STREAM):
            (af, socktype, proto, canonname, sa) = res
            try:
                self.sock = socket.socket(af, socktype, proto)
                self.sock.connect(sa)
            except socket.error, msg:
                if self.sock:
                    self.sock.close()
                self.sock = None
                continue

            break

        if not self.sock:
            raise socket.error, msg
        self.af = af
        self.file = self.sock.makefile('rb')
        self.welcome = self.getresp()
        return self.welcome

    def getwelcome(self):
        """Get the welcome message from the server.
        (this is read and squirreled away by connect())"""
        if self.debugging:
            print '*welcome*', self.sanitize(self.welcome)
        return self.welcome

    def set_debuglevel(self, level):
        """Set the debugging level.
        The required argument level means:
        0: no debugging output (default)
        1: print commands and responses but not body text etc.
        2: also print raw lines read and sent before stripping CR/LF"""
        self.debugging = level

    debug = set_debuglevel

    def set_pasv(self, val):
        """Use passive or active mode for data transfers.
        With a false argument, use the normal PORT mode,
        With a true argument, use the PASV command."""
        self.passiveserver = val

    def sanitize(self, s):
        if s[:5] == 'pass ' or s[:5] == 'PASS ':
            i = len(s)
            while i > 5 and s[i - 1] in '\r\n':
                i = i - 1

            s = s[:5] + '*' * (i - 5) + s[i:]
        return repr(s)

    def putline(self, line):
        line = line + CRLF
        if self.debugging > 1:
            print '*put*', self.sanitize(line)
        self.sock.sendall(line)

    def putcmd(self, line):
        if self.debugging:
            print '*cmd*', self.sanitize(line)
        self.putline(line)

    def getline(self):
        line = self.file.readline()
        if self.debugging > 1:
            print '*get*', self.sanitize(line)
        if not line:
            raise EOFError
        if line[-2:] == CRLF:
            line = line[:-2]
        elif line[-1:] in CRLF:
            line = line[:-1]
        return line

    def getmultiline(self):
        line = self.getline()
        if line[3:4] == '-':
            code = line[:3]
            while 1:
                nextline = self.getline()
                line = line + ('\n' + nextline)
                if nextline[:3] == code and nextline[3:4] != '-':
                    break

        return line

    def getresp(self):
        resp = self.getmultiline()
        if self.debugging:
            print '*resp*', self.sanitize(resp)
        self.lastresp = resp[:3]
        c = resp[:1]
        if c in ('1', '2', '3'):
            return resp
        if c == '4':
            raise error_temp, resp
        if c == '5':
            raise error_perm, resp
        raise error_proto, resp

    def voidresp(self):
        """Expect a response beginning with '2'."""
        resp = self.getresp()
        if resp[0] != '2':
            raise error_reply, resp
        return resp

    def abort(self):
        """Abort a file transfer.  Uses out-of-band data.
        This does not follow the procedure from the RFC to send Telnet
        IP and Synch; that doesn't seem to work with the servers I've
        tried.  Instead, just send the ABOR command as OOB data."""
        line = 'ABOR' + CRLF
        if self.debugging > 1:
            print '*put urgent*', self.sanitize(line)
        self.sock.sendall(line, MSG_OOB)
        resp = self.getmultiline()
        if resp[:3] not in ('426', '226'):
            raise error_proto, resp

    def sendcmd(self, cmd):
        """Send a command and return the response."""
        self.putcmd(cmd)
        return self.getresp()

    def voidcmd(self, cmd):
        """Send a command and expect a response beginning with '2'."""
        self.putcmd(cmd)
        return self.voidresp()

    def sendport(self, host, port):
        """Send a PORT command with the current host and the given
        port number.
        """
        hbytes = host.split('.')
        pbytes = [repr(port / 256), repr(port % 256)]
        bytes = hbytes + pbytes
        cmd = 'PORT ' + (',').join(bytes)
        return self.voidcmd(cmd)

    def sendeprt(self, host, port):
        """Send a EPRT command with the current host and the given port number."""
        af = 0
        if self.af == socket.AF_INET:
            af = 1
        if self.af == socket.AF_INET6:
            af = 2
        if af == 0:
            raise error_proto, 'unsupported address family'
        fields = [
         '', repr(af), host, repr(port), '']
        cmd = 'EPRT ' + ('|').join(fields)
        return self.voidcmd(cmd)

    def makeport(self):
        """Create a new socket and send a PORT command for it."""
        msg = 'getaddrinfo returns an empty list'
        sock = None
        for res in socket.getaddrinfo(None, 0, self.af, socket.SOCK_STREAM, 0, socket.AI_PASSIVE):
            (af, socktype, proto, canonname, sa) = res
            try:
                sock = socket.socket(af, socktype, proto)
                sock.bind(sa)
            except socket.error, msg:
                if sock:
                    sock.close()
                sock = None
                continue

            break

        if not sock:
            raise socket.error, msg
        sock.listen(1)
        port = sock.getsockname()[1]
        host = self.sock.getsockname()[0]
        if self.af == socket.AF_INET:
            resp = self.sendport(host, port)
        else:
            resp = self.sendeprt(host, port)
        return sock

    def makepasv(self):
        if self.af == socket.AF_INET:
            (host, port) = parse227(self.sendcmd('PASV'))
        else:
            (host, port) = parse229(self.sendcmd('EPSV'), self.sock.getpeername())
        return (
         host, port)

    def ntransfercmd(self, cmd, rest=None):
        """Initiate a transfer over the data connection.

        If the transfer is active, send a port command and the
        transfer command, and accept the connection.  If the server is
        passive, send a pasv command, connect to it, and start the
        transfer command.  Either way, return the socket for the
        connection and the expected size of the transfer.  The
        expected size may be None if it could not be determined.

        Optional `rest' argument can be a string that is sent as the
        argument to a RESTART command.  This is essentially a server
        marker used to tell the server to skip over any data up to the
        given marker.
        """
        size = None
        if self.passiveserver:
            (host, port) = self.makepasv()
            (af, socktype, proto, canon, sa) = socket.getaddrinfo(host, port, 0, socket.SOCK_STREAM)[0]
            conn = socket.socket(af, socktype, proto)
            conn.connect(sa)
            if rest is not None:
                self.sendcmd('REST %s' % rest)
            resp = self.sendcmd(cmd)
            if resp[0] == '2':
                resp = self.getresp()
            if resp[0] != '1':
                raise error_reply, resp
        else:
            sock = self.makeport()
            if rest is not None:
                self.sendcmd('REST %s' % rest)
            resp = self.sendcmd(cmd)
            if resp[0] == '2':
                resp = self.getresp()
            if resp[0] != '1':
                raise error_reply, resp
            (conn, sockaddr) = sock.accept()
        if resp[:3] == '150':
            size = parse150(resp)
        return (
         conn, size)

    def transfercmd(self, cmd, rest=None):
        """Like ntransfercmd() but returns only the socket."""
        return self.ntransfercmd(cmd, rest)[0]

    def login(self, user='', passwd='', acct=''):
        """Login, default anonymous."""
        if not user:
            user = 'anonymous'
        if not passwd:
            passwd = ''
        if not acct:
            acct = ''
        if user == 'anonymous' and passwd in ('', '-'):
            passwd = passwd + 'anonymous@'
        resp = self.sendcmd('USER ' + user)
        if resp[0] == '3':
            resp = self.sendcmd('PASS ' + passwd)
        if resp[0] == '3':
            resp = self.sendcmd('ACCT ' + acct)
        if resp[0] != '2':
            raise error_reply, resp
        return resp

    def retrbinary(self, cmd, callback, blocksize=8192, rest=None):
        """Retrieve data in binary mode.

        `cmd' is a RETR command.  `callback' is a callback function is
        called for each block.  No more than `blocksize' number of
        bytes will be read from the socket.  Optional `rest' is passed
        to transfercmd().

        A new port is created for you.  Return the response code.
        """
        self.voidcmd('TYPE I')
        conn = self.transfercmd(cmd, rest)
        while 1:
            data = conn.recv(blocksize)
            if not data:
                break
            callback(data)

        conn.close()
        return self.voidresp()

    def retrlines(self, cmd, callback=None):
        """Retrieve data in line mode.
        The argument is a RETR or LIST command.
        The callback function (2nd argument) is called for each line,
        with trailing CRLF stripped.  This creates a new port for you.
        print_line() is the default callback."""
        if callback is None:
            callback = print_line
        resp = self.sendcmd('TYPE A')
        conn = self.transfercmd(cmd)
        fp = conn.makefile('rb')
        while 1:
            line = fp.readline()
            if self.debugging > 2:
                print '*retr*', repr(line)
            if not line:
                break
            if line[-2:] == CRLF:
                line = line[:-2]
            elif line[-1:] == '\n':
                line = line[:-1]
            callback(line)

        fp.close()
        conn.close()
        return self.voidresp()

    def storbinary(self, cmd, fp, blocksize=8192):
        """Store a file in binary mode."""
        self.voidcmd('TYPE I')
        conn = self.transfercmd(cmd)
        while 1:
            buf = fp.read(blocksize)
            if not buf:
                break
            conn.sendall(buf)

        conn.close()
        return self.voidresp()

    def storlines(self, cmd, fp):
        """Store a file in line mode."""
        self.voidcmd('TYPE A')
        conn = self.transfercmd(cmd)
        while 1:
            buf = fp.readline()
            if not buf:
                break
            if buf[-2:] != CRLF:
                if buf[-1] in CRLF:
                    buf = buf[:-1]
                buf = buf + CRLF
            conn.sendall(buf)

        conn.close()
        return self.voidresp()

    def acct(self, password):
        """Send new account name."""
        cmd = 'ACCT ' + password
        return self.voidcmd(cmd)

    def nlst(self, *args):
        """Return a list of files in a given directory (default the current)."""
        cmd = 'NLST'
        for arg in args:
            cmd = cmd + (' ' + arg)

        files = []
        self.retrlines(cmd, files.append)
        return files

    def dir(self, *args):
        """List a directory in long form.
        By default list current directory to stdout.
        Optional last argument is callback function; all
        non-empty arguments before it are concatenated to the
        LIST command.  (This *should* only be used for a pathname.)"""
        cmd = 'LIST'
        func = None
        if args[-1:] and type(args[-1]) != type(''):
            args, func = args[:-1], args[-1]
        for arg in args:
            if arg:
                cmd = cmd + (' ' + arg)

        self.retrlines(cmd, func)
        return

    def rename(self, fromname, toname):
        """Rename a file."""
        resp = self.sendcmd('RNFR ' + fromname)
        if resp[0] != '3':
            raise error_reply, resp
        return self.voidcmd('RNTO ' + toname)

    def delete(self, filename):
        """Delete a file."""
        resp = self.sendcmd('DELE ' + filename)
        if resp[:3] in ('250', '200'):
            return resp
        elif resp[:1] == '5':
            raise error_perm, resp
        else:
            raise error_reply, resp

    def cwd(self, dirname):
        """Change to a directory."""
        if dirname == '..':
            try:
                return self.voidcmd('CDUP')
            except error_perm, msg:
                if msg.args[0][:3] != '500':
                    raise

        elif dirname == '':
            dirname = '.'
        cmd = 'CWD ' + dirname
        return self.voidcmd(cmd)

    def size(self, filename):
        """Retrieve the size of a file."""
        resp = self.sendcmd('SIZE ' + filename)
        if resp[:3] == '213':
            s = resp[3:].strip()
            try:
                return int(s)
            except (OverflowError, ValueError):
                return long(s)

    def mkd(self, dirname):
        """Make a directory, return its full pathname."""
        resp = self.sendcmd('MKD ' + dirname)
        return parse257(resp)

    def rmd(self, dirname):
        """Remove a directory."""
        return self.voidcmd('RMD ' + dirname)

    def pwd(self):
        """Return current working directory."""
        resp = self.sendcmd('PWD')
        return parse257(resp)

    def quit(self):
        """Quit, and close the connection."""
        resp = self.voidcmd('QUIT')
        self.close()
        return resp

    def close(self):
        """Close the connection without assuming anything about it."""
        if self.file:
            self.file.close()
            self.sock.close()
            self.file = self.sock = None
        return


_150_re = None

def parse150(resp):
    """Parse the '150' response for a RETR request.
    Returns the expected transfer size or None; size is not guaranteed to
    be present in the 150 message.
    """
    global _150_re
    if resp[:3] != '150':
        raise error_reply, resp
    if _150_re is None:
        import re
        _150_re = re.compile('150 .* \\((\\d+) bytes\\)', re.IGNORECASE)
    m = _150_re.match(resp)
    if not m:
        return
    s = m.group(1)
    try:
        return int(s)
    except (OverflowError, ValueError):
        return long(s)

    return


_227_re = None

def parse227(resp):
    """Parse the '227' response for a PASV request.
    Raises error_proto if it does not contain '(h1,h2,h3,h4,p1,p2)'
    Return ('host.addr.as.numbers', port#) tuple."""
    global _227_re
    if resp[:3] != '227':
        raise error_reply, resp
    if _227_re is None:
        import re
        _227_re = re.compile('(\\d+),(\\d+),(\\d+),(\\d+),(\\d+),(\\d+)')
    m = _227_re.search(resp)
    if not m:
        raise error_proto, resp
    numbers = m.groups()
    host = ('.').join(numbers[:4])
    port = (int(numbers[4]) << 8) + int(numbers[5])
    return (host, port)


def parse229(resp, peer):
    """Parse the '229' response for a EPSV request.
    Raises error_proto if it does not contain '(|||port|)'
    Return ('host.addr.as.numbers', port#) tuple."""
    if resp[:3] != '229':
        raise error_reply, resp
    left = resp.find('(')
    if left < 0:
        raise error_proto, resp
    right = resp.find(')', left + 1)
    if right < 0:
        raise error_proto, resp
    if resp[left + 1] != resp[right - 1]:
        raise error_proto, resp
    parts = resp[left + 1:right].split(resp[left + 1])
    if len(parts) != 5:
        raise error_proto, resp
    host = peer[0]
    port = int(parts[3])
    return (host, port)


def parse257(resp):
    """Parse the '257' response for a MKD or PWD request.
    This is a response to a MKD or PWD request: a directory name.
    Returns the directoryname in the 257 reply."""
    if resp[:3] != '257':
        raise error_reply, resp
    if resp[3:5] != ' "':
        return ''
    dirname = ''
    i = 5
    n = len(resp)
    while i < n:
        c = resp[i]
        i = i + 1
        if c == '"':
            if i >= n or resp[i] != '"':
                break
            i = i + 1
        dirname = dirname + c

    return dirname


def print_line(line):
    """Default retrlines callback to print a line."""
    print line


def ftpcp(source, sourcename, target, targetname='', type='I'):
    """Copy file from one FTP-instance to another."""
    if not targetname:
        targetname = sourcename
    type = 'TYPE ' + type
    source.voidcmd(type)
    target.voidcmd(type)
    (sourcehost, sourceport) = parse227(source.sendcmd('PASV'))
    target.sendport(sourcehost, sourceport)
    treply = target.sendcmd('STOR ' + targetname)
    if treply[:3] not in ('125', '150'):
        raise error_proto
    sreply = source.sendcmd('RETR ' + sourcename)
    if sreply[:3] not in ('125', '150'):
        raise error_proto
    source.voidresp()
    target.voidresp()


class Netrc():
    """Class to parse & provide access to 'netrc' format files.

    See the netrc(4) man page for information on the file format.

    WARNING: This class is obsolete -- use module netrc instead.

    """
    __defuser = None
    __defpasswd = None
    __defacct = None

    def __init__(self, filename=None):
        if filename is None:
            if 'HOME' in os.environ:
                filename = os.path.join(os.environ['HOME'], '.netrc')
            else:
                raise IOError, 'specify file to load or set $HOME'
        self.__hosts = {}
        self.__macros = {}
        fp = open(filename, 'r')
        in_macro = 0
        while 1:
            line = fp.readline()
            if not line:
                break
            if in_macro and line.strip():
                macro_lines.append(line)
                continue
            elif in_macro:
                self.__macros[macro_name] = tuple(macro_lines)
                in_macro = 0
            words = line.split()
            host = user = passwd = acct = None
            default = 0
            i = 0
            while i < len(words):
                w1 = words[i]
                if i + 1 < len(words):
                    w2 = words[i + 1]
                else:
                    w2 = None
                if w1 == 'default':
                    default = 1
                elif w1 == 'machine' and w2:
                    host = w2.lower()
                    i = i + 1
                elif w1 == 'login' and w2:
                    user = w2
                    i = i + 1
                elif w1 == 'password' and w2:
                    passwd = w2
                    i = i + 1
                elif w1 == 'account' and w2:
                    acct = w2
                    i = i + 1
                elif w1 == 'macdef' and w2:
                    macro_name = w2
                    macro_lines = []
                    in_macro = 1
                    break
                i = i + 1

            if default:
                self.__defuser = user or self.__defuser
                self.__defpasswd = passwd or self.__defpasswd
                self.__defacct = acct or self.__defacct
            if host:
                if host in self.__hosts:
                    (ouser, opasswd, oacct) = self.__hosts[host]
                    user = user or ouser
                    passwd = passwd or opasswd
                    acct = acct or oacct
                self.__hosts[host] = (
                 user, passwd, acct)

        fp.close()
        return

    def get_hosts(self):
        """Return a list of hosts mentioned in the .netrc file."""
        return self.__hosts.keys()

    def get_account(self, host):
        """Returns login information for the named host.

        The return value is a triple containing userid,
        password, and the accounting field.

        """
        host = host.lower()
        user = passwd = acct = None
        if host in self.__hosts:
            (user, passwd, acct) = self.__hosts[host]
        user = user or self.__defuser
        passwd = passwd or self.__defpasswd
        acct = acct or self.__defacct
        return (user, passwd, acct)

    def get_macros(self):
        """Return a list of all defined macro names."""
        return self.__macros.keys()

    def get_macro(self, macro):
        """Return a sequence of lines which define a named macro."""
        return self.__macros[macro]


def test--- This code section failed: ---

 L. 776         0  LOAD_GLOBAL           0  'len'
                3  LOAD_GLOBAL           1  'sys'
                6  LOAD_ATTR             2  'argv'
                9  CALL_FUNCTION_1       1  None
               12  LOAD_CONST               2
               15  COMPARE_OP            0  <
               18  JUMP_IF_FALSE        25  'to 46'
             21_0  THEN                     47
               21  POP_TOP          

 L. 777        22  LOAD_GLOBAL           3  'test'
               25  LOAD_ATTR             4  '__doc__'
               28  PRINT_ITEM       
               29  PRINT_NEWLINE_CONT

 L. 778        30  LOAD_GLOBAL           1  'sys'
               33  LOAD_ATTR             5  'exit'
               36  LOAD_CONST               0
               39  CALL_FUNCTION_1       1  None
               42  POP_TOP          
               43  JUMP_FORWARD          1  'to 47'
             46_0  COME_FROM            18  '18'
               46  POP_TOP          
             47_0  COME_FROM            43  '43'

 L. 780        47  LOAD_CONST               0
               50  STORE_FAST            0  'debugging'

 L. 781        53  LOAD_CONST               None
               56  STORE_FAST            1  'rcfile'

 L. 782        59  SETUP_LOOP           45  'to 107'
               62  LOAD_GLOBAL           1  'sys'
               65  LOAD_ATTR             2  'argv'
               68  LOAD_CONST               1
               71  BINARY_SUBSCR    
               72  LOAD_CONST               '-d'
               75  COMPARE_OP            2  ==
               78  JUMP_IF_FALSE        24  'to 105'
               81  POP_TOP          

 L. 783        82  LOAD_FAST             0  'debugging'
               85  LOAD_CONST               1
               88  BINARY_ADD       
               89  STORE_FAST            0  'debugging'

 L. 784        92  LOAD_GLOBAL           1  'sys'
               95  LOAD_ATTR             2  'argv'
               98  LOAD_CONST               1
              101  DELETE_SUBSCR    
              102  JUMP_BACK            62  'to 62'
              105  POP_TOP          
              106  POP_BLOCK        
            107_0  COME_FROM            59  '59'

 L. 785       107  LOAD_GLOBAL           1  'sys'
              110  LOAD_ATTR             2  'argv'
              113  LOAD_CONST               1
              116  BINARY_SUBSCR    
              117  LOAD_CONST               2
              120  SLICE+2          
              121  LOAD_CONST               '-r'
              124  COMPARE_OP            2  ==
              127  JUMP_IF_FALSE        31  'to 161'
            130_0  THEN                     162
              130  POP_TOP          

 L. 787       131  LOAD_GLOBAL           1  'sys'
              134  LOAD_ATTR             2  'argv'
              137  LOAD_CONST               1
              140  BINARY_SUBSCR    
              141  LOAD_CONST               2
              144  SLICE+1          
              145  STORE_FAST            1  'rcfile'

 L. 788       148  LOAD_GLOBAL           1  'sys'
              151  LOAD_ATTR             2  'argv'
              154  LOAD_CONST               1
              157  DELETE_SUBSCR    
              158  JUMP_FORWARD          1  'to 162'
            161_0  COME_FROM           127  '127'
              161  POP_TOP          
            162_0  COME_FROM           158  '158'

 L. 789       162  LOAD_GLOBAL           1  'sys'
              165  LOAD_ATTR             2  'argv'
              168  LOAD_CONST               1
              171  BINARY_SUBSCR    
              172  STORE_FAST            2  'host'

 L. 790       175  LOAD_GLOBAL           7  'FTP'
              178  LOAD_FAST             2  'host'
              181  CALL_FUNCTION_1       1  None
              184  STORE_FAST            3  'ftp'

 L. 791       187  LOAD_FAST             3  'ftp'
              190  LOAD_ATTR             8  'set_debuglevel'
              193  LOAD_FAST             0  'debugging'
              196  CALL_FUNCTION_1       1  None
              199  POP_TOP          

 L. 792       200  LOAD_CONST               ''
              203  DUP_TOP          
              204  STORE_FAST            4  'userid'
              207  DUP_TOP          
              208  STORE_FAST            5  'passwd'
              211  STORE_FAST            6  'acct'

 L. 793       214  SETUP_EXCEPT         16  'to 233'

 L. 794       217  LOAD_GLOBAL           9  'Netrc'
              220  LOAD_FAST             1  'rcfile'
              223  CALL_FUNCTION_1       1  None
              226  STORE_FAST            7  'netrc'
              229  POP_BLOCK        
              230  JUMP_FORWARD         52  'to 285'
            233_0  COME_FROM           214  '214'

 L. 795       233  DUP_TOP          
              234  LOAD_GLOBAL          10  'IOError'
              237  COMPARE_OP           10  exception-match
              240  JUMP_IF_FALSE        40  'to 283'
              243  POP_TOP          
              244  POP_TOP          
              245  POP_TOP          
              246  POP_TOP          

 L. 796       247  LOAD_FAST             1  'rcfile'
              250  LOAD_CONST               None
              253  COMPARE_OP            9  is-not
              256  JUMP_IF_FALSE        20  'to 279'
              259  POP_TOP          

 L. 797       260  LOAD_GLOBAL           1  'sys'
              263  LOAD_ATTR            11  'stderr'
              266  LOAD_ATTR            12  'write'
              269  LOAD_CONST               'Could not open account file -- using anonymous login.'
              272  CALL_FUNCTION_1       1  None
              275  POP_TOP          
              276  JUMP_ABSOLUTE       351  'to 351'
            279_0  COME_FROM           256  '256'
              279  POP_TOP          
              280  JUMP_FORWARD         68  'to 351'
              283  POP_TOP          
              284  END_FINALLY      
            285_0  COME_FROM           230  '230'

 L. 800       285  SETUP_EXCEPT         28  'to 316'

 L. 801       288  LOAD_FAST             7  'netrc'
              291  LOAD_ATTR            13  'get_account'
              294  LOAD_FAST             2  'host'
              297  CALL_FUNCTION_1       1  None
              300  UNPACK_SEQUENCE_3     3 
              303  STORE_FAST            4  'userid'
              306  STORE_FAST            5  'passwd'
              309  STORE_FAST            6  'acct'
              312  POP_BLOCK        
              313  JUMP_FORWARD         35  'to 351'
            316_0  COME_FROM           285  '285'

 L. 802       316  DUP_TOP          
              317  LOAD_GLOBAL          14  'KeyError'
              320  COMPARE_OP           10  exception-match
              323  JUMP_IF_FALSE        23  'to 349'
              326  POP_TOP          
              327  POP_TOP          
              328  POP_TOP          
              329  POP_TOP          

 L. 804       330  LOAD_GLOBAL           1  'sys'
              333  LOAD_ATTR            11  'stderr'
              336  LOAD_ATTR            12  'write'

 L. 805       339  LOAD_CONST               'No account -- using anonymous login.'
              342  CALL_FUNCTION_1       1  None
              345  POP_TOP          
              346  JUMP_FORWARD          2  'to 351'
              349  POP_TOP          
              350  END_FINALLY      
            351_0  COME_FROM           346  '346'
            351_1  COME_FROM           313  '313'
            351_2  COME_FROM           280  '280'

 L. 806       351  LOAD_FAST             3  'ftp'
              354  LOAD_ATTR            15  'login'
              357  LOAD_FAST             4  'userid'
              360  LOAD_FAST             5  'passwd'
              363  LOAD_FAST             6  'acct'
              366  CALL_FUNCTION_3       3  None
              369  POP_TOP          

 L. 807       370  SETUP_LOOP          197  'to 570'
              373  LOAD_GLOBAL           1  'sys'
              376  LOAD_ATTR             2  'argv'
              379  LOAD_CONST               2
              382  SLICE+1          
              383  GET_ITER         
              384  FOR_ITER            182  'to 569'
              387  STORE_FAST            8  'file'

 L. 808       390  LOAD_FAST             8  'file'
              393  LOAD_CONST               2
              396  SLICE+2          
              397  LOAD_CONST               '-l'
              400  COMPARE_OP            2  ==
              403  JUMP_IF_FALSE        21  'to 427'
              406  POP_TOP          

 L. 809       407  LOAD_FAST             3  'ftp'
              410  LOAD_ATTR            16  'dir'
              413  LOAD_FAST             8  'file'
              416  LOAD_CONST               2
              419  SLICE+1          
              420  CALL_FUNCTION_1       1  None
              423  POP_TOP          
              424  JUMP_BACK           384  'to 384'
            427_0  COME_FROM           403  '403'
              427  POP_TOP          

 L. 810       428  LOAD_FAST             8  'file'
              431  LOAD_CONST               2
              434  SLICE+2          
              435  LOAD_CONST               '-d'
              438  COMPARE_OP            2  ==
              441  JUMP_IF_FALSE        58  'to 502'
              444  POP_TOP          

 L. 811       445  LOAD_CONST               'CWD'
              448  STORE_FAST            9  'cmd'

 L. 812       451  LOAD_FAST             8  'file'
              454  LOAD_CONST               2
              457  SLICE+1          
              458  JUMP_IF_FALSE        22  'to 483'
            461_0  THEN                     484
              461  POP_TOP          
              462  LOAD_FAST             9  'cmd'
              465  LOAD_CONST               ' '
              468  BINARY_ADD       
              469  LOAD_FAST             8  'file'
              472  LOAD_CONST               2
              475  SLICE+1          
              476  BINARY_ADD       
              477  STORE_FAST            9  'cmd'
              480  JUMP_FORWARD          1  'to 484'
            483_0  COME_FROM           458  '458'
              483  POP_TOP          
            484_0  COME_FROM           480  '480'

 L. 813       484  LOAD_FAST             3  'ftp'
              487  LOAD_ATTR            17  'sendcmd'
              490  LOAD_FAST             9  'cmd'
              493  CALL_FUNCTION_1       1  None
              496  STORE_FAST           10  'resp'
              499  JUMP_BACK           384  'to 384'
            502_0  COME_FROM           441  '441'
              502  POP_TOP          

 L. 814       503  LOAD_FAST             8  'file'
              506  LOAD_CONST               '-p'
              509  COMPARE_OP            2  ==
              512  JUMP_IF_FALSE        21  'to 536'
              515  POP_TOP          

 L. 815       516  LOAD_FAST             3  'ftp'
              519  LOAD_ATTR            18  'set_pasv'
              522  LOAD_FAST             3  'ftp'
              525  LOAD_ATTR            19  'passiveserver'
              528  UNARY_NOT        
              529  CALL_FUNCTION_1       1  None
              532  POP_TOP          
              533  JUMP_BACK           384  'to 384'
            536_0  COME_FROM           512  '512'
              536  POP_TOP          

 L. 817       537  LOAD_FAST             3  'ftp'
              540  LOAD_ATTR            20  'retrbinary'
              543  LOAD_CONST               'RETR '
              546  LOAD_FAST             8  'file'
              549  BINARY_ADD       

 L. 818       550  LOAD_GLOBAL           1  'sys'
              553  LOAD_ATTR            21  'stdout'
              556  LOAD_ATTR            12  'write'
              559  LOAD_CONST               1024
              562  CALL_FUNCTION_3       3  None
              565  POP_TOP          
              566  JUMP_BACK           384  'to 384'
              569  POP_BLOCK        
            570_0  COME_FROM           370  '370'

 L. 819       570  LOAD_FAST             3  'ftp'
              573  LOAD_ATTR            22  'quit'
              576  CALL_FUNCTION_0       0  None
              579  POP_TOP          
              580  LOAD_CONST               None
              583  RETURN_VALUE     

Parse error at or near `LOAD_FAST' instruction at offset 351


if __name__ == '__main__':
    test()