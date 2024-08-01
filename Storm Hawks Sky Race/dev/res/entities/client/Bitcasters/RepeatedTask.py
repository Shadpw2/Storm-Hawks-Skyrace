# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/RepeatedTask.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld

class RepeatedTask(object):
    """Represents a script action to invoke repeatedly, at a given rate.

        The update speed defaults to 10 FPS (not sure if faster rates are actually
        supported). The actual speed is not guaranteed (due to the engine's internal
        scheduling logic, CPU timer precision etc.) so code should not depend on
        the update speed being exact (e.g. if it's time-sensitive, it should check
        time elapsed since the last invocation."""
    tasks = {}

    def __init__(self, action, rate=10, *arg_providers, **kwarg_providers):
        """Sets up the task.
                
                action -> a callable object to be performed
                rate -> the FPS at which the action should be re-invoked
                arg_providers -> callables, taking no arguments,
                which return positional arguments for the action
                kwarg_providers -> callables, taking no arguments,
                which return keyword arguments for the action

                ex. RepeatedTask(self.taunt, 0.1, BigWorld.player,
                                 comment = lambda: 'hello') ->
                greets the player (on the Python console) once every 10 seconds
                """
        assert callable(action), "CAN'T CALL: %s (%s)" % (action, dir(action))
        self._action = action
        self.period = 1.0 / rate
        self.arg_providers = arg_providers
        self.kwarg_providers = kwarg_providers
        self.id = None
        return

    def suspend(self):
        """Temporarily stop the task from iterating."""
        self._setActive(False)

    def resume(self):
        """Cause the task to run repeatedly, again, if it was previously suspended."""
        self._setActive(True)

    start = resume
    stop = suspend

    def _getActive(self):
        return self in RepeatedTask.tasks

    def _setActive(self, value):
        if self._getActive() == value:
            return
        if value:
            RepeatedTask.tasks[self] = self._action
            self.at = BigWorld.time() + self.period
        else:
            del RepeatedTask.tasks[self]

    active = property(_getActive, _setActive)

    def run(cls):
        for task in cls.tasks.keys():
            if BigWorld.time() > task.at:
                task.at += task.period
                try:
                    task._action(*[ x() for x in task.arg_providers ], **dict([ (k, v()) for (k, v) in task.kwarg_providers.items() ]))
                except:
                    del cls.tasks[task]
                    print '*** REPEATEDTASK DIED ***'
                    import traceback
                    traceback.print_exc()

        BigWorld.callback(0.01, cls.run)

    run = classmethod(run)