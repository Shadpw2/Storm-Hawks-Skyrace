# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/fileinput.py
# Compiled at: 2008-12-16 09:37:43
"""Helper class to quickly write a loop over all standard input files.

Typical use is:

    import fileinput
    for line in fileinput.input():
        process(line)

This iterates over the lines of all files listed in sys.argv[1:],
defaulting to sys.stdin if the list is empty.  If a filename is '-' it
is also replaced by sys.stdin.  To specify an alternative list of
filenames, pass it as the argument to input().  A single file name is
also allowed.

Functions filename(), lineno() return the filename and cumulative line
number of the line that has just been read; filelineno() returns its
line number in the current file; isfirstline() returns true iff the
line just read is the first line of its file; isstdin() returns true
iff the line was read from sys.stdin.  Function nextfile() closes the
current file so that the next iteration will read the first line from
the next file (if any); lines not read from the file will not count
towards the cumulative line count; the filename is not changed until
after the first line of the next file has been read.  Function close()
closes the sequence.

Before any lines have been read, filename() returns None and both line
numbers are zero; nextfile() has no effect.  After all lines have been
read, filename() and the line number functions return the values
pertaining to the last line read; nextfile() has no effect.

All files are opened in text mode by default, you can override this by
setting the mode parameter to input() or FileInput.__init__().
If an I/O error occurs during opening or reading a file, the IOError
exception is raised.

If sys.stdin is used more than once, the second and further use will
return no lines, except perhaps for interactive use, or if it has been
explicitly reset (e.g. using sys.stdin.seek(0)).

Empty files are opened and immediately closed; the only time their
presence in the list of filenames is noticeable at all is when the
last file opened is empty.

It is possible that the last line of a file doesn't end in a newline
character; otherwise lines are returned including the trailing
newline.

Class FileInput is the implementation; its methods filename(),
lineno(), fileline(), isfirstline(), isstdin(), nextfile() and close()
correspond to the functions in the module.  In addition it has a
readline() method which returns the next input line, and a
__getitem__() method which implements the sequence behavior.  The
sequence must be accessed in strictly sequential order; sequence
access and readline() cannot be mixed.

Optional in-place filtering: if the keyword argument inplace=1 is
passed to input() or to the FileInput constructor, the file is moved
to a backup file and standard output is directed to the input file.
This makes it possible to write a filter that rewrites its input file
in place.  If the keyword argument backup=".<some extension>" is also
given, it specifies the extension for the backup file, and the backup
file remains around; by default, the extension is ".bak" and it is
deleted when the output file is closed.  In-place filtering is
disabled when standard input is read.  XXX The current implementation
does not work for MS-DOS 8+3 filesystems.

Performance: this module is unfortunately one of the slower ways of
processing large numbers of input lines.  Nevertheless, a significant
speed-up has been obtained by using readlines(bufsize) instead of
readline().  A new keyword argument, bufsize=N, is present on the
input() function and the FileInput() class to override the default
buffer size.

XXX Possible additions:

- optional getopt argument processing
- isatty()
- read(), read(size), even readlines()

"""
import sys, os
__all__ = [
 'input', 'close', 'nextfile', 'filename', 'lineno', 'filelineno', 
 'isfirstline', 
 'isstdin', 'FileInput']
_state = None
DEFAULT_BUFSIZE = 8192

def input(files=None, inplace=0, backup='', bufsize=0, mode='r', openhook=None):
    """input([files[, inplace[, backup[, mode[, openhook]]]]])

    Create an instance of the FileInput class. The instance will be used
    as global state for the functions of this module, and is also returned
    to use during iteration. The parameters to this function will be passed
    along to the constructor of the FileInput class.
    """
    global _state
    if _state and _state._file:
        raise RuntimeError, 'input() already active'
    _state = FileInput(files, inplace, backup, bufsize, mode, openhook)
    return _state


def close():
    """Close the sequence."""
    global _state
    state = _state
    _state = None
    if state:
        state.close()
    return


