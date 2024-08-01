# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/dbutils.py
# Compiled at: 2008-12-16 09:37:56
from time import sleep as _sleep
import db
_deadlock_MinSleepTime = 1.0 / 128
_deadlock_MaxSleepTime = 3.14159
_deadlock_VerboseFile = None

def DeadlockWrap(function, *_args, **_kwargs):
    """DeadlockWrap(function, *_args, **_kwargs) - automatically retries
    function in case of a database deadlock.

    This is a function intended to be used to wrap database calls such
    that they perform retrys with exponentially backing off sleeps in
    between when a DBLockDeadlockError exception is raised.

    A 'max_retries' parameter may optionally be passed to prevent it
    from retrying forever (in which case the exception will be reraised).

        d = DB(...)
        d.open(...)
        DeadlockWrap(d.put, "foo", data="bar")  # set key "foo" to "bar"
    """
    sleeptime = _deadlock_MinSleepTime
    max_retries = _kwargs.get('max_retries', -1)
    if _kwargs.has_key('max_retries'):
        del _kwargs['max_retries']
    while True:
        try:
            return function(*_args, **_kwargs)
        except db.DBLockDeadlockError:
            if _deadlock_VerboseFile:
                _deadlock_VerboseFile.write('dbutils.DeadlockWrap: sleeping %1.3f\n' % sleeptime)
            _sleep(sleeptime)
            sleeptime *= 2
            if sleeptime > _deadlock_MaxSleepTime:
                sleeptime = _deadlock_MaxSleepTime
            max_retries -= 1
            if max_retries == -1:
                raise