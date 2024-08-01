# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/WorldMode.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, ResMgr
from handlers import *
from Util import ignore, YELL, WHISPER, FRIENDS
from Bitcasters.Const import isOnline, addGeometry
from cursor import cursor
import chat, mainmenu

class Target:

    def __init__(self, entity):
        self.entity = entity

    def pass_to(self, func):
        return func(self.entity)

    def send_message(self, code):
        global CONSOLE
        if hasattr(self.entity, 'name'):
            BigWorld.player().sendToAnyone(self.entity.name, code)
            CONSOLE.receiveMessage(self.entity.name, BigWorld.player().id, code)
        else:
            BigWorld.player().base.yell(code)
            CONSOLE.receiveMessage(YELL, BigWorld.player().id, code)

    def begin_trade(self, user):
        self.entity.is_trade_target_of(user)

    def begin_race(self, user, track):
        assert isOnline
        self.entity.is_challenged_by(user, track)

    def name_for_friend_gui(self):
        return getattr(self.entity, 'name', '')

    def name_for_context_menu(self):
        base = self.entity.name_for_context_menu()
        return '[' + base + ']' if base else ''

    def context_options(self, friendlist):
        return self.entity.context_options(friendlist)


class All_Friends:

    def pass_to(self, func):
        pass

    def send_message(self, code):
        BigWorld.player().sendToAllFriends(code)
        CONSOLE.receiveMessage(FRIENDS, BigWorld.player().id, code)

    def begin_trade(self, user):
        pass

    def begin_race(self, user, track):
        pass

    def name_for_friend_gui(self):
        return 'All Friends'

    def name_for_context_menu(self):
        return ''

    def context_options(self, friendlist):
        return []


ALL_FRIENDS = All_Friends()

class No_Target:

    def pass_to(self, func):
        pass

    def send_message(self, code):
        BigWorld.player().base.yell(code)
        CONSOLE.receiveMessage(YELL, BigWorld.player().id, code)

    def begin_trade(self, user):
        pass

    def begin_race(self, user, track):
        user.beginSoloRace(track)

    def name_for_friend_gui(self):
        return ''

    def name_for_context_menu(self):
        return ''

    def context_options(self, friendlist):
        return []


NO_TARGET = No_Target()
from Bitcasters.layers.Factory import create
CONSOLE = None
from Mode import Mode

