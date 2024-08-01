# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/tarfile.py
# Compiled at: 2008-12-16 09:37:52
"""Read from and write to tar format archives.
"""
__version__ = '$Revision$'
version = '0.8.0'
__author__ = 'Lars Gust\xe4bel (lars@gustaebel.de)'
__date__ = '$Date$'
__cvsid__ = '$Id$'
__credits__ = 'Gustavo Niemeyer, Niels Gust\xe4bel, Richard Townsend.'
import sys, os, shutil, stat, errno, time, struct, copy
if sys.platform == 'mac':
    raise ImportError, 'tarfile does not work for platform==mac'
try:
    import grp, pwd
except ImportError:
    grp = pwd = None

__all__ = [
 'TarFile', 'TarInfo', 'is_tarfile', 'TarError']
NUL = '\x00'
BLOCKSIZE = 512
RECORDSIZE = BLOCKSIZE * 20
MAGIC = 'ustar'
VERSION = '00'
LENGTH_NAME = 100
LENGTH_LINK = 100
LENGTH_PREFIX = 155
MAXSIZE_MEMBER = 8589934591L
REGTYPE = '0'
AREGTYPE = '\x00'
LNKTYPE = '1'
SYMTYPE = '2'
CHRTYPE = '3'
BLKTYPE = '4'
DIRTYPE = '5'
FIFOTYPE = '6'
CONTTYPE = '7'
GNUTYPE_LONGNAME = 'L'
GNUTYPE_LONGLINK = 'K'
GNUTYPE_SPARSE = 'S'
SUPPORTED_TYPES = (
 REGTYPE, AREGTYPE, LNKTYPE,
 SYMTYPE, DIRTYPE, FIFOTYPE,
 CONTTYPE, CHRTYPE, BLKTYPE,
 GNUTYPE_LONGNAME, GNUTYPE_LONGLINK,
 GNUTYPE_SPARSE)
REGULAR_TYPES = (
 REGTYPE, AREGTYPE,
 CONTTYPE, GNUTYPE_SPARSE)
S_IFLNK = 40960
S_IFREG = 32768
S_IFBLK = 24576
S_IFDIR = 16384
S_IFCHR = 8192
S_IFIFO = 4096
TSUID = 2048
TSGID = 1024
TSVTX = 512
TUREAD = 256
TUWRITE = 128
TUEXEC = 64
TGREAD = 32
TGWRITE = 16
TGEXEC = 8
TOREAD = 4
TOWRITE = 2
TOEXEC = 1

def stn(s, length):
    """Convert a python string to a null-terminated string buffer.
    """
    return s[:length] + (length - len(s)) * NUL


def nts(s):
    """Convert a null-terminated string field to a python string.
    """
    p = s.find('\x00')
    if p == -1:
        return s
    return s[:p]


def nti(s):
    """Convert a number field to a python number.
    """
    if s[0] != chr(128):
        n = int(nts(s) or '0', 8)
    else:
        n = 0L
        for i in xrange(len(s) - 1):
            n <<= 8
            n += ord(s[i + 1])

    return n


def itn(n, digits=8, posix=False):
    """Convert a python number to a number field.
    """
    if 0 <= n < 8 ** (digits - 1):
        s = '%0*o' % (digits - 1, n) + NUL
    else:
        if posix:
            raise ValueError('overflow in number field')
        if n < 0:
            n = struct.unpack('L', struct.pack('l', n))[0]
        s = ''
        for i in xrange(digits - 1):
            s = chr(n & 255) + s
            n >>= 8

        s = chr(128) + s
    return s


def calc_chksums(buf):
    """Calculate the checksum for a member's header by summing up all
       characters except for the chksum field which is treated as if
       it was filled with spaces. According to the GNU tar sources,
       some tars (Sun and NeXT) calculate chksum with signed char,
       which will be different if there are chars in the buffer with
       the high bit set. So we calculate two checksums, unsigned and
       signed.
    """
    unsigned_chksum = 256 + sum(struct.unpack('148B', buf[:148]) + struct.unpack('356B', buf[156:512]))
    signed_chksum = 256 + sum(struct.unpack('148b', buf[:148]) + struct.unpack('356b', buf[156:512]))
    return (unsigned_chksum, signed_chksum)


def copyfileobj(src, dst, length=None):
    """Copy length bytes from fileobj src to fileobj dst.
       If length is None, copy the entire content.
    """
    if length == 0:
        return
    if length is None:
        shutil.copyfileobj(src, dst)
        return
    BUFSIZE = 16384
    (blocks, remainder) = divmod(length, BUFSIZE)
    for b in xrange(blocks):
        buf = src.read(BUFSIZE)
        if len(buf) < BUFSIZE:
            raise IOError('end of file reached')
        dst.write(buf)

    if remainder != 0:
        buf = src.read(remainder)
        if len(buf) < remainder:
            raise IOError('end of file reached')
        dst.write(buf)
    return


filemode_table = (
 (
  (
   S_IFLNK, 'l'),
  (
   S_IFREG, '-'),
  (
   S_IFBLK, 'b'),
  (
   S_IFDIR, 'd'),
  (
   S_IFCHR, 'c'),
  (
   S_IFIFO, 'p')),
 (
  (
   TUREAD, 'r'),),
 (
  (
   TUWRITE, 'w'),),
 (
  (
   TUEXEC | TSUID, 's'),
  (
   TSUID, 'S'),
  (
   TUEXEC, 'x')),
 (
  (
   TGREAD, 'r'),),
 (
  (
   TGWRITE, 'w'),),
 (
  (
   TGEXEC | TSGID, 's'),
  (
   TSGID, 'S'),
  (
   TGEXEC, 'x')),
 (
  (
   TOREAD, 'r'),),
 (
  (
   TOWRITE, 'w'),),
 (
  (
   TOEXEC | TSVTX, 't'),
  (
   TSVTX, 'T'),
  (
   TOEXEC, 'x')))

def filemode(mode):
    """Convert a file's mode to a string of the form
       -rwxrwxrwx.
       Used by TarFile.list()
    """
    perm = []
    for table in filemode_table:
        for (bit, char) in table:
            if mode & bit == bit:
                perm.append(char)
                break
        else:
            perm.append('-')

    return ('').join(perm)


if os.sep != '/':
    normpath = lambda path: os.path.normpath(path).replace(os.sep, '/')
else:
    normpath = os.path.normpath

class TarError(Exception):
    """Base exception."""
    pass


class ExtractError(TarError):
    """General exception for extract errors."""
    pass


class ReadError(TarError):
    """Exception for unreadble tar archives."""
    pass


class CompressionError(TarError):
    """Exception for unavailable compression methods."""
    pass


class StreamError(TarError):
    """Exception for unsupported operations on stream-like TarFiles."""
    pass


