# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/ctypes/test/runtests.py
# Compiled at: 2008-12-16 09:38:01
"""Usage: runtests.py [-q] [-r] [-v] [-u resources] [mask]

Run all tests found in this directory, and print a summary of the results.
Command line flags:
  -q     quiet mode: don't prnt anything while the tests are running
  -r     run tests repeatedly, look for refcount leaks
  -u<resources>
         Add resources to the lits of allowed resources. '*' allows all
         resources.
  -v     verbose mode: print the test currently executed
  mask   mask to select filenames containing testcases, wildcards allowed
"""
import sys, ctypes.test
if __name__ == '__main__':
    sys.exit(ctypes.test.main(ctypes.test))