# RaceInfo.py (offline solo race flow with safe quit + safe restore)
# ASCII only (no unicode punctuation)

import BigWorld
from Math import Vector3
from Bitcasters.Const import isOnline
from Bitcasters.RepeatedTask import RepeatedTask
from Sound import *

########################################
# Debug helpers
########################################

def _debug_player_class(tag=""):
    try:
        p = BigWorld.player()
        print "[DEBUG] %s BigWorld.player(): %s id=%s type=%s" % (
            tag,
            p,
            getattr(p, "id", None),
            p.__class__.__name__,
        )
    except Exception, e:
        print "[DEBUG] %s BigWorld.player(): failed -> %s" % (tag, e)


########################################
# Small utils
########################################

def trackName(trackID):
    # 0 -> saharr_test_2, 1 -> cave_track
    return ('saharr_test_2', 'cave_track')[trackID]

def _vector3_to_tuple(v):
    try:
        return (v.x, v.y, v.z)
    except:
        try:
            return (v[0], v[1], v[2])
        except:
            return (0, 0, 0)

def _patchOfflineFriendsAndInventory(player, snapshot):
    """
    WorldMode / ChatConsole / Inventory expect certain attrs from PlayerAvatar.
    After we restore control, we might have a partially-initialized PlayerAvatar.
    We fake/patch minimal state so that UI does not explode.
    """
    try:
        player.gold = snapshot.get("gold", getattr(player, "gold", 0))
    except:
        pass

    try:
        player.inventory = snapshot.get("inventory", getattr(player, "inventory", {}))
    except:
        pass

    if not hasattr(player, "friends"):
        player.friends = [set(), set()]
    if not hasattr(player, "friend_name_ID_map"):
        player.friend_name_ID_map = {}
    if not hasattr(player, "friends_gui"):
        player.friends_gui = None

    def _safe_updateFriendsGUI(layer=None, _p=player):
        if layer:
            _p.friends_gui = layer
        if _p.friends_gui:
            try:
                online_ids = []
                txt = '\n'.join(
                    (_p.friend_name_ID_map.get(i, "") for i in online_ids)
                )
                _p.friends_gui.setFriendsList(txt)
            except Exception, e:
                print "[RACE] safe_updateFriendsGUI failed:", e

    player.updateFriendsGUI = _safe_updateFriendsGUI
    print "[RACE] _patchOfflineFriendsAndInventory applied to", player


def _spawnAvatarInNewSpace(space_name, start_pos, start_rot_vec3, carry_data):
    """
    Create new offline race space, attach geometry, spawn a PlayerAvatar/Avatar there,
    hand over control to it.
    """
    print "[RACE] spawning new Avatar in fresh space:", space_name

    new_space = BigWorld.createSpace()
    print "[RACE] new_space:", new_space

    try:
        BigWorld.addSpaceGeometryMapping(new_space, None, "spaces/" + space_name)
        print "[RACE] mapped geometry for", space_name
    except Exception, e:
        print "[RACE] addSpaceGeometryMapping failed:", e

    try:
        ypr = (start_rot_vec3[0], start_rot_vec3[1], start_rot_vec3[2])
    except:
        try:
            ypr = (start_rot_vec3.x, start_rot_vec3.y, start_rot_vec3.z)
        except:
            ypr = (0, 0, 0)

    spawn_xyz = _vector3_to_tuple(start_pos)

    print "[RACE] creating Avatar entity..."
    try:
        new_eid = BigWorld.createEntity(
            "Avatar",
            new_space,
            0,
            spawn_xyz,
            ypr,
            carry_data
        )
        print "[RACE] new Avatar entity id:", new_eid
    except Exception, e:
        print "[RACE] BigWorld.createEntity('Avatar', ...) FAILED:", e
        new_eid = None

    if new_eid is None:
        return (new_space, None)

    try:
        BigWorld.player(BigWorld.entities[new_eid])
        print "[RACE] BigWorld.player() now:", new_eid
    except Exception, e:
        print "[RACE] BigWorld.player() swap FAILED:", e

    try:
        BigWorld.controlEntity(BigWorld.player(), True)
        print "[RACE] controlEntity TRUE"
    except Exception, e:
        print "[RACE] controlEntity FAILED:", e

    try:
        BigWorld.player().enterWorld()
        print "[RACE] Avatar.enterWorld() called in race space"
    except Exception, e:
        print "[RACE] Avatar.enterWorld() FAILED:", e

    return (new_space, new_eid)


