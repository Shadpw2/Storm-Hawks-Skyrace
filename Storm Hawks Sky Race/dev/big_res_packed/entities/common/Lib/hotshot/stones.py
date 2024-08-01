# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/hotshot/stones.py
# Compiled at: 2008-12-16 09:38:16
import errno, hotshot, hotshot.stats, os, sys, test.pystone

def main(logfile):
    p = hotshot.Profile(logfile)
    (benchtime, stones) = p.runcall(test.pystone.pystones)
    p.close()
    print 'Pystone(%s) time for %d passes = %g' % (
     test.pystone.__version__, test.pystone.LOOPS, benchtime)
    print 'This machine benchmarks at %g pystones/second' % stones
    stats = hotshot.stats.load(logfile)
    stats.strip_dirs()
    stats.sort_stats('time', 'calls')
    try:
        stats.print_stats(20)
    except IOError, e:
        if e.errno != errno.EPIPE:
            raise


if __name__ == '__main__':
    if sys.argv[1:]:
        main(sys.argv[1])
    else:
        import tempfile
        main(tempfile.NamedTemporaryFile().name)