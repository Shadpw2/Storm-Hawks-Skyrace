# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/RaceMode.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, ResMgr
from handlers import *
from Util import ignore
from Bitcasters.RepeatedTask import RepeatedTask
from cursor import cursor
from RaceInfo import RaceInfo as Race
from Bitcasters.GUI.Component import Image
from Avatar import *
import racemenu
from Bitcasters.layers.Factory import create
from Mode import Mode

class RaceMode(Mode):

    def __init__(self, handler, terra):
        cursor('direction')
        self.layers = {'player': create('PlayerStatus', 0.9, owner=self, terra=terra), 
           'race': create('RaceStatus', 1.0, owner=self)}
        Mode.__init__(self, handler, {KEY_W: movekeyhandler(None, 1, self.layers['player']), 
           KEY_S: movekeyhandler(None, -1, self.layers['player']), 
           KEY_D: movekeyhandler(1, None, self.layers['player']), 
           KEY_A: movekeyhandler(-1, None, self.layers['player']), 
           KEY_Q: [
                 ignore, transformBike], 
           KEY_1: crystalhandler(self, 0), 
           KEY_2: crystalhandler(self, 1), 
           KEY_3: crystalhandler(self, 2), 
           KEY_ESCAPE: [
                      ignore, self.raceMenuRoot]})
        from WorldMode import CONSOLE
        CONSOLE.show()
        player = BigWorld.player()
        for entity in BigWorld.entities.values():
            if isinstance(entity, Avatar) and entity != player:
                self.layers['player'].create_dot(entity.id)

        return

    def updateRaceCrystals(self, crystals):
        self.layers['race'].updateCrystals(crystals)

    def remove_main(self):
        if hasattr(self, 'main_menu'):
            self.main_menu.cleanup()
            del self.main_menu

    def cleanup(self):
        from WorldMode import CONSOLE
        CONSOLE.hide()
        self.remove_main()
        self.layers['player'].cleanup()
        self.layers['race'].cleanup()
        Mode.cleanup(self)
        BigWorld.player().opponentDots = {}
        BigWorld.player().playerDot = None
        BigWorld.player().opponentPos = {}
        BigWorld.player().droppedOpponents = []
        return

    def click_exit(self):
        self.commandmap[KEY_ESCAPE] = [
         ignore, self.raceMenuRoot]
        self.remove_main()
        cursor('direction')

    def raceMenuRoot(self):
        """Show race GUI menu"""
        self.mousemode()
        self.handle_main([])

    def mousemode(self):
        cursor('mouse')
        self.commandmap[KEY_ESCAPE] = [ignore, self.click_exit]

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
        menu_items = self.get_menu_result(racemenu, path, settings)
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

            elif menuitem == 'Forfeit Race':
                from Bitcasters.layers.Factory import ask
                from Bitcasters.layers.dialog import ICON_QUESTION
                ask(ICON_QUESTION, 'Really Give Up?', 'Are you sure you want to leave the race? You will not earn any prizes.', ok_callback=self.give_up)
            elif menuitem == 'BACK':
                path = path[:-1]
            settings = {'turnsound': 'Off' if Sound.SoundFlag == 'On' else 'On', 
               'saveloginflag': "Don't Save" if SaveNameFlag else 'Save'}
            path = path[:-1]
            menu_items = self.get_menu_result(racemenu, path, settings)
        from Bitcasters.layers.Factory import attach_child
        self.remove_main()
        self.main_menu = attach_child(self.layers['player'], 'MainMenu', 0.5, self, (0.5,
                                                                                     0.5), (0.5,
                                                                                            0.5), labels=menu_items, menu_tag=('_').join(['main'] + [ str(x) for x in path ]))

    def give_up(self):
        self.remove_main()
        BigWorld.player().user.race.doneRace(False)

    def get_menu_result(self, module, path, settings):
        key = '__root__'
        for position in path:
            menuitem = (getattr(module, key) + ('BACK', ))[position]
            key = menuitem[:-2]

        return [ x % settings for x in getattr(module, key) ] + ([] if key == '__root__' else ['< BACK']) if hasattr(module, key) else menuitem % settings