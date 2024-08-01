# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/LoadScreenController.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

class LoadScreenController:
    """Iteratively sends update messages to a load screen to indicate the progress
        of space loading. Optionally triggers a callback when the space is fully
        loaded (past a threshold)."""

    def __init__(self, screen, low=0.0, high=1.0, threshold=0.95, callback=None):
        """screen -> instance of loading screen
                low -> value of progress bar when space is not loaded (0..1)
                high -> value of progress bar when space is fully loaded (0..1)
                threshold -> fraction of loading that is considered "full"
                callback -> called when threshold is reached, if not None
                The actual space loading is assumed to be triggered externally."""
        self.screen = screen
        self.low = low
        self.delta = high - low
        self.threshold = threshold
        self.callback = callback
        from Bitcasters.RepeatedTask import RepeatedTask
        self.task = RepeatedTask(self.check)
        self.task.start()

    def check(self):
        status = BigWorld.spaceLoadStatus(-1) ** 0.5
        if self.screen:
            self.screen.setProgress(status * self.delta + self.low)
        if status >= self.threshold:
            self.task.suspend()
            if self.callback:
                self.callback()