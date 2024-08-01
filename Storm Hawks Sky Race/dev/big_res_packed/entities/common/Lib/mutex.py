# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/mutex.py
# Compiled at: 2008-12-16 09:37:46
"""Mutual exclusion -- for use with module sched

A mutex has two pieces of state -- a 'locked' bit and a queue.
When the mutex is not locked, the queue is empty.
Otherwise, the queue contains 0 or more (function, argument) pairs
representing functions (or methods) waiting to acquire the lock.
When the mutex is unlocked while the queue is not empty,
the first queue entry is removed and its function(argument) pair called,
implying it now has the lock.

Of course, no multi-threading is implied -- hence the funny interface
for lock, where a function is called once the lock is aquired.
"""
from collections import deque

class mutex:

    def __init__(self):
        """Create a new mutex -- initially unlocked."""
        self.locked = 0
        self.queue = deque()

    def test(self):
        """Test the locked bit of the mutex."""
        return self.locked

    def testandset(self):
        """Atomic test-and-set -- grab the lock if it is not set,
        return True if it succeeded."""
        if not self.locked:
            self.locked = 1
            return True
        else:
            return False

    def lock(self, function, argument):
        """Lock a mutex, call the function with supplied argument
        when it is acquired.  If the mutex is already locked, place
        function and argument in the queue."""
        if self.testandset():
            function(argument)
        else:
            self.queue.append((function, argument))

    def unlock(self):
        """Unlock a mutex.  If the queue is not empty, call the next
        function with its argument."""
        if self.queue:
            (function, argument) = self.queue.popleft()
            function(argument)
        else:
            self.locked = 0