class _LowLevelFile():
    """Low-level file object. Supports reading and writing.
       It is used instead of a regular file object for streaming
       access.
    """

    def __init__(self, name, mode):
        mode = {'r': os.O_RDONLY, 
           'w': os.O_WRONLY | os.O_CREAT | os.O_TRUNC}[mode]
        if hasattr(os, 'O_BINARY'):
            mode |= os.O_BINARY
        self.fd = os.open(name, mode)

    def close(self):
        os.close(self.fd)

    def read(self, size):
        return os.read(self.fd, size)

    def write(self, s):
        os.write(self.fd, s)


class _Stream():
    """Class that serves as an adapter between TarFile and
       a stream-like object.  The stream-like object only
       needs to have a read() or write() method and is accessed
       blockwise.  Use of gzip or bzip2 compression is possible.
       A stream-like object could be for example: sys.stdin,
       sys.stdout, a socket, a tape device etc.

       _Stream is intended to be used only internally.
    """

    def __init__(self, name, mode, comptype, fileobj, bufsize):
        """Construct a _Stream object.
        """
        self._extfileobj = True
        if fileobj is None:
            fileobj = _LowLevelFile(name, mode)
            self._extfileobj = False
        if comptype == '*':
            fileobj = _StreamProxy(fileobj)
            comptype = fileobj.getcomptype()
        self.name = name or ''
        self.mode = mode
        self.comptype = comptype
        self.fileobj = fileobj
        self.bufsize = bufsize
        self.buf = ''
        self.pos = 0L
        self.closed = False
        if comptype == 'gz':
            try:
                import zlib
            except ImportError:
                raise CompressionError('zlib module is not available')
            else:
                self.zlib = zlib
                self.crc = zlib.crc32('')
                if mode == 'r':
                    self._init_read_gz()
                else:
                    self._init_write_gz()
        if comptype == 'bz2':
            try:
                import bz2
            except ImportError:
                raise CompressionError('bz2 module is not available')
            else:
                if mode == 'r':
                    self.dbuf = ''
                    self.cmp = bz2.BZ2Decompressor()
                else:
                    self.cmp = bz2.BZ2Compressor()
        return

    def __del__(self):
        if hasattr(self, 'closed') and not self.closed:
            self.close()

    def _init_write_gz(self):
        """Initialize for writing with gzip compression.
        """
        self.cmp = self.zlib.compressobj(9, self.zlib.DEFLATED, -self.zlib.MAX_WBITS, self.zlib.DEF_MEM_LEVEL, 0)
        timestamp = struct.pack('<L', long(time.time()))
        self.__write('\x1f\x8b\x08\x08%s\x02\xff' % timestamp)
        if self.name.endswith('.gz'):
            self.name = self.name[:-3]
        self.__write(self.name + NUL)

    def write(self, s):
        """Write string s to the stream.
        """
        if self.comptype == 'gz':
            self.crc = self.zlib.crc32(s, self.crc)
        self.pos += len(s)
        if self.comptype != 'tar':
            s = self.cmp.compress(s)
        self.__write(s)

    def __write(self, s):
        """Write string s to the stream if a whole new block
           is ready to be written.
        """
        self.buf += s
        while len(self.buf) > self.bufsize:
            self.fileobj.write(self.buf[:self.bufsize])
            self.buf = self.buf[self.bufsize:]

    def close(self):
        """Close the _Stream object. No operation should be
           done on it afterwards.
        """
        if self.closed:
            return
        if self.mode == 'w' and self.comptype != 'tar':
            self.buf += self.cmp.flush()
        if self.mode == 'w' and self.buf:
            self.fileobj.write(self.buf)
            self.buf = ''
            if self.comptype == 'gz':
                self.fileobj.write(struct.pack('<L', self.crc & 4294967295L))
                self.fileobj.write(struct.pack('<L', self.pos & 4294967295L))
        if not self._extfileobj:
            self.fileobj.close()
        self.closed = True

    def _init_read_gz(self):
        """Initialize for reading a gzip compressed fileobj.
        """
        self.cmp = self.zlib.decompressobj(-self.zlib.MAX_WBITS)
        self.dbuf = ''
        if self.__read(2) != '\x1f\x8b':
            raise ReadError('not a gzip file')
        if self.__read(1) != '\x08':
            raise CompressionError('unsupported compression method')
        flag = ord(self.__read(1))
        self.__read(6)
        if flag & 4:
            xlen = ord(self.__read(1)) + 256 * ord(self.__read(1))
            self.read(xlen)
        if flag & 8:
            while True:
                s = self.__read(1)
                if not s or s == NUL:
                    break

        if flag & 16:
            while True:
                s = self.__read(1)
                if not s or s == NUL:
                    break

        if flag & 2:
            self.__read(2)

    def tell(self):
        """Return the stream's file pointer position.
        """
        return self.pos

    def seek(self, pos=0):
        """Set the stream's file pointer to pos. Negative seeking
           is forbidden.
        """
        if pos - self.pos >= 0:
            (blocks, remainder) = divmod(pos - self.pos, self.bufsize)
            for i in xrange(blocks):
                self.read(self.bufsize)

            self.read(remainder)
        else:
            raise StreamError('seeking backwards is not allowed')
        return self.pos

    def read(self, size=None):
        """Return the next size number of bytes from the stream.
           If size is not defined, return all bytes of the stream
           up to EOF.
        """
        if size is None:
            t = []
            while True:
                buf = self._read(self.bufsize)
                if not buf:
                    break
                t.append(buf)

            buf = ('').join(t)
        else:
            buf = self._read(size)
        self.pos += len(buf)
        return buf

    def _read(self, size):
        """Return size bytes from the stream.
        """
        if self.comptype == 'tar':
            return self.__read(size)
        c = len(self.dbuf)
        t = [self.dbuf]
        while c < size:
            buf = self.__read(self.bufsize)
            if not buf:
                break
            buf = self.cmp.decompress(buf)
            t.append(buf)
            c += len(buf)

        t = ('').join(t)
        self.dbuf = t[size:]
        return t[:size]

    def __read(self, size):
        """Return size bytes from stream. If internal buffer is empty,
           read another block from the stream.
        """
        c = len(self.buf)
        t = [self.buf]
        while c < size:
            buf = self.fileobj.read(self.bufsize)
            if not buf:
                break
            t.append(buf)
            c += len(buf)

        t = ('').join(t)
        self.buf = t[size:]
        return t[:size]


class _StreamProxy(object):
    """Small proxy class that enables transparent compression
       detection for the Stream interface (mode 'r|*').
    """

    def __init__(self, fileobj):
        self.fileobj = fileobj
        self.buf = self.fileobj.read(BLOCKSIZE)

    def read(self, size):
        self.read = self.fileobj.read
        return self.buf

    def getcomptype(self):
        if self.buf.startswith('\x1f\x8b\x08'):
            return 'gz'
        if self.buf.startswith('BZh91'):
            return 'bz2'
        return 'tar'

    def close(self):
        self.fileobj.close()


