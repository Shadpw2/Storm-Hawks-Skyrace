# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/CharSelection.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld, GUI, BWPersonality, Math
from math import *
from keys import *
from Util import ignore
from Mode import Mode

from Bitcasters.Const import isOnline
CHAR_FILE = 'player.dat'

def _write_offline_characters(char_list):
    """Rewrite characters.txt from a list of dicts; one repr-record per line."""
    try:
        f = open(CHAR_FILE, 'w')
        for rec in char_list:
            f.write(repr(rec) + '\n')
        f.close()
    except:
        pass

def _load_offline_characters():
    """
    Load characters from characters.txt, one record per line.
    Returns a list; each item is either a dict or a string (raw line).
    """
    out = []
    try:
        f = open(CHAR_FILE, 'r')
        for ln in f:
            ln = ln.strip()
            if not ln:
                continue
            # If it looks like a dict repr, try to parse; else keep as string.
            if ln.startswith('{') and ln.endswith('}'):
                try:
                    rec = eval(ln, {'__builtins__': {}}, {})
                except:
                    rec = ln
                out.append(rec)
            else:
                out.append(ln)
        f.close()
    except:
        # no file found or unreadable => return empty; caller will handle
        pass
    return out

def _coerce_char(rec):
    """
    Return a flat dict with everything the CharSelection layer expects at top level.
    - Merge nested 'data' into the top level
    - Ensure required keys exist with safe defaults
    """
    if not isinstance(rec, dict):
        # accept a plain string name
        return {'name': str(rec), 'class': 0, 'species': 0, 'hair': 0, 'gender': 0, 'clothes': 0,
                'eyeColour': 128, 'hairColour1': 128, 'hairColour2': 128,
                'clothesColour1': 128, 'clothesColour2': 128, 'skinColour': 128}

    flat = {}
    d = rec.get('data')
    if isinstance(d, dict):
        flat.update(d)      # bring all slider fields up (species, hair, colours, etc.)

    flat.update(rec)        # top-level 'name' / 'class' override nested if present

    # ensure minimum required fields so layer won't KeyError
    flat.setdefault('name', 'Unnamed')
    flat.setdefault('class', 0)
    flat.setdefault('species', 0)
    flat.setdefault('hair', 0)
    flat.setdefault('gender', 0)
    flat.setdefault('clothes', 0)

    # colour/slider defaults (adjust if your UI expects different base values)
    for k in ('eyeColour','hairColour1','hairColour2','clothesColour1','clothesColour2','skinColour'):
        flat.setdefault(k, 128)

    return flat


class CharSelection(Mode):

    def __init__(self, handler, scene, characters, online):
        self.online = online
        BigWorld.callback(0.01, (lambda: self.layer.click_char(0)))
        self._refresh_later(delay=0.05)

        # Load from file if it has anything; otherwise fall back to the passed list
        file_chars = _load_offline_characters()
        if file_chars:
            raw_chars = file_chars
        else:
            raw_chars = characters or []

        # Flatten + defaults so the layer never KeyErrors
        self.characters = [ _coerce_char(c) for c in raw_chars ] + characters

        # Defensive cap: Bitcasters/layers/CharSelection.py's preinit()
        # hard-asserts charcount is between 1 and 5 (matching the
        # new_character button's own charcount < 5 visibility check).
        # player.dat has no cap of its own -- it only ever grows across
        # sessions -- so once it holds more than 5 characters this mode
        # crashes outright on the very first entry, with no fallback.
        # Keep the 5 most recently created/loaded characters.
        if len(self.characters) > 5:
            self.characters = self.characters[-5:]

        # If still empty, drop into creation instead of crashing
        if not self.characters:
            BWPersonality.changeMode('CharCreation', scene, self.online)
            return

        from Bitcasters.layers.Factory import create
        self.layer = create('CharSelection', 0.75, owner=self, chardata=self.characters, scene=scene)
        Mode.__init__(self, handler, {KEY_RETURN: [ignore, self.click_done],
                                      KEY_ESCAPE: [ignore, self.esc]})
        BigWorld.callback(0.01, (lambda: self.layer.click_char(0)))

    def _load_and_apply(self, keep_index=None):
        """Reload characters.txt and push into the UI list."""
        try:
            file_chars = _load_offline_characters()
            if not file_chars:
                return
            chars = [_coerce_char(c) for c in file_chars]
            self.characters = chars

            # push to layer
            try:
                self.layer.chardata = self.characters
            except:
                return

            # reseat selection
            if keep_index is None:
                idx = getattr(self.layer, 'selected', 0)
            else:
                idx = keep_index
            idx = max(0, min(idx, len(self.characters) - 1))
            self.layer.selected = idx

            # drive the visual update
            try:
                self.layer.click_char(idx)
            except:
                pass
        except:
            pass

    def _refresh_later(self, delay=0.25, keep_index=None):
        """Schedule a small delayed refresh so file writes land first."""
        try:
            BigWorld.callback(delay, lambda: self._load_and_apply(keep_index))
        except:
            pass

    
    def esc(self):
        """Go back to login screen"""
        self.click('back')

    def click_back(self):
        self.layer.scene._destroy()
        BWPersonality.CM.restartLogin()

    def click_done(self):
        """Enter the game with the selected character"""
        keep = None
        try:
            keep = self.layer.selected
        except:
            pass
        self._refresh_later(delay=0.25, keep_index=keep)
        character = self.characters[self.layer.selected]
        self.layer.scene._destroy()
        if self.online:
            BWPersonality.EnterOnlineWorld(character['name'])
        else:
            BWPersonality.EnterOfflineWorld(character)

    def click_new_character(self):
        self._refresh_later(delay=0.25)
        BWPersonality.changeMode('CharCreation', self.layer.scene, self.online)

    def click_delete_character(self):
        """Delete selected character, update characters.txt, and rebuild the UI in place."""
        # 1) determine selected row
        try:
            idx = self.layer.selected
        except:
            return

        # 2) best-effort engine delete (will do nothing offline, but keep it)
        try:
            BigWorld.player().delete(idx)
        except:
            pass

        # 3) remove from in-memory list and keep a copy for matching
        removed = None
        if 0 <= idx < len(self.characters):
            removed = self.characters.pop(idx)

        # 4) rewrite characters.txt (remove the same record)
        try:
            file_chars_raw = _load_offline_characters()
            file_chars = [ _coerce_char(c) for c in file_chars_raw ]

            if removed is not None:
                # match by stable signature (name, class, species)
                def sig(c):
                    return (c.get('name', ''), c.get('class', 0), c.get('species', 0))

                r_sig = sig(_coerce_char(removed))

                # prefer removal by the same index when lists align; else fall back to signature
                if 0 <= idx < len(file_chars) and sig(file_chars[idx]) == r_sig:
                    del file_chars[idx]
                else:
                    file_chars = [c for c in file_chars if sig(c) != r_sig]

            _write_offline_characters(file_chars)
            sel = getattr(self.layer, 'selected', 0) if hasattr(self, 'layer') else 0

            # cleanup old layer
            try:
                self.layer.cleanup()
            except:
                pass

            # create new layer with current characters
            from Bitcasters.layers.Factory import create
            self.layer = create('CharSelection', 0.75, owner=self,
                                chardata=self.characters, scene=self.layer.scene)

            # reseat selection + drive visuals
            sel = max(0, min(sel, len(self.characters)-1))
            try:
                self.layer.selected = sel
                self.layer.click_char(sel)
            except:
                pass



        except:
            pass


    def cleanup(self):
        Mode.cleanup(self)
        self.layer.cleanup()