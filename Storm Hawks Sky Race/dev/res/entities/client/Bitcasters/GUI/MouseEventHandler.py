# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/GUI/MouseEventHandler.py
# Compiled at: 2008-12-16 09:35:38
from Util import ignore
from Draggable import Draggable
from Clickable import Clickable
from Tooltip import Tooltip

def attachPolicyTo(policyName, aComponent, aBg, *args, **kwargs):
    return attachPolicyTo_helper(policyName, globals()[policyName](aComponent, *args, **kwargs), aComponent, aBg)


def attachPolicyTo_helper(policyName, policy, aComponent, aBg):
    removePolicyFrom(aComponent, policyName)
    b = aBg
    if not b.script:
        b.focus = True
        b.crossFocus = True
        b.dragFocus = True
        b.dropFocus = True
        b.script = MouseEventHandler(aComponent, aBg)
    b.script.policies[policyName] = policy
    return policy


def removePolicyFrom(aBg, policyName):
    policies = getattr(getattr(aBg, 'script', None), 'policies', {})
    if policyName not in policies:
        return
    policies[policyName].cleanup()
    del policies[policyName]
    return


def removeAllPolicies(aBg):
    s = aBg.script
    if not s:
        return
    if hasattr(s, 'policies'):
        for policy in s.policies.values():
            getattr(policy, 'cleanup', ignore)()

        s.policies.clear()


class MouseEventHandler(object):
    """Attached to a Bitcasters component to receive mouse events and dispatch
        them to "policies" such as Draggable."""

    def __init__(self, aComponent, aBg):
        self.policies = {}
        self.component = aComponent
        self.bg = aBg
        for (i, o) in (
         ('handleMouseEnterEvent', 'enter'),
         ('handleMouseLeaveEvent', 'leave'),
         ('handleMouseClickEvent', 'click'),
         ('handleDragStartEvent', 'start_drag'),
         ('handleDragStopEvent', 'stop_drag'),
         ('handleDragEnterEvent', 'drag_enter'),
         ('handleDragLeaveEvent', 'drag_leave'),
         ('handleDropEvent', 'drop')):
            setattr(self, i, (lambda oo: (lambda *args: self.mouseEventWrapper(oo, *args)))(o))

    def mouseEventWrapper(self, handlername, *args):
        if self.component.DESTROYED:
            return False
        if not self.component.enabled:
            return False
        comp, args = args[0], args[1:]
        assert comp == self.bg
        for policy in self.policies.values():
            getattr(policy, handlername, ignore)(*args)

        return True

    def handleMouseButtonEvent(self, comp, key, down, mods, pos):
        if not self.component.enabled:
            return False
        from Bitcasters.Const import DOWN, SHIFT, CTRL, ALT
        from Util import ignore
        from keys import KEY_LEFTMOUSE, KEY_MIDDLEMOUSE, KEY_RIGHTMOUSE
        id = {KEY_LEFTMOUSE: 'left', KEY_MIDDLEMOUSE: 'middle', KEY_RIGHTMOUSE: 'right'}[key]
        mods = mods * 2 + down
        prefix = ('alt_' if mods & ALT else '') + ('ctrl_' if mods & CTRL else '') + ('shift_' if mods & SHIFT else '')
        tag = '_down' if mods & DOWN else '_up'
        assert comp == self.bg
        for policy in self.policies.values():
            handler = getattr(policy, prefix + id + tag, None)
            if handler:
                handler(pos)
            else:
                getattr(policy, id, ignore)(pos, mods)

        return True