# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/help.py
# Compiled at: 2008-12-16 09:35:38
data = {'exit': {'align': (0.967, 0.037), 
            'orientation': 0, 
            'parent': 'help', 
            'sprite': 'exit', 
            'type': 'button'}, 
   'help': {'align': (0.5, 0.5), 
            'orientation': 0, 
            'sprite': 'help', 
            'type': 'image', 
            'labels': {'title': 'HELP'}}, 
   'left': {'align': (0.454, 0.938), 
            'orientation': 0, 
            'parent': 'help', 
            'sprite': 'left', 
            'type': 'button'}, 
   'right': {'align': (0.543, 0.938), 
             'orientation': 0, 
             'parent': 'help', 
             'sprite': 'right', 
             'type': 'button'}, 
   'text': {'behaviour': 'wrap', 
            'expand': (1, 1), 
            'font': 'Bronic_27', 
            'orientation': 0, 
            'parent': 'help', 
            'region': 'text', 
            'sprite': '', 
            'type': 'label'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def preinit(self, code, **kwargs):
        code['text']['text'] = kwargs['text']
        Layer.bind_key('escape', self.click_exit)

    def postinit(self):
        self.components['left'].visible = False
        self._t()._page_size = 12

    def _t(self):
        return self.components['help'].children['text']

    def click_exit(self):
        from Bitcasters.mode.cursor import cursor
        self.dismiss((lambda : cursor('previous')))

    def click_left(self):
        self._t().page_unclamped(-1)
        self.fix_arrows()

    def click_right(self):
        self._t().page_unclamped(1)
        self.fix_arrows()

    def fix_arrows(self):
        t = self._t()
        enable_right = t._scroll < t.max_scroll
        enable_left = t._scroll != 0
        l = self.components
        l['right'].visible = enable_right
        l['right'].enabled = enable_right
        l['left'].visible = enable_left
        l['left'].enabled = enable_left