class _BZ2Proxy(object):
    """Small proxy class that enables external file object
       support for "r:bz2" and "w:bz2" modes. This is actually
       a workaround for a limitation in bz2 module's BZ2File
       class which (unlike gzip.GzipFile) has no support for
       a file object argument.
    """
    blocksize = 16384

    def __init__(self, fileobj, mode):
        self.fileobj = fileobj
        self.mode = mode
        self.init()

    def init(self):
        import bz2
        self.pos = 0
        if self.mode == 'r':
            self.bz2obj = bz2.BZ2Decompressor()
            self.fileobj.seek(0)
            self.buf = ''
        else:
            self.bz2obj = bz2.BZ2Compressor()

    def read(self, size):
        b = [self.buf]
        x = len(self.buf)
        while x < size:
            try:
                raw = self.fileobj.read(self.blocksize)
                data = self.bz2obj.decompress(raw)
                b.append(data)
            except EOFError:
                break

            x += len(data)

        self.buf = ('').join(b)
        buf = self.buf[:size]
        self.buf = self.buf[size:]
        self.pos += len(buf)
        return buf

    def seek(self, pos):
        if pos < self.pos:
            self.init()
        self.read(pos - self.pos)

    def tell(self):
        return self.pos

    def write(self, data):
        self.pos += len(data)
        raw = self.bz2obj.compress(data)
        self.fileobj.write(raw)

    def close(self):
        if self.mode == 'w':
            raw = self.bz2obj.flush()
            self.fileobj.write(raw)
        self.fileobj.close()


class _FileInFile(object):
    """A thin wrapper around an existing file object that
       provides a part of its data as an individual file
       object.
    """

    def __init__(self, fileobj, offset, size, sparse=None):
        self.fileobj = fileobj
        self.offset = offset
        self.size = size
        self.sparse = sparse
        self.position = 0

    def tell(self):
        """Return the current file position.
        """
        return self.position

    def seek(self, position):
        """Seek to a position in the file.
        """
        self.position = position

    def read(self, size=None):
        """Read data from the file.
        """
        if size is None:
            size = self.size - self.position
        else:
            size = min(size, self.size - self.position)
        if self.sparse is None:
            return self.readnormal(size)
        else:
            return self.readsparse(size)
        return

    def readnormal(self, size):
        """Read operation for regular files.
        """
        self.fileobj.seek(self.offset + self.position)
        self.position += size
        return self.fileobj.read(size)

    def readsparse(self, size):
        """Read operation for sparse files.
        """
        data = []
        while size > 0:
            buf = self.readsparsesection(size)
            if not buf:
                break
            size -= len(buf)
            data.append(buf)

        return ('').join(data)

    def readsparsesection(self, size):
        """Read a single section of a sparse file.
        """
        section = self.sparse.find(self.position)
        if section is None:
            return ''
        size = min(size, section.offset + section.size - self.position)
        if isinstance(section, _data):
            realpos = section.realpos + self.position - section.offset
            self.fileobj.seek(self.offset + realpos)
            self.position += size
            return self.fileobj.read(size)
        else:
            self.position += size
            return NUL * size
        return


class ExFileObject(object):
    """File-like object for reading an archive member.
       Is returned by TarFile.extractfile().
    """
    blocksize = 1024

    def __init__(self, tarfile, tarinfo):
        self.fileobj = _FileInFile(tarfile.fileobj, tarinfo.offset_data, tarinfo.size, getattr(tarinfo, 'sparse', None))
        self.name = tarinfo.name
        self.mode = 'r'
        self.closed = False
        self.size = tarinfo.size
        self.position = 0
        self.buffer = ''
        return

    def read(self, size=None):
        """Read at most size bytes from the file. If size is not
           present or None, read all data until EOF is reached.
        """
        if self.closed:
            raise ValueError('I/O operation on closed file')
        buf = ''
        if self.buffer:
            if size is None:
                buf = self.buffer
                self.buffer = ''
            else:
                buf = self.buffer[:size]
                self.buffer = self.buffer[size:]
        if size is None:
            buf += self.fileobj.read()
        else:
            buf += self.fileobj.read(size - len(buf))
        self.position += len(buf)
        return buf

    def readline(self, size=-1):
        """Read one entire line from the file. If size is present
           and non-negative, return a string with at most that
           size, which may be an incomplete line.
        """
        if self.closed:
            raise ValueError('I/O operation on closed file')
        if '\n' in self.buffer:
            pos = self.buffer.find('\n') + 1
        else:
            buffers = [
             self.buffer]
            while True:
                buf = self.fileobj.read(self.blocksize)
                buffers.append(buf)
                if not buf or '\n' in buf:
                    self.buffer = ('').join(buffers)
                    pos = self.buffer.find('\n') + 1
                    if pos == 0:
                        pos = len(self.buffer)
                    break

        if size != -1:
            pos = min(size, pos)
        buf = self.buffer[:pos]
        self.buffer = self.buffer[pos:]
        self.position += len(buf)
        return buf

    def readlines(self):
        """Return a list with all remaining lines.
        """
        result = []
        while True:
            line = self.readline()
            if not line:
                break
            result.append(line)

        return result

    def tell(self):
        """Return the current file position.
        """
        if self.closed:
            raise ValueError('I/O operation on closed file')
        return self.position

    def seek(self, pos, whence=os.SEEK_SET):
        """Seek to a position in the file.
        """
        if self.closed:
            raise ValueError('I/O operation on closed file')
        if whence == os.SEEK_SET:
            self.position = min(max(pos, 0), self.size)
        elif whence == os.SEEK_CUR:
            if pos < 0:
                self.position = max(self.position + pos, 0)
            else:
                self.position = min(self.position + pos, self.size)
        elif whence == os.SEEK_END:
            self.position = max(min(self.size + pos, self.size), 0)
        else:
            raise ValueError('Invalid argument')
        self.buffer = ''
        self.fileobj.seek(self.position)

    def close(self):
        """Close the file object.
        """
        self.closed = True

    def __iter__(self):
        """Get an iterator over the file's lines.
        """
        while True:
            line = self.readline()
            if not line:
                break
            yield line


