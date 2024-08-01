# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/layers/Leaderboard.py
# Compiled at: 2008-12-16 09:35:38
data = {'exit': {'align': (0.975, 0.05), 
            'orientation': 0, 
            'parent': 'leaderboard', 
            'sprite': 'exit', 
            'type': 'button'}, 
   'lb': {'align': (0.586, 0.822), 
          'orientation': 0, 
          'parent': 'leaderboard', 
          'sprite': 'lb', 
          'labels': {'name_header': '# Name', 'time_header': 'Time'}, 'type': 'image'}, 
   'leaderboard': {'align': (0.5, 0.5), 
                   'orientation': 0, 
                   'sprite': 'leaderboard', 
                   'type': 'image'}, 
   'lists_down': {'align': (0.976, 0.661), 
                  'orientation': 0, 
                  'parent': 'lb', 
                  'sprite': 'lists_down', 
                  'type': 'button'}, 
   'lists_up': {'align': (0.976, 0.493), 
                'orientation': 0, 
                'parent': 'lb', 
                'sprite': 'lists_up', 
                'type': 'button'}, 
   'panel_1': {'align': (0.019, 0.012), 
               'minsize': (80, 50), 
               'orientation': 0, 
               'parent': 'lb', 
               'sprite': '', 
               'type': 'button'}, 
   'panel_2': {'align': (0.238, 0.012), 
               'minsize': (80, 50), 
               'orientation': 0, 
               'parent': 'lb', 
               'sprite': '', 
               'type': 'button'}}
import Factory, BigWorld

class Layer(Factory.Layer):

    def postinit(self):
        self.data = {}
        lb = self.components['lb']
        lb.visible = False

    def setTab(self, value):
        lb = self.components['lb']
        lb.setMapping(value)
        data = self.data[('saharr_test_2', 'cave_track')[value]]
        lb.write('name', data['name'])
        lb.write('time', data['time'])

    def setData(self, name, times):
        self.data[name] = {'name': ('\n').join(('%d. %s' % (1 + i, time['name']) for (i, time) in enumerate(times))), 
           'time': ('\n').join(('%(time).1f' % time for time in times))}
        if not self.components['lb'].visible:
            if 'saharr_test_2' in self.data and 'cave_track' in self.data:
                self.setTab(0)
                self.components['lb'].show()