########################################
# RaceInfo class
########################################

class RaceInfo:

    def _setup(self, trackID):
        """
        Precompute race layout data for the chosen track.
        Sets self.startpos, self.rotation, self.waypoints, self.lapsToFinish.
        """
        assert not hasattr(self, 'laps'), "RaceInfo._setup called twice"

        if trackID == 0:
            # saharr_test_2
            self.startpos = Vector3(-185.164, 10.043, 443.093)
            self.rotation = Vector3(0, 0, 0)
            self.waypoints = (
                Vector3(-172.994, 10.043, 443.093),
                Vector3(-30.88, 26.83, 78.83),
                Vector3(-238.6, 18.83, 159.4)
            )
            self.lapsToFinish = 2
        else:
            # cave_track
            self.startpos = Vector3(-416, 5, 300)
            self.rotation = Vector3(0, 0, 0)
            self.waypoints = (
                Vector3(-428, 5, 300),
                Vector3(447.441, 0.797, -75.214),
                Vector3(124.205, 29.59, 369.138)
            )
            self.lapsToFinish = 1

        from Bitcasters.Math import CameraMatrix
        self.startdir = (
            0, 0,
            CameraMatrix(self.waypoints[0], self.startpos).yaw
        )

        self._TRACK = trackID

        StopMusic(0)
        PlayMusic(trackID + 1)

    def beginHeadToHead(self, opponent, trackID):
        assert isOnline(), "Requested head to head race offline"
        self.startspace = BigWorld.player().spaceID
        BigWorld.player().cell.proposeActionTo('race_' + trackName(trackID), opponent)

    def beginSolo(self, trackID):
        """
        Offline solo flow:
        - Snapshot current hub player and their important state.
        - Spawn a new race-only avatar in a brand new space.
        - Hand control to that avatar.
        - Prep race.
        """
        _debug_player_class("beginSolo (pre)")
        old_player = BigWorld.player()

        self.startspace       = getattr(old_player, "spaceID", None)
        self.world_player_id  = getattr(old_player, "id", None)
        self.world_player_ref = old_player

        print "[RACE] beginSolo startspace:", self.startspace
        print "[RACE] world_player_id:", self.world_player_id

        self.world_snapshot = {
            "gold": getattr(old_player, "gold", 0),
            "inventory": getattr(old_player, "inventory", {}),
        }

        if isOnline():
            print "REQUEST TIME TRIAL (online path)"
            try:
                old_player.base.startTimeTrial(trackName(trackID))
            except:
                pass
            return

        self._setup(trackID)

        carry = {}
        src = old_player

        def cp(attr, default):
            try:
                carry[attr] = getattr(src, attr)
            except:
                carry[attr] = default

        cp("hair",        0)
        cp("eyeColour",   0)
        cp("skinColour",  0)
        cp("hairColour1", 0)
        cp("hairColour2", 0)
        cp("gender",      0)
        cp("mountType",   0)
        cp("flying",      False)
        cp("name",        "OfflineRacer")
        cp("proposals",   {})
        cp("equipped",    {})
        cp("ph_name",     "Biped")

        space_name = trackName(trackID)
        (self.race_space, self.race_avatar_id) = _spawnAvatarInNewSpace(
            space_name,
            self.startpos,
            self.rotation,
            carry
        )
        print "[RACE] race space:", self.race_space, " race avatar id:", self.race_avatar_id
        _debug_player_class("beginSolo (post spawn)")

        if self.race_avatar_id is None:
            print "[RACE] Could not spawn Avatar in race space, aborting."
            return

        self.acknowledge()
        self.prepare([BigWorld.player().id], trackID)

    def acknowledge(self):
        """
        Hide hub UI, show loading, etc.
        """
        try:
            __import__('Physics').attach(BigWorld.player(), 'Dummy')
        except:
            pass

        from Bitcasters.mode.cursor import cursor
        cursor('none')

        for ent in BigWorld.entities.values():
            try:
                ent.highlight(False)
            except:
                pass
            try:
                ent.info_gui.hide()
            except:
                pass

        import BWPersonality
        self.screen = BWPersonality.changeMode('Loading', '')