class TarInfo(object):
    """Informational class which holds the details about an
       archive member given by a tar header block.
       TarInfo objects are returned by TarFile.getmember(),
       TarFile.getmembers() and TarFile.gettarinfo() and are
       usually created internally.
    """

    def __init__(self, name=''):
        """Construct a TarInfo object. name is the optional name
           of the member.
        """
        self.name = name
        self.mode = 438
        self.uid = 0
        self.gid = 0
        self.size = 0
        self.mtime = 0
        self.chksum = 0
        self.type = REGTYPE
        self.linkname = ''
        self.uname = 'user'
        self.gname = 'group'
        self.devmajor = 0
        self.devminor = 0
        self.offset = 0
        self.offset_data = 0

    def __repr__(self):
        return '<%s %r at %#x>' % (self.__class__.__name__, self.name, id(self))

    @classmethod
    def frombuf(cls, buf):
        """Construct a TarInfo object from a 512 byte string buffer.
        """
        if len(buf) != BLOCKSIZE:
            raise ValueError('truncated header')
        if buf.count(NUL) == BLOCKSIZE:
            raise ValueError('empty header')
        tarinfo = cls()
        tarinfo.buf = buf
        tarinfo.name = nts(buf[0:100])
        tarinfo.mode = nti(buf[100:108])
        tarinfo.uid = nti(buf[108:116])
        tarinfo.gid = nti(buf[116:124])
        tarinfo.size = nti(buf[124:136])
        tarinfo.mtime = nti(buf[136:148])
        tarinfo.chksum = nti(buf[148:156])
        tarinfo.type = buf[156:157]
        tarinfo.linkname = nts(buf[157:257])
        tarinfo.uname = nts(buf[265:297])
        tarinfo.gname = nts(buf[297:329])
        tarinfo.devmajor = nti(buf[329:337])
        tarinfo.devminor = nti(buf[337:345])
        prefix = nts(buf[345:500])
        if prefix and not tarinfo.issparse():
            tarinfo.name = prefix + '/' + tarinfo.name
        if tarinfo.chksum not in calc_chksums(buf):
            raise ValueError('invalid header')
        return tarinfo

    def tobuf(self, posix=False):
        """Return a tar header as a string of 512 byte blocks.
        """
        buf = ''
        type = self.type
        prefix = ''
        if self.name.endswith('/'):
            type = DIRTYPE
        if type in (GNUTYPE_LONGNAME, GNUTYPE_LONGLINK):
            name = self.name
        else:
            name = normpath(self.name)
        if type == DIRTYPE:
            name += '/'
        linkname = self.linkname
        if linkname:
            linkname = normpath(linkname)
        if posix:
            if self.size > MAXSIZE_MEMBER:
                raise ValueError('file is too large (>= 8 GB)')
            if len(self.linkname) > LENGTH_LINK:
                raise ValueError('linkname is too long (>%d)' % LENGTH_LINK)
            if len(name) > LENGTH_NAME:
                prefix = name[:LENGTH_PREFIX + 1]
                while prefix and prefix[-1] != '/':
                    prefix = prefix[:-1]

                name = name[len(prefix):]
                prefix = prefix[:-1]
                if not prefix or len(name) > LENGTH_NAME:
                    raise ValueError('name is too long')
        else:
            if len(self.linkname) > LENGTH_LINK:
                buf += self._create_gnulong(self.linkname, GNUTYPE_LONGLINK)
            if len(name) > LENGTH_NAME:
                buf += self._create_gnulong(name, GNUTYPE_LONGNAME)
        parts = [stn(name, 100),
         itn(self.mode & 4095, 8, posix),
         itn(self.uid, 8, posix),
         itn(self.gid, 8, posix),
         itn(self.size, 12, posix),
         itn(self.mtime, 12, posix),
         '        ',
         type,
         stn(self.linkname, 100),
         stn(MAGIC, 6),
         stn(VERSION, 2),
         stn(self.uname, 32),
         stn(self.gname, 32),
         itn(self.devmajor, 8, posix),
         itn(self.devminor, 8, posix),
         stn(prefix, 155)]
        buf += ('').join(parts).ljust(BLOCKSIZE, NUL)
        chksum = calc_chksums(buf[-BLOCKSIZE:])[0]
        buf = buf[:-364] + '%06o\x00' % chksum + buf[-357:]
        self.buf = buf
        return buf

    def _create_gnulong(self, name, type):
        """Create a GNU longname/longlink header from name.
           It consists of an extended tar header, with the length
           of the longname as size, followed by data blocks,
           which contain the longname as a null terminated string.
        """
        name += NUL
        tarinfo = self.__class__()
        tarinfo.name = '././@LongLink'
        tarinfo.type = type
        tarinfo.mode = 0
        tarinfo.size = len(name)
        buf = tarinfo.tobuf()
        buf += name
        (blocks, remainder) = divmod(len(name), BLOCKSIZE)
        if remainder > 0:
            buf += (BLOCKSIZE - remainder) * NUL
        return buf

    def isreg(self):
        return self.type in REGULAR_TYPES

    def isfile(self):
        return self.isreg()

    def isdir(self):
        return self.type == DIRTYPE

    def issym(self):
        return self.type == SYMTYPE

    def islnk(self):
        return self.type == LNKTYPE

    def ischr(self):
        return self.type == CHRTYPE

    def isblk(self):
        return self.type == BLKTYPE

    def isfifo(self):
        return self.type == FIFOTYPE

    def issparse(self):
        return self.type == GNUTYPE_SPARSE

    def isdev(self):
        return self.type in (CHRTYPE, BLKTYPE, FIFOTYPE)


