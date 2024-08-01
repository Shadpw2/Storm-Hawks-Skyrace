# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/ChatConsole.py
# Compiled at: 2008-12-16 09:35:38
data = {'chat': {'align': (0.5, 0.5), 
            'orientation': 0, 
            'sprite': 'console_bg', 
            'type': 'image'}, 
   'down': {'align': (0.966, 0.944), 
            'orientation': 0, 
            'parent': 'chat', 
            'sprite': 'down', 
            'type': 'button'}, 
   'friendlist': {'align': (0.5, 0.5), 
                  'orientation': 0, 
                  'sprite': 'console_bgfl', 
                  'type': 'image'}, 
   'text': {'type': 'label', 
            'sprite': '', 'expand': (1, 1), 'parent': 'friendlist', 
            'region': 'text', 'text': '', 'behaviour': 'squeeze', 
            'font': 'Bronic_17', 'text_align': 0.0, 'handle_clicks': True}, 
   'knob': {'align': (1.0, 0.483), 
            'orientation': 0, 
            'parent': 'scroll', 
            'sprite': 'endscroll_knob', 
            'type': 'slider'}, 
   'menu_add_friend': {'align': (0.743, 0.939), 
                       'labels': {'text': '+'}, 'orientation': 0, 
                       'parent': 'friendlist', 
                       'sprite': 'thin_stub', 
                       'type': 'button', 
                       'tooltip': 'Add to friends list.'}, 
   'menu_remove_friend': {'align': (0.892, 0.939), 
                          'labels': {'text': '-'}, 'orientation': 0, 
                          'parent': 'friendlist', 
                          'sprite': 'thin_stub', 
                          'type': 'button', 
                          'tooltip': 'Remove from friends list.'}, 
   'minimize': {'align': (0.959, 0.127), 
                'orientation': 0, 
                'parent': 'chat', 
                'sprite': 'minimize', 
                'type': 'button', 
                'tooltip': 'Pull up or push down the chat console.'}, 
   'scroll': {'align': (1.0, 0.648), 
              'minsize': (41, 142), 
              'orientation': 0, 
              'parent': 'chat', 
              'sprite': '', 
              'type': 'image'}, 
   'select_friends': {'align': (0.012, 0.939), 
                      'labels': {'text': 'To All'}, 'orientation': 0, 
                      'parent': 'friendlist', 
                      'sprite': 'thin_short', 
                      'type': 'button', 
                      'tooltip': 'Send your next messages to all your friends.'}, 
   'show_chat': {'align': (0.026, 0.01), 
                 'orientation': 0, 
                 'parent': 'chat', 
                 'sprite': 'console_chat', 
                 'type': 'button', 
                 'tooltip': 'Chat panel.'}, 
   'show_friendlist': {'align': (0.242, 0.015), 
                       'orientation': 0, 
                       'parent': 'friendlist', 
                       'sprite': 'console_fl', 
                       'type': 'button', 
                       'tooltip': 'Friends list panel.'}, 
   'target': {'align': (0.354, 0.943), 
              'orientation': 0, 
              'parent': 'friendlist', 
              'sprite': 'small_text', 
              'type': 'image'}, 
   'up': {'align': (0.966, 0.202), 
          'orientation': 0, 
          'parent': 'chat', 
          'sprite': 'up', 
          'type': 'button'}}
import Factory, BigWorld
from Bitcasters.RepeatedTask import RepeatedTask
from Util import YELL, WHISPER, FRIENDS
import Bitcasters.mode.chat as chat
MINIMIZE_FACTOR = 192
CHAT_LINES = 30

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        self.minimized = True
        self.blink_minimize = RepeatedTask(self.do_blink_minimize, rate=2)

    def postinit(self):
        components = self.components
        components['chat'].write('text', '\n' * (CHAT_LINES - 1))
        components['chat'].children['text'].limitText(CHAT_LINES)
        self.tab('chat')
        minimize = components['minimize']
        minimize.rotate()
        minimize.rotate()

    def getFriendNames(self):
        BigWorld.player().updateFriendsGUI(self)

    def setFriendsList(self, friendNames):
        self.components['friendlist'].write('text', friendNames)

    def attachTo(self, owner, viewport):
        self.set_chain_of_command(owner)
        self.anchorOn((0, 1), viewport, (0, 1))
        self._viewport = viewport
        self._do_minimize(0)

    def fit(self):
        Factory.Layer.fit(self)
        if hasattr(self, '_viewport'):
            self.anchorOn((0, 1), self._viewport, (0, 1))
            self._do_minimize(0)

    def minimize(self, setting, time):
        if self.minimized == setting:
            return
        self.minimized = setting
        self._do_minimize(time)

    def _do_minimize(self, time):
        self.setTranslation(0, MINIMIZE_FACTOR if self.minimized else 0, time)
        for i in range(2):
            self.components['minimize'].rotate()

        self.blink_minimize.suspend()
        self.components['show_chat'].show()
        for entity in BigWorld.entities.values():
            try:
                entity.info_gui.components['chat'].hide()
            except:
                pass

    def click_minimize(self):
        self.minimize(not self.minimized, 0.5)

    def do_blink_minimize(self):
        c = self.components['show_chat']
        c.visible = not c.visible

    def receiveMessage(self, how, who, what):
        try:
            who = BigWorld.entities[who]
        except:
            return

        name = 'You' if who == BigWorld.player() else who.name
        desc = {YELL: '', WHISPER: ' (to you)', FRIENDS: ' (to friends)'}
        key = '__root__ >'
        for option in what:
            key = getattr(chat, key[:-2])[option]

        c = self.components['chat']
        c.write('text', '%s\n%s%s: %s' % (
         c.read('text').split('\n', 1)[1],
         name,
         desc.get(how, ' (to %s)' % how),
         key))
        knob = self.components['knob']
        knob.value = knob.value
        if self.minimized and who != BigWorld.player():
            who.info_gui.components['chat'].visible = True
            self.blink_minimize.resume()

    def component_set_knob(self, component, value):
        component.parent.parent.children['text'].scrollTo(value[1])

    def click_show(self, which):
        self.tab(which)
        self.minimize(False, 0.5)

    def click_up(self):
        self.components['knob'].v -= 1

    def click_down(self):
        self.components['knob'].v += 1

    def tab(self, which):
        knob = self.components['knob']
        for childname in ('up', 'down', 'scroll', 'minimize'):
            self.components[childname].setParent(self.components[which])

        self.components[which].z = 0
        self.components[{'chat': 'friendlist', 'friendlist': 'chat'}[which]].z = 1
        if which == 'chat':
            knob.policy.positions = (1, 24)
            knob.value = (0, 23)
        elif which == 'friendlist':
            knob.policy.positions = (1, 25)
            knob.value = (0, 0)
        else:
            raise ValueError