def nextfile():
    """
    Close the current file so that the next iteration will read the first
    line from the next file (if any); lines not read from the file will
    not count towards the cumulative line count. The filename is not
    changed until after the first line of the next file has been read.
    Before the first line has been read, this function has no effect;
    it cannot be used to skip the first file. After the last line of the
    last file has been read, this function has no effect.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.nextfile()


def filename():
    """
    Return the name of the file currently being read.
    Before the first line has been read, returns None.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.filename()


def lineno():
    """
    Return the cumulative line number of the line that has just been read.
    Before the first line has been read, returns 0. After the last line
    of the last file has been read, returns the line number of that line.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.lineno()


def filelineno():
    """
    Return the line number in the current file. Before the first line
    has been read, returns 0. After the last line of the last file has
    been read, returns the line number of that line within the file.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.filelineno()


def fileno():
    """
    Return the file number of the current file. When no file is currently
    opened, returns -1.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.fileno()


def isfirstline():
    """
    Returns true the line just read is the first line of its file,
    otherwise returns false.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.isfirstline()


def isstdin():
    """
    Returns true if the last line was read from sys.stdin,
    otherwise returns false.
    """
    if not _state:
        raise RuntimeError, 'no active input()'
    return _state.isstdin()


class FileInput:
    """class FileInput([files[, inplace[, backup[, mode[, openhook]]]]])

    Class FileInput is the implementation of the module; its methods
    filename(), lineno(), fileline(), isfirstline(), isstdin(), fileno(),
    nextfile() and close() correspond to the functions of the same name
    in the module.
    In addition it has a readline() method which returns the next
    input line, and a __getitem__() method which implements the
    sequence behavior. The sequence must be accessed in strictly
    sequential order; random access and readline() cannot be mixed.
    """

    def __init__(self, files=None, inplace=0, backup='', bufsize=0, mode='r', openhook=None):
        if isinstance(files, basestring):
            files = (
             files,)
        else:
            if files is None:
                files = sys.argv[1:]
            if not files:
                files = ('-', )
            else:
                files = tuple(files)
        self._files = files
        self._inplace = inplace
        self._backup = backup
        self._bufsize = bufsize or DEFAULT_BUFSIZE
        self._savestdout = None
        self._output = None
        self._filename = None
        self._lineno = 0
        self._filelineno = 0
        self._file = None
        self._isstdin = False
        self._backupfilename = None
        self._buffer = []
        self._bufindex = 0
        if mode not in ('r', 'rU', 'U', 'rb'):
            raise ValueError("FileInput opening mode must be one of 'r', 'rU', 'U' and 'rb'")
        self._mode = mode
        if inplace and openhook:
            raise ValueError('FileInput cannot use an opening hook in inplace mode')
        elif openhook and not callable(openhook):
            raise ValueError('FileInput openhook must be callable')
        self._openhook = openhook
        return

    def __del__(self):
        self.close()

    def close(self):
        self.nextfile()
        self._files = ()

    def __iter__(self):
        return self

    def next(self):
        try:
            line = self._buffer[self._bufindex]
        except IndexError:
            pass
        else:
            self._bufindex += 1
            self._lineno += 1
            self._filelineno += 1
            return line

        line = self.readline()
        if not line:
            raise StopIteration
        return line

    def __getitem__(self, i):
        if i != self._lineno:
            raise RuntimeError, 'accessing lines out of order'
        try:
            return self.next()
        except StopIteration:
            raise IndexError, 'end of input reached'

    def nextfile(self):
        savestdout = self._savestdout
        self._savestdout = 0
        if savestdout:
            sys.stdout = savestdout
        output = self._output
        self._output = 0
        if output:
            output.close()
        file = self._file
        self._file = 0
        if file and not self._isstdin:
            file.close()
        backupfilename = self._backupfilename
        self._backupfilename = 0
        if backupfilename and not self._backup:
            try:
                os.unlink(backupfilename)
            except OSError:
                pass

        self._isstdin = False
        self._buffer = []
        self._bufindex = 0

    def readline--- This code section failed: ---

 L. 293         0  SETUP_EXCEPT         20  'to 23'

 L. 294         3  LOAD_FAST             0  'self'
                6  LOAD_ATTR             0  '_buffer'
                9  LOAD_FAST             0  'self'
               12  LOAD_ATTR             1  '_bufindex'
               15  BINARY_SUBSCR    
               16  STORE_FAST            1  'line'
               19  POP_BLOCK        
               20  JUMP_FORWARD         19  'to 42'
             23_0  COME_FROM             0  '0'

 L. 295        23  DUP_TOP          
               24  LOAD_GLOBAL           2  'IndexError'
               27  COMPARE_OP           10  exception-match
               30  JUMP_IF_FALSE         7  'to 40'
               33  POP_TOP          
               34  POP_TOP          
               35  POP_TOP          
               36  POP_TOP          

 L. 296        37  JUMP_FORWARD         51  'to 91'
               40  POP_TOP          
               41  END_FINALLY      
             42_0  COME_FROM            20  '20'

 L. 298        42  LOAD_FAST             0  'self'
               45  DUP_TOP          
               46  LOAD_ATTR             1  '_bufindex'
               49  LOAD_CONST               1
               52  INPLACE_ADD      
               53  ROT_TWO          
               54  STORE_ATTR            1  '_bufindex'

 L. 299        57  LOAD_FAST             0  'self'
               60  DUP_TOP          
               61  LOAD_ATTR             3  '_lineno'
               64  LOAD_CONST               1
               67  INPLACE_ADD      
               68  ROT_TWO          
               69  STORE_ATTR            3  '_lineno'

 L. 300        72  LOAD_FAST             0  'self'
               75  DUP_TOP          
               76  LOAD_ATTR             4  '_filelineno'
               79  LOAD_CONST               1
               82  INPLACE_ADD      
               83  ROT_TWO          
               84  STORE_ATTR            4  '_filelineno'

 L. 301        87  LOAD_FAST             1  'line'
               90  RETURN_VALUE     
             91_0  COME_FROM            37  '37'

 L. 302        91  LOAD_FAST             0  'self'
               94  LOAD_ATTR             5  '_file'
               97  JUMP_IF_TRUE        568  'to 668'
              100  POP_TOP          

 L. 303       101  LOAD_FAST             0  'self'
              104  LOAD_ATTR             6  '_files'
              107  JUMP_IF_TRUE          8  'to 118'
            110_0  THEN                     119
              110  POP_TOP          

 L. 304       111  LOAD_CONST               ''
              114  RETURN_VALUE     
              115  JUMP_FORWARD          1  'to 119'
            118_0  COME_FROM           107  '107'
              118  POP_TOP          
            119_0  COME_FROM           115  '115'

 L. 305       119  LOAD_FAST             0  'self'
              122  LOAD_ATTR             6  '_files'
              125  LOAD_CONST               0
              128  BINARY_SUBSCR    
              129  LOAD_FAST             0  'self'
              132  STORE_ATTR            7  '_filename'

 L. 306       135  LOAD_FAST             0  'self'
              138  LOAD_ATTR             6  '_files'
              141  LOAD_CONST               1
              144  SLICE+1          
              145  LOAD_FAST             0  'self'
              148  STORE_ATTR            6  '_files'

 L. 307       151  LOAD_CONST               0
              154  LOAD_FAST             0  'self'
              157  STORE_ATTR            4  '_filelineno'

 L. 308       160  LOAD_CONST               None
              163  LOAD_FAST             0  'self'
              166  STORE_ATTR            5  '_file'

 L. 309       169  LOAD_GLOBAL           9  'False'
              172  LOAD_FAST             0  'self'
              175  STORE_ATTR           10  '_isstdin'

 L. 310       178  LOAD_CONST               0
              181  LOAD_FAST             0  'self'
              184  STORE_ATTR           11  '_backupfilename'

 L. 311       187  LOAD_FAST             0  'self'
              190  LOAD_ATTR             7  '_filename'
              193  LOAD_CONST               '-'
              196  COMPARE_OP            2  ==
              199  JUMP_IF_FALSE        34  'to 236'
              202  POP_TOP          

 L. 312       203  LOAD_CONST               '<stdin>'
              206  LOAD_FAST             0  'self'
              209  STORE_ATTR            7  '_filename'

 L. 313       212  LOAD_GLOBAL          12  'sys'
              215  LOAD_ATTR            13  'stdin'
              218  LOAD_FAST             0  'self'
              221  STORE_ATTR            5  '_file'

 L. 314       224  LOAD_GLOBAL          14  'True'
              227  LOAD_FAST             0  'self'
              230  STORE_ATTR           10  '_isstdin'
              233  JUMP_ABSOLUTE       669  'to 669'
            236_0  COME_FROM           199  '199'
              236  POP_TOP          

 L. 316       237  LOAD_FAST             0  'self'
              240  LOAD_ATTR            15  '_inplace'
              243  JUMP_IF_FALSE       353  'to 599'
              246  POP_TOP          

 L. 318       247  LOAD_FAST             0  'self'
              250  LOAD_ATTR             7  '_filename'
              253  LOAD_FAST             0  'self'
              256  LOAD_ATTR            16  '_backup'
              259  JUMP_IF_TRUE         11  'to 273'
              262  POP_TOP          
              263  LOAD_GLOBAL          17  'os'
              266  LOAD_ATTR            18  'extsep'
              269  LOAD_CONST               'bak'
              272  BINARY_ADD       
            273_0  COME_FROM           259  '259'
              273  BINARY_ADD       
              274  LOAD_FAST             0  'self'
              277  STORE_ATTR           11  '_backupfilename'

 L. 319       280  SETUP_EXCEPT         20  'to 303'
              283  LOAD_GLOBAL          17  'os'
              286  LOAD_ATTR            19  'unlink'
              289  LOAD_FAST             0  'self'
              292  LOAD_ATTR            11  '_backupfilename'
              295  CALL_FUNCTION_1       1  None
              298  POP_TOP          
              299  POP_BLOCK        
              300  JUMP_FORWARD         22  'to 325'
            303_0  COME_FROM           280  '280'

 L. 320       303  DUP_TOP          
              304  LOAD_GLOBAL          17  'os'
              307  LOAD_ATTR            20  'error'
              310  COMPARE_OP           10  exception-match
              313  JUMP_IF_FALSE         7  'to 323'
              316  POP_TOP          
              317  POP_TOP          
              318  POP_TOP          
              319  POP_TOP          
              320  JUMP_FORWARD          2  'to 325'
              323  POP_TOP          
              324  END_FINALLY      
            325_0  COME_FROM           320  '320'
            325_1  COME_FROM           300  '300'

 L. 322       325  LOAD_GLOBAL          17  'os'
              328  LOAD_ATTR            21  'rename'
              331  LOAD_FAST             0  'self'
              334  LOAD_ATTR             7  '_filename'
              337  LOAD_FAST             0  'self'
              340  LOAD_ATTR            11  '_backupfilename'
              343  CALL_FUNCTION_2       2  None
              346  POP_TOP          

 L. 323       347  LOAD_GLOBAL          22  'open'
              350  LOAD_FAST             0  'self'
              353  LOAD_ATTR            11  '_backupfilename'
              356  LOAD_FAST             0  'self'
              359  LOAD_ATTR            23  '_mode'
              362  CALL_FUNCTION_2       2  None
              365  LOAD_FAST             0  'self'
              368  STORE_ATTR            5  '_file'

 L. 324       371  SETUP_EXCEPT         31  'to 405'

 L. 325       374  LOAD_GLOBAL          17  'os'
              377  LOAD_ATTR            24  'fstat'
              380  LOAD_FAST             0  'self'
              383  LOAD_ATTR             5  '_file'
              386  LOAD_ATTR            25  'fileno'
              389  CALL_FUNCTION_0       0  None
              392  CALL_FUNCTION_1       1  None
              395  LOAD_ATTR            26  'st_mode'
              398  STORE_FAST            2  'perm'
              401  POP_BLOCK        
              402  JUMP_FORWARD         40  'to 445'
            405_0  COME_FROM           371  '371'

 L. 326       405  DUP_TOP          
              406  LOAD_GLOBAL          27  'OSError'
              409  COMPARE_OP           10  exception-match
              412  JUMP_IF_FALSE        28  'to 443'
              415  POP_TOP          
              416  POP_TOP          
              417  POP_TOP          
              418  POP_TOP          

 L. 327       419  LOAD_GLOBAL          22  'open'
              422  LOAD_FAST             0  'self'
              425  LOAD_ATTR             7  '_filename'
              428  LOAD_CONST               'w'
              431  CALL_FUNCTION_2       2  None
              434  LOAD_FAST             0  'self'
              437  STORE_ATTR           28  '_output'
              440  JUMP_FORWARD        129  'to 572'
              443  POP_TOP          
              444  END_FINALLY      
            445_0  COME_FROM           402  '402'

 L. 329       445  LOAD_GLOBAL          17  'os'
              448  LOAD_ATTR            22  'open'
              451  LOAD_FAST             0  'self'
              454  LOAD_ATTR             7  '_filename'

 L. 330       457  LOAD_GLOBAL          17  'os'
              460  LOAD_ATTR            29  'O_CREAT'
              463  LOAD_GLOBAL          17  'os'
              466  LOAD_ATTR            30  'O_WRONLY'
              469  BINARY_OR        
              470  LOAD_GLOBAL          17  'os'
              473  LOAD_ATTR            31  'O_TRUNC'
              476  BINARY_OR        

 L. 331       477  LOAD_FAST             2  'perm'
              480  CALL_FUNCTION_3       3  None
              483  STORE_FAST            3  'fd'

 L. 332       486  LOAD_GLOBAL          17  'os'
              489  LOAD_ATTR            32  'fdopen'
              492  LOAD_FAST             3  'fd'
              495  LOAD_CONST               'w'
              498  CALL_FUNCTION_2       2  None
              501  LOAD_FAST             0  'self'
              504  STORE_ATTR           28  '_output'

 L. 333       507  SETUP_EXCEPT         43  'to 553'

 L. 334       510  LOAD_GLOBAL          33  'hasattr'
              513  LOAD_GLOBAL          17  'os'
              516  LOAD_CONST               'chmod'
              519  CALL_FUNCTION_2       2  None
              522  JUMP_IF_FALSE        23  'to 548'
            525_0  THEN                     549
              525  POP_TOP          

 L. 335       526  LOAD_GLOBAL          17  'os'
              529  LOAD_ATTR            34  'chmod'
              532  LOAD_FAST             0  'self'
              535  LOAD_ATTR             7  '_filename'
              538  LOAD_FAST             2  'perm'
              541  CALL_FUNCTION_2       2  None
              544  POP_TOP          
              545  JUMP_FORWARD          1  'to 549'
            548_0  COME_FROM           522  '522'
              548  POP_TOP          
            549_0  COME_FROM           545  '545'
              549  POP_BLOCK        
              550  JUMP_FORWARD         19  'to 572'
            553_0  COME_FROM           507  '507'

 L. 336       553  DUP_TOP          
              554  LOAD_GLOBAL          27  'OSError'
              557  COMPARE_OP           10  exception-match
              560  JUMP_IF_FALSE         7  'to 570'
              563  POP_TOP          
              564  POP_TOP          
              565  POP_TOP          
              566  POP_TOP          

 L. 337       567  JUMP_FORWARD          2  'to 572'
              570  POP_TOP          
              571  END_FINALLY      
            572_0  COME_FROM           567  '567'
            572_1  COME_FROM           550  '550'
            572_2  COME_FROM           440  '440'

 L. 338       572  LOAD_GLOBAL          12  'sys'
              575  LOAD_ATTR            35  'stdout'
              578  LOAD_FAST             0  'self'
              581  STORE_ATTR           36  '_savestdout'

 L. 339       584  LOAD_FAST             0  'self'
              587  LOAD_ATTR            28  '_output'
              590  LOAD_GLOBAL          12  'sys'
              593  STORE_ATTR           35  'stdout'
              596  JUMP_ABSOLUTE       669  'to 669'
            599_0  COME_FROM           243  '243'
              599  POP_TOP          

 L. 342       600  LOAD_FAST             0  'self'
              603  LOAD_ATTR            37  '_openhook'
              606  JUMP_IF_FALSE        31  'to 640'
              609  POP_TOP          

 L. 343       610  LOAD_FAST             0  'self'
              613  LOAD_ATTR            37  '_openhook'
              616  LOAD_FAST             0  'self'
              619  LOAD_ATTR             7  '_filename'
              622  LOAD_FAST             0  'self'
              625  LOAD_ATTR            23  '_mode'
              628  CALL_FUNCTION_2       2  None
              631  LOAD_FAST             0  'self'
              634  STORE_ATTR            5  '_file'
              637  JUMP_ABSOLUTE       669  'to 669'
            640_0  COME_FROM           606  '606'
              640  POP_TOP          

 L. 345       641  LOAD_GLOBAL          22  'open'
              644  LOAD_FAST             0  'self'
              647  LOAD_ATTR             7  '_filename'
              650  LOAD_FAST             0  'self'
              653  LOAD_ATTR            23  '_mode'
              656  CALL_FUNCTION_2       2  None
              659  LOAD_FAST             0  'self'
              662  STORE_ATTR            5  '_file'
              665  JUMP_FORWARD          1  'to 669'
            668_0  COME_FROM            97  '97'
              668  POP_TOP          
            669_0  COME_FROM           665  '665'

 L. 346       669  LOAD_FAST             0  'self'
              672  LOAD_ATTR             5  '_file'
              675  LOAD_ATTR            38  'readlines'
              678  LOAD_FAST             0  'self'
              681  LOAD_ATTR            39  '_bufsize'
              684  CALL_FUNCTION_1       1  None
              687  LOAD_FAST             0  'self'
              690  STORE_ATTR            0  '_buffer'

 L. 347       693  LOAD_CONST               0
              696  LOAD_FAST             0  'self'
              699  STORE_ATTR            1  '_bufindex'

 L. 348       702  LOAD_FAST             0  'self'
              705  LOAD_ATTR             0  '_buffer'
              708  JUMP_IF_TRUE         14  'to 725'
            711_0  THEN                     726
              711  POP_TOP          

 L. 349       712  LOAD_FAST             0  'self'
              715  LOAD_ATTR            40  'nextfile'
              718  CALL_FUNCTION_0       0  None
              721  POP_TOP          
              722  JUMP_FORWARD          1  'to 726'
            725_0  COME_FROM           708  '708'
              725  POP_TOP          
            726_0  COME_FROM           722  '722'

 L. 351       726  LOAD_FAST             0  'self'
              729  LOAD_ATTR            41  'readline'
              732  CALL_FUNCTION_0       0  None
              735  RETURN_VALUE     