class TarFile(object):
    """The TarFile Class provides an interface to tar archives.
    """
    debug = 0
    dereference = False
    ignore_zeros = False
    errorlevel = 0
    posix = False
    fileobject = ExFileObject

    def __init__(self, name=None, mode='r', fileobj=None):
        """Open an (uncompressed) tar archive `name'. `mode' is either 'r' to
           read from an existing archive, 'a' to append data to an existing
           file or 'w' to create a new file overwriting an existing one. `mode'
           defaults to 'r'.
           If `fileobj' is given, it is used for reading or writing data. If it
           can be determined, `mode' is overridden by `fileobj's mode.
           `fileobj' is not closed, when TarFile is closed.
        """
        if len(mode) > 1 or mode not in 'raw':
            raise ValueError("mode must be 'r', 'a' or 'w'")
        self._mode = mode
        self.mode = {'r': 'rb', 'a': 'r+b', 'w': 'wb'}[mode]
        if not fileobj:
            fileobj = file(name, self.mode)
            self._extfileobj = False
        else:
            if name is None and hasattr(fileobj, 'name'):
                name = fileobj.name
            if hasattr(fileobj, 'mode'):
                self.mode = fileobj.mode
            self._extfileobj = True
        self.name = os.path.abspath(name) if name else None
        self.fileobj = fileobj
        self.closed = False
        self.members = []
        self._loaded = False
        self.offset = self.fileobj.tell()
        self.inodes = {}
        if self._mode == 'r':
            self.firstmember = None
            self.firstmember = self.next()
        if self._mode == 'a':
            self.firstmember = None
            while True:
                try:
                    tarinfo = self.next()
                except ReadError:
                    self.fileobj.seek(0)
                    break

                if tarinfo is None:
                    self.fileobj.seek(-BLOCKSIZE, 1)
                    break

        if self._mode in 'aw':
            self._loaded = True
        return

    @classmethod
    def open(cls, name=None, mode='r', fileobj=None, bufsize=10240):
        """Open a tar archive for reading, writing or appending. Return
           an appropriate TarFile class.

           mode:
           'r' or 'r:*' open for reading with transparent compression
           'r:'         open for reading exclusively uncompressed
           'r:gz'       open for reading with gzip compression
           'r:bz2'      open for reading with bzip2 compression
           'a' or 'a:'  open for appending
           'w' or 'w:'  open for writing without compression
           'w:gz'       open for writing with gzip compression
           'w:bz2'      open for writing with bzip2 compression

           'r|*'        open a stream of tar blocks with transparent compression
           'r|'         open an uncompressed stream of tar blocks for reading
           'r|gz'       open a gzip compressed stream of tar blocks
           'r|bz2'      open a bzip2 compressed stream of tar blocks
           'w|'         open an uncompressed stream for writing
           'w|gz'       open a gzip compressed stream for writing
           'w|bz2'      open a bzip2 compressed stream for writing
        """
        if not name and not fileobj:
            raise ValueError('nothing to open')
        if mode in ('r', 'r:*'):
            for comptype in cls.OPEN_METH:
                func = getattr(cls, cls.OPEN_METH[comptype])
                if fileobj is not None:
                    saved_pos = fileobj.tell()
                try:
                    return func(name, 'r', fileobj)
                except (ReadError, CompressionError):
                    if fileobj is not None:
                        fileobj.seek(saved_pos)
                    continue

            raise ReadError('file could not be opened successfully')
        elif ':' in mode:
            (filemode, comptype) = mode.split(':', 1)
            filemode = filemode or 'r'
            comptype = comptype or 'tar'
            if comptype in cls.OPEN_METH:
                func = getattr(cls, cls.OPEN_METH[comptype])
            else:
                raise CompressionError('unknown compression type %r' % comptype)
            return func(name, filemode, fileobj)
        elif '|' in mode:
            (filemode, comptype) = mode.split('|', 1)
            filemode = filemode or 'r'
            comptype = comptype or 'tar'
            if filemode not in 'rw':
                raise ValueError("mode must be 'r' or 'w'")
            t = cls(name, filemode, _Stream(name, filemode, comptype, fileobj, bufsize))
            t._extfileobj = False
            return t
        elif mode in 'aw':
            return cls.taropen(name, mode, fileobj)
        raise ValueError('undiscernible mode')
        return

    @classmethod
    def taropen(cls, name, mode='r', fileobj=None):
        """Open uncompressed tar archive name for reading or writing.
        """
        if len(mode) > 1 or mode not in 'raw':
            raise ValueError("mode must be 'r', 'a' or 'w'")
        return cls(name, mode, fileobj)

    @classmethod
    def gzopen(cls, name, mode='r', fileobj=None, compresslevel=9):
        """Open gzip compressed tar archive name for reading or writing.
           Appending is not allowed.
        """
        if len(mode) > 1 or mode not in 'rw':
            raise ValueError("mode must be 'r' or 'w'")
        try:
            import gzip
            gzip.GzipFile
        except (ImportError, AttributeError):
            raise CompressionError('gzip module is not available')

        if fileobj is None:
            fileobj = file(name, mode + 'b')
        try:
            t = cls.taropen(name, mode, gzip.GzipFile(name, mode, compresslevel, fileobj))
        except IOError:
            raise ReadError('not a gzip file')

        t._extfileobj = False
        return t

    @classmethod
    def bz2open(cls, name, mode='r', fileobj=None, compresslevel=9):
        """Open bzip2 compressed tar archive name for reading or writing.
           Appending is not allowed.
        """
        if len(mode) > 1 or mode not in 'rw':
            raise ValueError("mode must be 'r' or 'w'.")
        try:
            import bz2
        except ImportError:
            raise CompressionError('bz2 module is not available')

        if fileobj is not None:
            fileobj = _BZ2Proxy(fileobj, mode)
        else:
            fileobj = bz2.BZ2File(name, mode, compresslevel=compresslevel)
        try:
            t = cls.taropen(name, mode, fileobj)
        except IOError:
            raise ReadError('not a bzip2 file')

        t._extfileobj = False
        return t

    OPEN_METH = {'tar': 'taropen', 
       'gz': 'gzopen', 
       'bz2': 'bz2open'}

    def close(self):
        """Close the TarFile. In write-mode, two finishing zero blocks are
           appended to the archive.
        """
        if self.closed:
            return
        if self._mode in 'aw':
            self.fileobj.write(NUL * (BLOCKSIZE * 2))
            self.offset += BLOCKSIZE * 2
            (blocks, remainder) = divmod(self.offset, RECORDSIZE)
            if remainder > 0:
                self.fileobj.write(NUL * (RECORDSIZE - remainder))
        if not self._extfileobj:
            self.fileobj.close()
        self.closed = True

    def getmember(self, name):
        """Return a TarInfo object for member `name'. If `name' can not be
           found in the archive, KeyError is raised. If a member occurs more
           than once in the archive, its last occurence is assumed to be the
           most up-to-date version.
        """
        tarinfo = self._getmember(name)
        if tarinfo is None:
            raise KeyError('filename %r not found' % name)
        return tarinfo

    def getmembers(self):
        """Return the members of the archive as a list of TarInfo objects. The
           list has the same order as the members in the archive.
        """
        self._check()
        if not self._loaded:
            self._load()
        return self.members

    def getnames(self):
        """Return the members of the archive as a list of their names. It has
           the same order as the list returned by getmembers().
        """
        return [ tarinfo.name for tarinfo in self.getmembers() ]

    def gettarinfo(self, name=None, arcname=None, fileobj=None):
        """Create a TarInfo object for either the file `name' or the file
           object `fileobj' (using os.fstat on its file descriptor). You can
           modify some of the TarInfo's attributes before you add it using
           addfile(). If given, `arcname' specifies an alternative name for the
           file in the archive.
        """
        self._check('aw')
        if fileobj is not None:
            name = fileobj.name
        if arcname is None:
            arcname = name
        arcname = normpath(arcname)
        (drv, arcname) = os.path.splitdrive(arcname)
        while arcname[0:1] == '/':
            arcname = arcname[1:]

        tarinfo = TarInfo()
        if fileobj is None:
            if hasattr(os, 'lstat') and not self.dereference:
                statres = os.lstat(name)
            else:
                statres = os.stat(name)
        else:
            statres = os.fstat(fileobj.fileno())
        linkname = ''
        stmd = statres.st_mode
        if stat.S_ISREG(stmd):
            inode = (
             statres.st_ino, statres.st_dev)
            if not self.dereference and statres.st_nlink > 1 and inode in self.inodes:
                type = LNKTYPE
                linkname = self.inodes[inode]
            else:
                type = REGTYPE
                if inode[0]:
                    self.inodes[inode] = arcname
        elif stat.S_ISDIR(stmd):
            type = DIRTYPE
            if arcname[-1:] != '/':
                arcname += '/'
        elif stat.S_ISFIFO(stmd):
            type = FIFOTYPE
        elif stat.S_ISLNK(stmd):
            type = SYMTYPE
            linkname = os.readlink(name)
        elif stat.S_ISCHR(stmd):
            type = CHRTYPE
        elif stat.S_ISBLK(stmd):
            type = BLKTYPE
        else:
            return
        tarinfo.name = arcname
        tarinfo.mode = stmd
        tarinfo.uid = statres.st_uid
        tarinfo.gid = statres.st_gid
        if stat.S_ISREG(stmd):
            tarinfo.size = statres.st_size
        else:
            tarinfo.size = 0L
        tarinfo.mtime = statres.st_mtime
        tarinfo.type = type
        tarinfo.linkname = linkname
        if pwd:
            try:
                tarinfo.uname = pwd.getpwuid(tarinfo.uid)[0]
            except KeyError:
                pass

        if grp:
            try:
                tarinfo.gname = grp.getgrgid(tarinfo.gid)[0]
            except KeyError:
                pass

        if type in (CHRTYPE, BLKTYPE):
            if hasattr(os, 'major') and hasattr(os, 'minor'):
                tarinfo.devmajor = os.major(statres.st_rdev)
                tarinfo.devminor = os.minor(statres.st_rdev)
        return tarinfo

    def list(self, verbose=True):
        """Print a table of contents to sys.stdout. If `verbose' is False, only
           the names of the members are printed. If it is True, an `ls -l'-like
           output is produced.
        """
        self._check()
        for tarinfo in self:
            if verbose:
                print filemode(tarinfo.mode),
                print '%s/%s' % (tarinfo.uname or tarinfo.uid,
                 tarinfo.gname or tarinfo.gid),
                if tarinfo.ischr() or tarinfo.isblk():
                    print '%10s' % ('%d,%d' % (
                     tarinfo.devmajor, tarinfo.devminor)),
                else:
                    print '%10d' % tarinfo.size,
                print '%d-%02d-%02d %02d:%02d:%02d' % time.localtime(tarinfo.mtime)[:6],
            print tarinfo.name,
            if verbose:
                if tarinfo.issym():
                    print '->', tarinfo.linkname,
                if tarinfo.islnk():
                    print 'link to', tarinfo.linkname,
            print

    def add(self, name, arcname=None, recursive=True):
        """Add the file `name' to the archive. `name' may be any type of file
           (directory, fifo, symbolic link, etc.). If given, `arcname'
           specifies an alternative name for the file in the archive.
           Directories are added recursively by default. This can be avoided by
           setting `recursive' to False.
        """
        self._check('aw')
        if arcname is None:
            arcname = name
        if self.name is not None and os.path.abspath(name) == self.name:
            self._dbg(2, 'tarfile: Skipped %r' % name)
            return
        if name == '.':
            if recursive:
                if arcname == '.':
                    arcname = ''
                for f in os.listdir('.'):
                    self.add(f, os.path.join(arcname, f))

            return
        self._dbg(1, name)
        tarinfo = self.gettarinfo(name, arcname)
        if tarinfo is None:
            self._dbg(1, 'tarfile: Unsupported type %r' % name)
            return
        if tarinfo.isreg():
            f = file(name, 'rb')
            self.addfile(tarinfo, f)
            f.close()
        elif tarinfo.isdir():
            self.addfile(tarinfo)
            if recursive:
                for f in os.listdir(name):
                    self.add(os.path.join(name, f), os.path.join(arcname, f))

        else:
            self.addfile(tarinfo)
        return

    def addfile(self, tarinfo, fileobj=None):
        """Add the TarInfo object `tarinfo' to the archive. If `fileobj' is
           given, tarinfo.size bytes are read from it and added to the archive.
           You can create TarInfo objects using gettarinfo().
           On Windows platforms, `fileobj' should always be opened with mode
           'rb' to avoid irritation about the file size.
        """
        self._check('aw')
        tarinfo = copy.copy(tarinfo)
        buf = tarinfo.tobuf(self.posix)
        self.fileobj.write(buf)
        self.offset += len(buf)
        if fileobj is not None:
            copyfileobj(fileobj, self.fileobj, tarinfo.size)
            (blocks, remainder) = divmod(tarinfo.size, BLOCKSIZE)
            if remainder > 0:
                self.fileobj.write(NUL * (BLOCKSIZE - remainder))
                blocks += 1
            self.offset += blocks * BLOCKSIZE
        self.members.append(tarinfo)
        return

    def extractall(self, path='.', members=None):
        """Extract all members from the archive to the current working
           directory and set owner, modification time and permissions on
           directories afterwards. `path' specifies a different directory
           to extract to. `members' is optional and must be a subset of the
           list returned by getmembers().
        """
        directories = []
        if members is None:
            members = self
        for tarinfo in members:
            if tarinfo.isdir():
                directories.append(tarinfo)
                tarinfo = copy.copy(tarinfo)
                tarinfo.mode = 448
            self.extract(tarinfo, path)

        directories.sort((lambda a, b: cmp(a.name, b.name)))
        directories.reverse()
        for tarinfo in directories:
            dirpath = os.path.join(path, tarinfo.name)
            try:
                self.chown(tarinfo, dirpath)
                self.utime(tarinfo, dirpath)
                self.chmod(tarinfo, dirpath)
            except ExtractError, e:
                if self.errorlevel > 1:
                    raise
                else:
                    self._dbg(1, 'tarfile: %s' % e)

        return

    def extract(self, member, path=''):
        """Extract a member from the archive to the current working directory,
           using its full name. Its file information is extracted as accurately
           as possible. `member' may be a filename or a TarInfo object. You can
           specify a different directory using `path'.
        """
        self._check('r')
        if isinstance(member, TarInfo):
            tarinfo = member
        else:
            tarinfo = self.getmember(member)
        if tarinfo.islnk():
            tarinfo._link_target = os.path.join(path, tarinfo.linkname)
        try:
            self._extract_member(tarinfo, os.path.join(path, tarinfo.name))
        except EnvironmentError, e:
            if self.errorlevel > 0:
                raise
            elif e.filename is None:
                self._dbg(1, 'tarfile: %s' % e.strerror)
            else:
                self._dbg(1, 'tarfile: %s %r' % (e.strerror, e.filename))
        except ExtractError, e:
            if self.errorlevel > 1:
                raise
            else:
                self._dbg(1, 'tarfile: %s' % e)

        return

    def extractfile(self, member):
        """Extract a member from the archive as a file object. `member' may be
           a filename or a TarInfo object. If `member' is a regular file, a
           file-like object is returned. If `member' is a link, a file-like
           object is constructed from the link's target. If `member' is none of
           the above, None is returned.
           The file-like object is read-only and provides the following
           methods: read(), readline(), readlines(), seek() and tell()
        """
        self._check('r')
        if isinstance(member, TarInfo):
            tarinfo = member
        else:
            tarinfo = self.getmember(member)
        if tarinfo.isreg():
            return self.fileobject(self, tarinfo)
        elif tarinfo.type not in SUPPORTED_TYPES:
            return self.fileobject(self, tarinfo)
        elif tarinfo.islnk() or tarinfo.issym():
            if isinstance(self.fileobj, _Stream):
                raise StreamError('cannot extract (sym)link as file object')
            else:
                return self.extractfile(self._getmember(tarinfo.linkname, tarinfo))
        else:
            return
        return

    def _extract_member(self, tarinfo, targetpath):
        """Extract the TarInfo object tarinfo to a physical
           file called targetpath.
        """
        if targetpath[-1:] == '/':
            targetpath = targetpath[:-1]
        targetpath = os.path.normpath(targetpath)
        upperdirs = os.path.dirname(targetpath)
        if upperdirs and not os.path.exists(upperdirs):
            os.makedirs(upperdirs)
        if tarinfo.islnk() or tarinfo.issym():
            self._dbg(1, '%s -> %s' % (tarinfo.name, tarinfo.linkname))
        else:
            self._dbg(1, tarinfo.name)
        if tarinfo.isreg():
            self.makefile(tarinfo, targetpath)
        elif tarinfo.isdir():
            self.makedir(tarinfo, targetpath)
        elif tarinfo.isfifo():
            self.makefifo(tarinfo, targetpath)
        elif tarinfo.ischr() or tarinfo.isblk():
            self.makedev(tarinfo, targetpath)
        elif tarinfo.islnk() or tarinfo.issym():
            self.makelink(tarinfo, targetpath)
        elif tarinfo.type not in SUPPORTED_TYPES:
            self.makeunknown(tarinfo, targetpath)
        else:
            self.makefile(tarinfo, targetpath)
        self.chown(tarinfo, targetpath)
        if not tarinfo.issym():
            self.chmod(tarinfo, targetpath)
            self.utime(tarinfo, targetpath)

    def makedir(self, tarinfo, targetpath):
        """Make a directory called targetpath.
        """
        try:
            os.mkdir(targetpath, 448)
        except EnvironmentError, e:
            if e.errno != errno.EEXIST:
                raise

    def makefile(self, tarinfo, targetpath):
        """Make a file called targetpath.
        """
        source = self.extractfile(tarinfo)
        target = file(targetpath, 'wb')
        copyfileobj(source, target)
        source.close()
        target.close()

    def makeunknown(self, tarinfo, targetpath):
        """Make a file from a TarInfo object with an unknown type
           at targetpath.
        """
        self.makefile(tarinfo, targetpath)
        self._dbg(1, 'tarfile: Unknown file type %r, extracted as regular file.' % tarinfo.type)

    def makefifo(self, tarinfo, targetpath):
        """Make a fifo called targetpath.
        """
        if hasattr(os, 'mkfifo'):
            os.mkfifo(targetpath)
        else:
            raise ExtractError('fifo not supported by system')

    def makedev(self, tarinfo, targetpath):
        """Make a character or block device called targetpath.
        """
        if not hasattr(os, 'mknod') or not hasattr(os, 'makedev'):
            raise ExtractError('special devices not supported by system')
        mode = tarinfo.mode
        if tarinfo.isblk():
            mode |= stat.S_IFBLK
        else:
            mode |= stat.S_IFCHR
        os.mknod(targetpath, mode, os.makedev(tarinfo.devmajor, tarinfo.devminor))

    def makelink(self, tarinfo, targetpath):
        """Make a (symbolic) link called targetpath. If it cannot be created
          (platform limitation), we try to make a copy of the referenced file
          instead of a link.
        """
        linkpath = tarinfo.linkname
        try:
            if tarinfo.issym():
                os.symlink(linkpath, targetpath)
            else:
                os.link(tarinfo._link_target, targetpath)
        except AttributeError:
            if tarinfo.issym():
                linkpath = os.path.join(os.path.dirname(tarinfo.name), linkpath)
                linkpath = normpath(linkpath)
            try:
                self._extract_member(self.getmember(linkpath), targetpath)
            except (EnvironmentError, KeyError), e:
                linkpath = os.path.normpath(linkpath)
                try:
                    shutil.copy2(linkpath, targetpath)
                except EnvironmentError, e:
                    raise IOError('link could not be created')

    def chown(self, tarinfo, targetpath):
        """Set owner of targetpath according to tarinfo.
        """
        if pwd and hasattr(os, 'geteuid') and os.geteuid() == 0:
            try:
                g = grp.getgrnam(tarinfo.gname)[2]
            except KeyError:
                try:
                    g = grp.getgrgid(tarinfo.gid)[2]
                except KeyError:
                    g = os.getgid()

            else:
                try:
                    u = pwd.getpwnam(tarinfo.uname)[2]
                except KeyError:
                    try:
                        u = pwd.getpwuid(tarinfo.uid)[2]
                    except KeyError:
                        u = os.getuid()

                else:
                    try:
                        if tarinfo.issym() and hasattr(os, 'lchown'):
                            os.lchown(targetpath, u, g)
                        elif sys.platform != 'os2emx':
                            os.chown(targetpath, u, g)
                    except EnvironmentError, e:
                        raise ExtractError('could not change owner')

    def chmod(self, tarinfo, targetpath):
        """Set file permissions of targetpath according to tarinfo.
        """
        if hasattr(os, 'chmod'):
            try:
                os.chmod(targetpath, tarinfo.mode)
            except EnvironmentError, e:
                raise ExtractError('could not change mode')

    def utime(self, tarinfo, targetpath):
        """Set modification time of targetpath according to tarinfo.
        """
        if not hasattr(os, 'utime'):
            return
        if sys.platform == 'win32' and tarinfo.isdir():
            return
        try:
            os.utime(targetpath, (tarinfo.mtime, tarinfo.mtime))
        except EnvironmentError, e:
            raise ExtractError('could not change modification time')

    def next(self):
        """Return the next member of the archive as a TarInfo object, when
           TarFile is opened for reading. Return None if there is no more
           available.
        """
        self._check('ra')
        if self.firstmember is not None:
            m = self.firstmember
            self.firstmember = None
            return m
        self.fileobj.seek(self.offset)
        while True:
            buf = self.fileobj.read(BLOCKSIZE)
            if not buf:
                return
            try:
                tarinfo = TarInfo.frombuf(buf)
                tarinfo.offset = self.offset
                self.offset += BLOCKSIZE
                tarinfo = self.proc_member(tarinfo)
            except ValueError, e:
                if self.ignore_zeros:
                    self._dbg(2, '0x%X: empty or invalid block: %s' % (
                     self.offset, e))
                    self.offset += BLOCKSIZE
                    continue
                else:
                    if self.offset == 0:
                        raise ReadError('empty, unreadable or compressed file: %s' % e)
                    return

            break

        if tarinfo.isreg() and tarinfo.name.endswith('/'):
            tarinfo.type = DIRTYPE
        if tarinfo.isdir() and not tarinfo.name.endswith('/'):
            tarinfo.name += '/'
        self.members.append(tarinfo)
        return tarinfo

    def proc_member(self, tarinfo):
        """Choose the right processing method for tarinfo depending
           on its type and call it.
        """
        if tarinfo.type in (GNUTYPE_LONGNAME, GNUTYPE_LONGLINK):
            return self.proc_gnulong(tarinfo)
        elif tarinfo.type == GNUTYPE_SPARSE:
            return self.proc_sparse(tarinfo)
        else:
            return self.proc_builtin(tarinfo)

    def proc_builtin(self, tarinfo):
        """Process a builtin type member or an unknown member
           which will be treated as a regular file.
        """
        tarinfo.offset_data = self.offset
        if tarinfo.isreg() or tarinfo.type not in SUPPORTED_TYPES:
            self.offset += self._block(tarinfo.size)
        return tarinfo

    def proc_gnulong(self, tarinfo):
        """Process the blocks that hold a GNU longname
           or longlink member.
        """
        buf = ''
        count = tarinfo.size
        while count > 0:
            block = self.fileobj.read(BLOCKSIZE)
            buf += block
            self.offset += BLOCKSIZE
            count -= BLOCKSIZE

        b = self.fileobj.read(BLOCKSIZE)
        t = TarInfo.frombuf(b)
        t.offset = self.offset
        self.offset += BLOCKSIZE
        next = self.proc_member(t)
        next.offset = tarinfo.offset
        if tarinfo.type == GNUTYPE_LONGNAME:
            next.name = nts(buf)
        elif tarinfo.type == GNUTYPE_LONGLINK:
            next.linkname = nts(buf)
        return next

    def proc_sparse(self, tarinfo):
        """Process a GNU sparse header plus extra headers.
        """
        buf = tarinfo.buf
        sp = _ringbuffer()
        pos = 386
        lastpos = 0L
        realpos = 0L
        for i in xrange(4):
            try:
                offset = nti(buf[pos:pos + 12])
                numbytes = nti(buf[pos + 12:pos + 24])
            except ValueError:
                break

            if offset > lastpos:
                sp.append(_hole(lastpos, offset - lastpos))
            sp.append(_data(offset, numbytes, realpos))
            realpos += numbytes
            lastpos = offset + numbytes
            pos += 24

        isextended = ord(buf[482])
        origsize = nti(buf[483:495])
        while isextended == 1:
            buf = self.fileobj.read(BLOCKSIZE)
            self.offset += BLOCKSIZE
            pos = 0
            for i in xrange(21):
                try:
                    offset = nti(buf[pos:pos + 12])
                    numbytes = nti(buf[pos + 12:pos + 24])
                except ValueError:
                    break

                if offset > lastpos:
                    sp.append(_hole(lastpos, offset - lastpos))
                sp.append(_data(offset, numbytes, realpos))
                realpos += numbytes
                lastpos = offset + numbytes
                pos += 24

            isextended = ord(buf[504])

        if lastpos < origsize:
            sp.append(_hole(lastpos, origsize - lastpos))
        tarinfo.sparse = sp
        tarinfo.offset_data = self.offset
        self.offset += self._block(tarinfo.size)
        tarinfo.size = origsize
        return tarinfo

    def _block(self, count):
        """Round up a byte count by BLOCKSIZE and return it,
           e.g. _block(834) => 1024.
        """
        (blocks, remainder) = divmod(count, BLOCKSIZE)
        if remainder:
            blocks += 1
        return blocks * BLOCKSIZE

    def _getmember(self, name, tarinfo=None):
        """Find an archive member by name from bottom to top.
           If tarinfo is given, it is used as the starting point.
        """
        members = self.getmembers()
        if tarinfo is None:
            end = len(members)
        else:
            end = members.index(tarinfo)
        for i in xrange(end - 1, -1, -1):
            if name == members[i].name:
                return members[i]

        return

    def _load(self):
        """Read through the entire archive file and look for readable
           members.
        """
        while True:
            tarinfo = self.next()
            if tarinfo is None:
                break

        self._loaded = True
        return

    def _check(self, mode=None):
        """Check if TarFile is still open, and if the operation's mode
           corresponds to TarFile's mode.
        """
        if self.closed:
            raise IOError('%s is closed' % self.__class__.__name__)
        if mode is not None and self._mode not in mode:
            raise IOError('bad operation for mode %r' % self._mode)
        return

    def __iter__(self):
        """Provide an iterator object.
        """
        if self._loaded:
            return iter(self.members)
        else:
            return TarIter(self)

    def _dbg(self, level, msg):
        """Write debugging output to sys.stderr.
        """
        if level <= self.debug:
            print >> sys.stderr, msg