#-------------------------------------------------------------------------------------------------------------------------------------------------
# Collectables
#-------------------------------------------------------------------------------------------------------------------------------------------------
    def spawncollectables(self, trackID):
        print "[Collectables] Running Start"
        from BWPersonality import spawn_crystal, spawn_boost
        if trackID == 0:
            # saharr_test_2 
            print "[Collectables] Starting Saharr placements"
            spawn_boost(-100.66, 14.09, 448.30, (0, 0, 90), boost_type=1)
            spawn_crystal(183.80, -16.16, 257.47, (0, 0, 0), item_type=0)
            spawn_crystal(-158.27, 28.83, 35.82, (0, 0, 0), item_type=1)
            spawn_boost(-267.63, 20.84, 245.84, (0, 0, 0), boost_type=1)
            print "[Collectables] Finishing Saharr placements"
        else:
            print "[Collectables] Starting Cave placements"
            print "[Collectables] Finishing Saharr placements"

    def prepare(self, racers, trackID):
        """
        Finish prepping race: teleport avatar to start, mount bike, etc.
        """
        player = BigWorld.player()
        user = player.user

        if not hasattr(self, "lapsToFinish"):
            self._setup(trackID)

        self.laps = -1
        self.targetWaypoint = 0
        self.startTime = -1
        self.startTimeValid = False

        try:
            user.setVehicle(0, 'Biped')
        except:
            pass

        try:
            user.teleport(self.startpos, self.rotation)
            print "[RACE] prepare() confirm teleport", self.startpos, self.rotation
            self.spawncollectables(trackID)
        except Exception, e:
            print "[RACE] user.teleport FAILED:", e
            try:
                player.position = self.startpos
                player.yaw = self.rotation[0]
            except:
                pass

        try:
            user.setVehicle(1, 'Dummy')
        except:
            pass

        if not racers:
            racers = [None]
        self.racers = racers

        from LoadScreenController import LoadScreenController
        LoadScreenController(self.screen, callback=self.begin)

    def begin(self):
        _debug_player_class("begin (Countdown)")

        player = BigWorld.player()
        user = player.user

        BigWorld.dcursor().yawPitch(player.yaw)

        self.messages = ('Ready', 'Set', 'Go!', '')
        self.msgCount = -1
        self.thread = RepeatedTask(self.countdown)

        try:
            user.setVehicle(1, 'Dummy')
        except:
            pass

        StopContinuousEffect('effects/walk')
        StopContinuousEffect('effects/run')
        PlayContinuousEffect('effects/engineidle')

        BigWorld.callback(0.2, self.showRace)

    def showRace(self):
        import BWPersonality
        BWPersonality.changeMode('RaceMode', self._TRACK)

        if isOnline():
            try:
                BigWorld.player().user.avatar.cell.readyToRace()
            except:
                pass
        else:
            BigWorld.callback(2, self.startCountdown)

    def startCountdown(self):
        print "[RACE] START COUNTDOWN"
        self.startTime = BigWorld.time()
        self.startTimeValid = True
        print "[Debug - RACE] Check vars, Crystals:", self.crystals, " Boosts:", self.boosts
        self.thread.start()

    def collect_crystal(self):
        """Called when player collects a crystal during race"""
        try:
            self.crystals += 1
            print "[RACE] Crystal collected! Total:", self.crystals, " RaceInfo ID:", id(self)
            
            if hasattr(self, 'guilayer'):
                try:
                    self.guilayer.setText('race_bg', 'crystals', str(self.crystals))
                except:
                    pass
        except Exception, e:
            print "[RACE] collect_crystal failed:", e

    def collect_boost(self):
        """Called when player collects a boost during race"""
        try:
            self.boosts += 1
            print "[RACE] Boost collected! Total:", self.boosts, " RaceInfo ID:", id(self)
            
            if hasattr(self, 'guilayer'):
                try:
                    self.guilayer.setText('race_bg', 'boosts', str(self.boosts))
                except:
                    pass
        except Exception, e:
            print "[RACE] collect_boost failed:", e

    def calculateOfflineRank(self, finishTime, trackID):
        """Calculate rank based on finish time for offline races"""
        target_times = {
            0: [60, 75, 90],   # saharr_test_2: gold, silver, bronze times
            1: [45, 60, 75]    # cave_track: gold, silver, bronze times
        }
        
        times = target_times.get(trackID, [60, 75, 90])
        
        if finishTime < times[0]:
            return 0  # 1st place / Gold
        elif finishTime < times[1]:
            return 1  # 2nd place / Silver
        elif finishTime < times[2]:
            return 2  # 3rd place / Bronze
        else:
            return 3  # Participation

    def set_rank(self, value):
        """Called to update player's rank during race"""
        try:
            print "[RACE] Rank updated to:", value
            self.ranking = value
            if hasattr(self, 'guilayer'):
                try:
                    self.guilayer.setText('race_bg', 'rank', str(value))
                except:
                    pass
        except Exception, e:
            print "[RACE] set_rank failed:", e

    def countdown(self):
        from BWPersonality import storage
        self.guilayer = storage().mode.layers['race']

        elapsed = BigWorld.time() - self.startTime if self.startTimeValid else 0.0
        newMsgCount = int(elapsed / 1.5)

        if newMsgCount != self.msgCount and newMsgCount < len(self.messages):
            self.msgCount = newMsgCount
            self.guilayer.components['info'].text = self.messages[newMsgCount]

            if newMsgCount == 2:
                from Bitcasters.mode.cursor import cursor
                cursor('direction')

                for racer_id in self.racers:
                    try:
                        BigWorld.entities[racer_id].unlock()
                    except:
                        pass

                from Bitcasters.Math import TranslationMatrix
                self.pots = []
                for wp in self.waypoints:
                    h = BigWorld.addPot(
                        TranslationMatrix(*wp),
                        35.0,
                        self.hitPot
                    )
                    self.pots.append(h)
        elif newMsgCount >= 2:
            self.guilayer.setText(
                'race_bg',
                'timer',
                str(round(elapsed - 3.0, 1))
            )

    def hitPot(self, enteredTrap, handle):
        print "[RACE] Waypoint reached", self.targetWaypoint, "/", self.lapsToFinish

        try:
            idx = self.pots.index(handle)
        except:
            return

        if idx != self.targetWaypoint:
            return

        self.targetWaypoint = (self.targetWaypoint + 1) % len(self.pots)

        if idx != 0:
            return

        self.laps += 1
        if self.laps != self.lapsToFinish:
            self.guilayer.setText(
                'race_bg',
                'lap',
                "%s/%s" % (self.laps + 1, self.lapsToFinish)
            )
            return

        # Get crystals/boosts from the CURRENT player before calling doneRace
        try:
            current_race = BigWorld.player().user.race
            self.crystals = current_race.crystals
            self.boosts = current_race.boosts
            print "[RACE] Copied stats from current race - Crystals:", self.crystals, "Boosts:", self.boosts
        except:
            pass

        self.doneRace(True)

    def doneRace(self, crossedFinishLine):
        print "[RACE] doneRace called on RaceInfo ID:", id(self)
        print "[RACE] Crystals:", getattr(self, 'crystals', 'NOT SET'), " Boosts:", getattr(self, 'boosts', 'NOT SET')
        """
        Called either when race is finished OR when player gives up.
        """
        _debug_player_class("doneRace (enter)")

        if hasattr(self, "thread"):
            try:
                self.thread.suspend()
            except:
                pass

        self.targetWaypoint = -1

        total_time = 0.0
        if hasattr(self, "startTimeValid") and self.startTimeValid:
            try:
                total_time = BigWorld.time() - self.startTime - 4.5
            except:
                pass

        try:
            if hasattr(self, "guilayer"):
                msg = 'FINISH!' if crossedFinishLine else 'GAVE UP'
                self.guilayer.components['info'].text = msg
        except Exception, e:
            print "[RACE] could not set guilayer text:", e

        if crossedFinishLine:
            PlayEffect('music/fanfare')

        # SAVE these values NOW before anything else happens!
        self.final_crystals = getattr(self, 'crystals', 0)
        self.final_boosts = getattr(self, 'boosts', 0)
        self.final_time = total_time

        print "[RACE] Finished (or gave up):", crossedFinishLine, " Time:", total_time, " Crystals:", self.final_crystals, " Boosts:", self.final_boosts

        if not isOnline():
            self.ranking = self.calculateOfflineRank(total_time, self._TRACK)
            BigWorld.callback(2, self.showResultsScreen)
        else:
            BigWorld.callback(0.2, self.cleanup)

    def showResultsScreen(self):
        """Show the end-of-race results screen"""
        try:
            BigWorld.player().user.setVehicle(0, 'Biped')
            
            for h in getattr(self, "pots", []):
                BigWorld.delPot(h)
            self.pots = []
            
            StopMusic()
            PlayMusic(0)
            
            from Bitcasters.mode.cursor import cursor
            cursor('mouse')
            
            from Bitcasters.layers.Factory import dialog
            from Util import SOLO_WIN
            
            rank = getattr(self, 'ranking', SOLO_WIN)
            placement_gold = {
                0: 100,  # 1st place
                1: 75,   # 2nd place
                2: 50,   # 3rd place
            }.get(rank, 25)  # Default 25 for participation

            # Bonus gold for collectables
            crystal_bonus = self.final_crystals * 10  # 10 gold per crystal
            boost_bonus = self.final_boosts * 5       # 5 gold per boost

            earned = placement_gold + crystal_bonus + boost_bonus

            print "[RACE] Gold breakdown - Placement:", placement_gold, "Crystals:", crystal_bonus, "Boosts:", boost_bonus, "Total:", earned
                        
            position_text = {
                0: '1st place!',
                1: '2nd place!',
                2: '3rd place!',
            }.get(rank, 'Finished!')
            
            dialog('summary', 
                    position=position_text,
                    crystals=str(getattr(self, 'final_crystals', 0)),  # Use saved values
                    boosts=str(getattr(self, 'final_boosts', 0)),      # Use saved values
                    gold='+%d' % earned if earned else '---',
                    callback=self.postcleanup)
            print "[RACE] Finished", position_text, "Gold earned: ", earned
            import BWPersonality
            BWPersonality.add_gold(BigWorld.player(), earned)
            print "[RACE -> BWP] updating gold to file"
                   
        except Exception, e:
            print "[RACE] showResultsScreen failed:", e
            BigWorld.callback(1, self.restorePlayerAndExit)

    def cleanup(self):
        """Online cleanup path"""
        BigWorld.player().cell.alight()
        BigWorld.player().user.setVehicle(0, 'Biped')
        
        try:
            for h in getattr(self, "pots", []):
                BigWorld.delPot(h)
        except:
            pass
        self.pots = []
        
        StopMusic()
        PlayMusic(0)
        
        import BWPersonality
        BWPersonality.storage().mode.layers['player'].stop = True
        self.tally_prepared = True
        if hasattr(self, 'ranking'):
            self.showtally()

    def showtally(self):
        """Online results tally"""
        del self.tally_prepared
        rank = self.ranking
        import BWPersonality
        from Bitcasters.layers.Factory import Layer
        if Layer.DIALOG_LAYER:
            return
        from Bitcasters.mode.cursor import cursor
        cursor('mouse')
        from Util import SOLO_WIN
        from Bitcasters.layers.Factory import dialog
        earned = {SOLO_WIN: 100, 0: 100}.get(rank, 0)
        dialog('summary', 
               position={SOLO_WIN: 'Top Time!', 0: '1st place!', 1: '2nd place!'}.get(rank, 'Results'),
               crystals=str(self.crystals),
               boosts=str(self.boosts),
               gold='+%d' % earned if earned else '---',
               callback=self.postcleanup)

    def postcleanup(self):
        """Called after results dialog is closed"""
        user = BigWorld.player().user
        self.cleanedUp = 0
        BigWorld.dcursor().yawPitch(0)
        BigWorld.dcursor().roll = 0
        
        if isOnline():
            BigWorld.player().base.endTimeTrial()
        else:
            BigWorld.callback(0.5, self.restorePlayerAndExit)

    def restorePlayerAndExit(self):
        """
        Offline only: Restore control to original hub player and return to WorldMode
        """
        _debug_player_class("restorePlayerAndExit (start)")

        original_space = getattr(self, "startspace", None)
        race_player    = BigWorld.player()
        orig_player    = getattr(self, "world_player_ref", None)
        snapshot       = getattr(self, "world_snapshot", {})

        print "[RACE] finalRestore info orig_space:", original_space, " race_space:", getattr(self, "race_space", None)
        print "[RACE] finalRestore orig_player:", orig_player

        if orig_player is not None:
            try:
                BigWorld.player(orig_player)
                print "[RACE] BigWorld.player() restored to orig_player id:", getattr(orig_player, "id", None)
                _debug_player_class("restorePlayerAndExit (after player())")
            except Exception, e:
                print "[RACE] BigWorld.player() restore FAILED:", e

            try:
                BigWorld.controlEntity(orig_player, True)
                print "[RACE] controlEntity(TRUE) on orig_player"
                _debug_player_class("restorePlayerAndExit (after controlEntity)")
            except Exception, e:
                print "[RACE] controlEntity restore FAILED:", e

            _patchOfflineFriendsAndInventory(orig_player, snapshot)

            hub_pos      = Vector3(-170, 0, 354)
            hub_rot_vec3 = Vector3(0, 0, 0)

            try:
                if hasattr(orig_player, "user") and original_space is not None:
                    if getattr(orig_player, "spaceID", None) != original_space:
                        print "PlayerAvatar", orig_player, "WILL TELEPORT TO SPACE:", original_space
                        try:
                            orig_player.user.teleportSpace(original_space)
                            print "[RACE] teleportSpace to original_space requested"
                        except Exception, e:
                            print "[RACE] teleportSpace FAILED:", e
            except Exception, e:
                print "[RACE] ensure-space failed:", e

            try:
                orig_player.user.setVehicle(0, 'Biped')
            except:
                pass

            try:
                orig_player.user.teleport(hub_pos, hub_rot_vec3)
                print "[RACE] teleported orig_player to hub_pos"
            except Exception, e:
                print "[RACE] user.teleport hub FAILED:", e
                try:
                    orig_player.position = hub_pos
                    orig_player.yaw = 0
                except:
                    pass

        import BWPersonality
        screen = BWPersonality.changeMode('Loading', 'WorldMode')

        from LoadScreenController import LoadScreenController
        LoadScreenController(screen, callback=(lambda : screen.setProgress(1)))

        try:
            if race_player is not None:
                try:
                    race_player.leaveWorld()
                except Exception, e:
                    print "[RACE] race_player.leaveWorld() during final cleanup failed:", e

                #This always fails
                #try:
                #    BigWorld.delEntity(race_player.id)
                #    print "[RACE] race avatar entity deleted"
                #except Exception, e:
                #    print "[RACE] delEntity on race avatar failed:", e
        except:
            pass

        print "[RACE] WorldMode restored cleanly"

        self.cleanedUp = 1
        if hasattr(self, 'laps'):
            del self.laps

    def abandon(self):
        """Called when giving up during race"""
        self.doneRace(False)