Parse error at or near `LOAD_GLOBAL' instruction at offset 572

    def filename(self):
        return self._filename

    def lineno(self):
        return self._lineno

    def filelineno(self):
        return self._filelineno

    def fileno(self):
        if self._file:
            try:
                return self._file.fileno()
            except ValueError:
                return -1

        else:
            return -1

    def isfirstline(self):
        return self._filelineno == 1

    def isstdin(self):
        return self._isstdin


def hook_compressed(filename, mode):
    ext = os.path.splitext(filename)[1]
    if ext == '.gz':
        import gzip
        return gzip.open(filename, mode)
    elif ext == '.bz2':
        import bz2
        return bz2.BZ2File(filename, mode)
    else:
        return open(filename, mode)


def hook_encoded(encoding):
    import codecs

    def openhook(filename, mode):
        return codecs.open(filename, mode, encoding)

    return openhook


def _test():
    import getopt
    inplace = 0
    backup = 0
    (opts, args) = getopt.getopt(sys.argv[1:], 'ib:')
    for (o, a) in opts:
        if o == '-i':
            inplace = 1
        if o == '-b':
            backup = a

    for line in input(args, inplace=inplace, backup=backup):
        if line[-1:] == '\n':
            line = line[:-1]
        if line[-1:] == '\r':
            line = line[:-1]
        print '%d: %s[%d]%s %s' % (lineno(), filename(), filelineno(),
         isfirstline() and '*' or '', line)

    print '%d: %s[%d]' % (lineno(), filename(), filelineno())


if __name__ == '__main__':
    _test()