class TarIter():
    """Iterator Class.

       for tarinfo in TarFile(...):
           suite...
    """

    def __init__(self, tarfile):
        """Construct a TarIter object.
        """
        self.tarfile = tarfile
        self.index = 0

    def __iter__(self):
        """Return iterator object.
        """
        return self

    def next(self):
        """Return the next item using TarFile's next() method.
           When all members have been read, set TarFile as _loaded.
        """
        if not self.tarfile._loaded:
            tarinfo = self.tarfile.next()
            if not tarinfo:
                self.tarfile._loaded = True
                raise StopIteration
        else:
            try:
                tarinfo = self.tarfile.members[self.index]
            except IndexError:
                raise StopIteration

        self.index += 1
        return tarinfo


class _section():
    """Base class for _data and _hole.
    """

    def __init__(self, offset, size):
        self.offset = offset
        self.size = size

    def __contains__(self, offset):
        return self.offset <= offset < self.offset + self.size


class _data(_section):
    """Represent a data section in a sparse file.
    """

    def __init__(self, offset, size, realpos):
        _section.__init__(self, offset, size)
        self.realpos = realpos


class _hole(_section):
    """Represent a hole section in a sparse file.
    """
    pass


class _ringbuffer(list):
    """Ringbuffer class which increases performance
       over a regular list.
    """

    def __init__(self):
        self.idx = 0

    def find(self, offset):
        idx = self.idx
        while True:
            item = self[idx]
            if offset in item:
                break
            idx += 1
            if idx == len(self):
                idx = 0
            if idx == self.idx:
                return

        self.idx = idx
        return item