class WorldMode(Mode):

    def __init__(self, handler):
        cursor('direction')
        self.layers = {'player': create('PlayerStatus', 0.9, owner=self, terra=2)}
        Mode.__init__(self, handler, {KEY_W: movekeyhandler(None, 1, self.layers['player']), 
           KEY_S: movekeyhandler(None, -1, self.layers['player']), 
           KEY_D: movekeyhandler(1, None, self.layers['player']), 
           KEY_A: movekeyhandler(-1, None, self.layers['player']), 
           KEY_V: [
                 BigWorld.player().run, BigWorld.player().walk], 
           KEY_LEFTMOUSE: [
                         ignore, usehandler], 
           KEY_E: [
                 ignore, exitbikehandler], 
           KEY_F: [
                 ignore, toggleFreeCamera], 
           KEY_T: [
                 ignore, toggleTurboMode], 
           KEY_F2: [
                  ignore, teleportToSafeStartingPos], 
           KEY_RIGHTMOUSE: [
                          ignore, self.context_menu], 
           KEY_Q: [
                 ignore, transformBike], 
           KEY_B: [
                 ignore, toggleRideInstabike], 
           KEY_I: [
                 ignore, self.click_leftgui_inventory], 
           KEY_ESCAPE: [
                      ignore, self.mousemode_main_menu]})
        self.selected_entity = NO_TARGET

        def attachChatConsole():
            global CONSOLE
            if not CONSOLE:
                CONSOLE = create('ChatConsole', 0.5, None, size=(313, 235))
            CONSOLE.visible = True
            CONSOLE.to((255, 255, 255, 255), 0)
            CONSOLE.attachTo(self, self.layers['player'])
            CONSOLE.getFriendNames()
            self.set_selection(self.selected_entity)
            return

        BigWorld.callback(0.01, attachChatConsole)
        BigWorld.player().base.checkGold()
        return

    def line_text(self, name):
        from Avatar import Avatar
        matches = [ x for x in BigWorld.entities.values() if isinstance(x, Avatar) if x.name == name
                  ]
        if len(matches) == 1:
            self.select_entity(matches[0])

    def esc(self):
        """Un-target a player, or return to mouse mode if no target"""
        if self.selected_entity == NO_TARGET:
            self.returnToWorld()
        else:
            self.select_nothing()

    def jump(self):
        self.layers['player'].y = 1

    def returnToWorld(self):
        self.select_nothing()
        self.commandmap.update({KEY_LEFTMOUSE: [
                         ignore, usehandler], 
           KEY_RIGHTMOUSE: [
                          ignore, self.context_menu], 
           KEY_ESCAPE: [
                      ignore, self.mousemode_main_menu]})
        self.removeGUI(keepStatus=True)
        cursor('direction')

    def hideLeftSubmenus(self):
        self.setLayer('leftgui_menu', None)
        self.setLayer('gestures', None)
        return

    def component_click(self, component, *args):
        if component.layer() == CONSOLE:
            self.hideLeftSubmenus()

    def click_leftgui_help(self):
        BWPersonality._handler.showHelp()

    def click_gestures(self, gesture):
        BigWorld.player().user.startGesture({'wave': 'wave001', 
           'bow': 'bowing001', 
           'fistpump': 'fistpump001', 
           'defeat': 'defeat001'}[gesture])

    def click_leftgui_inventory(self):
        """Manage inventory"""
        BWPersonality.changeMode('Inventory')

    def component_click_fade(self, component, *args):
        if component.layer() == CONSOLE:
            self.hideLeftSubmenus()
        else:
            self.returnToWorld()

    def click_leftgui_chat(self):
        self.handle_chat([])

    def click_exit(self):
        self.setLayer('main_menu', None)
        if 'leftgui' not in self.layers:
            self.returnToWorld()
        return

    def click_menu_race(self, which_race):
        self.selected_entity.begin_race(BigWorld.player().user, int(which_race) - 1)

    def click_menu_broadcast(self):
        BigWorld.player().cell.broadcastRace()

    def click_menu_check_lb(self, *ignored):
        BWPersonality.changeMode('Leaderboard')

    def click_menu_trade(self):
        self.selected_entity.begin_trade(BigWorld.player().user)

    def click_menu_add_friend(self):
        self.selected_entity.pass_to((lambda entity: BigWorld.player().addFriendByID(entity.id)))

    def click_menu_remove_friend(self):
        self.selected_entity.pass_to((lambda entity: BigWorld.player().removeFriend(entity.name)))

    def click_leftgui_actions(self):
        self.hideLeftSubmenus()
        from Bitcasters.layers.circle_menu import create, RIGHT
        self.setLayer('gestures', create(parent=self.layers['leftgui'].components['leftgui_actions'], items=(
         ('bow', 'Take a bow.'),
         ('wave', 'Wave hello.'),
         ('fistpump', 'Yeah!!!'),
         ('defeat', 'Aw, man!')), rotation=RIGHT, owner=self, child_align=(0.5, 0.5), parent_align=(0.5,
                                                                                                    0.5), tag='gestures'))

    def click_chat(self, *path):
        self.handle_chat([ int(x) for x in path ])

    def handle_chat(self, path):
        self.hideLeftSubmenus()
        menu_items = self.get_menu_result(chat, path, {})
        if menu_items == 'BACK':
            path = path[:-2]
            menu_items = self.get_menu_result(chat, path, {})
        if isinstance(menu_items, str):
            self.selected_entity.send_message(path)
        else:
            from Bitcasters.layers.rectangle_menu import create
            self.setLayer('leftgui_menu', create(self.layers['leftgui'].components['leftgui_chat'], self, child_align=(-0.2,
                                                                                                                       0.5), parent_align=(0.5,
                                                                                                                                           0.4), labels=menu_items, menu_tag=('_').join(['chat'] + [ str(x) for x in path ])))

    def mousemode_main_menu(self):
        """Show the main menu"""
        self.mousemode()
        self.handle_main([])

    def click_leftgui_main(self):
        self.handle_main([])

    def click_main(self, *path):
        self.handle_main([ int(x) for x in path ])

    def handle_main(self, path):
        import Sound
        try:
            ConfigFile = ResMgr.openSection('SHOConfig.xml')
            SaveNameFlag = ConfigFile.child(0).asString == 'True'
        except:
            return

        settings = {'turnsound': 'Off' if Sound.SoundFlag == 'On' else 'On', 
           'saveloginflag': "Don't Save" if SaveNameFlag else 'Save'}
        menu_items = self.get_menu_result(mainmenu, path, settings)
        if isinstance(menu_items, str):
            menuitem = menu_items
            if menuitem == 'Quit':
                BWPersonality.confirmQuit()
                return
            elif menuitem.startswith('Turn sound'):
                Sound.TurnSound(menuitem.split()[-1])
            elif menuitem.startswith('Login Name'):
                from Login import LoginName
                setting = menuitem.split()[3] == 'Save'
                SaveNameFlag = not SaveNameFlag
                try:
                    ConfigFile = ResMgr.openSection('SHOConfig.xml')
                    ConfigFile.child(0).asString = setting
                    ConfigFile.child(1).asString = LoginName
                    try:
                        ConfigFile.save()
                    except:
                        print 'COULD NOT SAVE CONFIG'

                except:
                    print 'COULD NOT READ CONFIG'

            elif menuitem == 'BACK':
                path = path[:-1]
            settings = {'turnsound': 'Off' if Sound.SoundFlag == 'On' else 'On', 
               'saveloginflag': "Don't Save" if SaveNameFlag else 'Save'}
            path = path[:-1]
            menu_items = self.get_menu_result(mainmenu, path, settings)
        from Bitcasters.layers.Factory import attach_child
        self.setLayer('main_menu', attach_child(self.layers['player'], 'MainMenu', 0.025, self, (0.5,
                                                                                                 0.5), (0.5,
                                                                                                        0.5), labels=menu_items, menu_tag=('_').join(['main'] + [ str(x) for x in path ]), trap_background_clicks=True))

    def get_menu_result(self, module, path, settings):
        key = '__root__'
        for position in path:
            menuitem = (getattr(module, key) + ('BACK', ))[position]
            key = menuitem[:-2]

        return [ x % settings for x in getattr(module, key) ] + ([] if key == '__root__' else ['< BACK']) if hasattr(module, key) else menuitem % settings

    def select_entity(self, entity):
        self.set_selection(Target(entity))
        self.selected_entity.pass_to((lambda entity: entity.highlight(True)))

    def select_nothing(self):
        self.selected_entity.pass_to((lambda entity: entity.highlight(False)))
        self.set_selection(NO_TARGET)

    def select_friends(self, *ignored):
        self.selected_entity.pass_to((lambda entity: entity.highlight(False)))
        self.set_selection(ALL_FRIENDS)

    def set_selection(self, selection):
        self.selected_entity = selection
        CONSOLE.components['target'].text = selection.name_for_friend_gui()
        if isOnline():
            friends = [ x for x in BigWorld.player().friend_name_ID_map.keys() if isinstance(x, str)
                      ]
        else:
            friends = []
        options = self.selected_entity.context_options(friends)
        try:
            self.menu.cleanup()
            del self.menu
        except:
            pass

        from Bitcasters.layers.circle_menu import create, ABOVE
        self.setLayer('menu', create(self.layers['player'], options, ABOVE, self, targetname=self.selected_entity.name_for_context_menu()))

    def mousemode(self):
        cursor('mouse')
        self.layers['player'].stop = True
        try:
            del self.commandmap[KEY_LEFTMOUSE]
        except:
            pass

        self.commandmap[KEY_ESCAPE] = [
         ignore, self.esc]

    def context_menu(self):
        """Enter/exit GUI mode"""
        if self.commandmap[KEY_ESCAPE][1] == self.esc:
            self.returnToWorld()
            return
        from Bitcasters.layers.Factory import create
        self.setLayer('leftgui', create('leftgui', 0.75, size=(50, 270), row_spacing=(1,
                                                                                      1,
                                                                                      1,
                                                                                      1,
                                                                                      1), owner=self))
        self.layers['leftgui'].anchorOn((0, 0.5), self.layers['player'], (0, 0.36))

        def suppress_leftgui_tooltip():
            for component in self.layers['leftgui'].components.values():
                component._tt.hide()
                component.setMapping(0)

        BigWorld.callback(0.01, suppress_leftgui_tooltip)
        self.mousemode()
        target = BigWorld.target()
        if target:
            self.select_entity(target)
        else:
            self.select_nothing()

    def targetFocus(self, focussedEntity):
        if 'leftgui' not in self.layers:
            focussedEntity.info_gui.set('name', True)

    def targetBlur(self, focussedEntity):
        focussedEntity.info_gui.set('name', False)

    def setLayer(self, name, data):
        if name in self.layers:
            self.layers[name].cleanup()
            del self.layers[name]
        if data:
            self.layers[name] = data

    def removeGUI(self, keepStatus=False):
        for name in self.layers.keys():
            if keepStatus and name == 'player':
                continue
            self.setLayer(name, None)

        return

    def cleanup(self):
        CONSOLE.visible = False
        Mode.cleanup(self)
        BigWorld.player().avatarDict = {}
        self.removeGUI()

    def endTrade(self):
        pass