TAR_PLAIN = 0
TAR_GZIPPED = 8

class TarFileCompat():
    """TarFile class compatible with standard module zipfile's
       ZipFile class.
    """

    def __init__(self, file, mode='r', compression=TAR_PLAIN):
        if compression == TAR_PLAIN:
            self.tarfile = TarFile.taropen(file, mode)
        elif compression == TAR_GZIPPED:
            self.tarfile = TarFile.gzopen(file, mode)
        else:
            raise ValueError('unknown compression constant')
        if mode[0:1] == 'r':
            members = self.tarfile.getmembers()
            for m in members:
                m.filename = m.name
                m.file_size = m.size
                m.date_time = time.gmtime(m.mtime)[:6]

    def namelist(self):
        return map((lambda m: m.name), self.infolist())

    def infolist(self):
        return filter((lambda m: m.type in REGULAR_TYPES), self.tarfile.getmembers())

    def printdir(self):
        self.tarfile.list()

    def testzip(self):
        pass

    def getinfo(self, name):
        return self.tarfile.getmember(name)

    def read(self, name):
        return self.tarfile.extractfile(self.tarfile.getmember(name)).read()

    def write(self, filename, arcname=None, compress_type=None):
        self.tarfile.add(filename, arcname)

    def writestr(self, zinfo, bytes):
        try:
            from cStringIO import StringIO
        except ImportError:
            from StringIO import StringIO

        import calendar
        zinfo.name = zinfo.filename
        zinfo.size = zinfo.file_size
        zinfo.mtime = calendar.timegm(zinfo.date_time)
        self.tarfile.addfile(zinfo, StringIO(bytes))

    def close(self):
        self.tarfile.close()


def is_tarfile(name):
    """Return True if name points to a tar archive that we
       are able to handle, else return False.
    """
    try:
        t = open(name)
        t.close()
        return True
    except TarError:
        return False


open = TarFile.open