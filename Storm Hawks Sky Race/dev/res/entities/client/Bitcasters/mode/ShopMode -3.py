# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/Bitcasters/mode/ShopMode.py
# Compiled at: 2008-12-16 09:35:38

from Util import ignore
import BWPersonality
import ResMgr
from cursor import cursor
from keys import *
from InventoryItem import keyToSlotID, slotIDToKey, serialize, deserialize, InventoryItem, WEAR_SLOT_COUNT
from Mode import Mode
import BigWorld
import items as game_items

# NOTE: this used to be hardcoded to "characters.txt" in updateInventory(),
# which is stale -- CharCreation.py and CharSelection.py both moved to
# player.dat a while ago. Reading from the old file meant the shop was
# always working from disconnected/out-of-date data regardless of what
# was actually saved.
CHAR_FILE = 'player.dat'


def _colour_strengths_for_setting(cs):
    """
    NOTE: no longer used for OfflineShopItem.colours -- see
    _colour_pair_for_item() below, which returns real 0-255
    clothesColour palette indices instead of 0.0-1.0 strength floats.
    Left here for reference since it documents how the original
    Inventorybutton.setItem() code was discovered to work:

        for (layer, colour) in zip((self.layers[2], self.layers[1]), item.colours):
            layer.bg.colour = tuple(
                (int(x * 256) for x in translateColour(colour, 'clothesColour2'))
            )[:3] + (255, )

    This tells us:
      - 'colour' is passed directly into translateColour()
      - translateColour() expects a single numeric tint value (NOT a tuple, NOT a string)
    """
    base_strengths = [
        (1.0, 0.7),  # clothes_setting 0
        (0.9, 0.6),  # 1
        (0.8, 0.5),  # 2
        (0.7, 0.4),  # 3
        (0.6, 0.3),  # 4
    ]
    return base_strengths[cs % len(base_strengths)]


# The 11 distinct gradient stops in clothesColour1/clothesColour2 (see
# Bitcasters/CharCreationColours.py) land on clean, whole-number
# palette indices at roughly these values (spaced 256/10 apart, the
# same spacing translateColour() itself uses). Picking from this list
# gives each item a genuinely different hue rather than just a
# lighter/darker shade of the same one every time.
_COLOUR_STOPS = [0, 26, 51, 77, 102, 128, 154, 179, 205, 230, 255]


def _colour_pair_for_item(item_id):
    """
    Return a real (colour1, colour2) pair of 0-255 clothesColour
    palette indices for this item -- the same kind of value
    Avatar.apply_shirt() feeds into cm.clothesColour1/cm.clothesColour2,
    and what Inventorybutton.setItem() runs through translateColour()
    to render the shop/inventory icon. Using the same index for both
    still produces a two-tone look on its own, since clothesColour2's
    table is inherently a darker variant of clothesColour1's table at
    matching indices (e.g. index 128 -> (198,198,74) for colour1 vs
    (131,131,22) for colour2 -- same hue family, naturally darker).
    Variety across items comes from cycling which stop each item lands
    on, deterministically by item id so it's stable across loads.
    """
    stop = _COLOUR_STOPS[item_id % len(_COLOUR_STOPS)]
    return (stop, stop)


# Representative swatch colour for each real trim material used in
# items.py's gloves/pants/shirt/shoes zone maps (matches the actual
# _copper.dds/_gold.dds/_silver.dds texture variants under
# characters/human/<gender>/textures/armour/). An item with no material
# set on any zone falls back to DEFAULT_MATERIAL_RGB.
MATERIAL_COLOURS = {
    'copper': (184, 115, 51),
    'silver': (196, 196, 204),
    'gold':   (212, 175, 55)
}
DEFAULT_MATERIAL_RGB = (200, 200, 200)


def _dominant_material(raw_dict):
    """
    Tally the material used across every zone in an item's
    gloves/pants/shirt/shoes dicts (e.g. {'forearm_L': 'copper', ...})
    and return whichever material appears most often, or None if the
    item has no material data at all (plain/default trim).
    """
    tally = {}
    for piece_key in ('gloves', 'pants', 'shirt', 'shoes'):
        piece = raw_dict.get(piece_key, {})
        if not isinstance(piece, dict):
            continue
        for (zone, material) in piece.items():
            tally[material] = tally.get(material, 0) + 1

    if not tally:
        return None

    ranked = sorted(tally.items(), key=lambda kv: (-kv[1], kv[0]))
    return ranked[0][0]


class OfflineShopItem(object):
    """
    Offline stand-in for a real server item that the shop UI expects.

    Must support:
      - clothes() -> int      (used to pick sprite frame)
      - cost()    -> int      (price)
      - desc()    -> string   (tooltip)
      - .colours  -> iterable of 2 numeric tint values
      - ['cost'], ['id'], ['type'], etc. via __getitem__

    NOTE: DO NOT set self.clothes = <float> because Inventorybutton calls
    item.clothes() as a FUNCTION. We expose clothes() as a method.
    """

    def __init__(self, item_id, raw_dict, desc_txt):
        # keep raw data from ITEM_MAP
        self.raw = raw_dict
        self.id = item_id
        self.type = raw_dict.get('type', 'unknown')

        # cost (int)
        self._cost_val = raw_dict.get('cost', 0)

        # description for hover text
        self._desc_val = desc_txt

        # clothes_setting is a small int: 0,1,2,...
        cs = raw_dict.get('clothes_setting', 0)
        self._clothes_setting = cs

        # colours: a real (colour1, colour2) pair of 0-255
        # clothesColour palette indices -- exactly what
        # Avatar.apply_shirt()/InventoryItem.insert() expect, and what
        # Inventorybutton.setItem() renders via translateColour(). This
        # used to be a pair of 0.0-1.0 "strength" floats with no
        # relationship to the real dye system at all, which is why the
        # shop icon never matched what the item would actually look
        # like once equipped.
        self.colours = list(_colour_pair_for_item(item_id))

        # material_name/material_rgb: derived from the item's actual
        # gloves/pants/shirt/shoes zone data in items.py (copper/silver/
        # gold trim), not from clothes_setting or item id. This is what
        # Inventorybutton.setItem() should use for the shop icon's base
        # colour so it actually reflects what trims/colours the item
        # has, instead of an arbitrary id-based palette pick.
        self.material_name = _dominant_material(raw_dict)
        self.material_rgb = MATERIAL_COLOURS.get(self.material_name, DEFAULT_MATERIAL_RGB)

    # callable style API

    def cost(self):
        return self._cost_val

    def clothes(self):
        # Inventorybutton calls this, then does:
        #   base = 12 + clothes * 4
        # so this MUST be an int / small number (0,1,2,...)
        return self._clothes_setting

    def desc(self):
        return self._desc_val

    # dict-style fallback for code paths that do item['cost'], etc.
    def __getitem__(self, key):
        if key == 'cost':
            return self._cost_val
        if key == 'id':
            return self.id
        if key == 'type':
            return self.type
        if key == 'data':
            return self.raw
        if key == 'desc':
            return self._desc_val
        if key == 'clothes_setting':
            return self._clothes_setting
        if key == 'colours':
            return self.colours
        return None


def build_stock_from_items_map(max_items=12, vendor_type=None):
    """
    Build the vendor stock dict that layers/shop.py expects:
      { 0: OfflineShopItem(...),
        1: OfflineShopItem(...),
        ... }

    layers/shop.py does:
        for (k, v) in shop_inventory.items():
            self.components['buy_%d' % k].setItem(v)

    So keys MUST be numeric slot indices (0,1,2...)
    and values MUST be OfflineShopItem objects.

    vendor_type, if given, filters ITEM_MAP down to items matching that
    vendor's configured clothes_setting(s) in VENDOR_STOCK_FILTERS --
    see that dict below to give a custom vendor its own stock. Every
    item in items.ITEM_MAP has a 'clothes_setting' of 0 (civilian), 1
    (military dress) or 2 (flight suit); vendor_type=None (or a type
    with no entry in VENDOR_STOCK_FILTERS) sells the full unfiltered
    catalog, same as before.
    """
    allowed_settings = None
    if vendor_type is not None:
        cfg = VENDOR_STOCK_FILTERS.get(vendor_type)
        if cfg:
            allowed_settings = cfg.get('clothes_settings')

    stock_dict = {}
    try:
        try:
            item_ids = sorted(game_items.ITEM_MAP.keys())
        except:
            item_ids = game_items.ITEM_MAP.keys()

        slot_index = 0
        for item_id in item_ids:
            raw = game_items.ITEM_MAP[item_id]

            if allowed_settings is not None:
                if raw.get('clothes_setting', 0) not in allowed_settings:
                    continue

            # description: try CLOTHES_DESC[clothes_setting]
            desc_txt = 'No description.'
            try:
                cs_tmp = raw.get('clothes_setting', 0)
                desc_txt = game_items.CLOTHES_DESC[cs_tmp]
            except:
                pass

            stock_item = OfflineShopItem(item_id, raw, desc_txt)
            stock_dict[slot_index] = stock_item

            # Log what colour this item will actually render as -- run
            # its real (colour1, colour2) through the same
            # translateColour() lookup Inventorybutton.setItem() uses,
            # so this line shows the literal RGB that'll appear on
            # both the icon and (once equipped) the character model.
            try:
                from Bitcasters.CharacterModel import translateColour
                colour1, colour2 = stock_item.colours
                bright_rgb = tuple((int(x * 256) for x in translateColour(colour1, 'clothesColour1')))[:3]
                dark_rgb = tuple((int(x * 256) for x in translateColour(colour2, 'clothesColour2')))[:3]
                print "[Shop] load slot=%2d id=%3d clothes_setting=%s cost=%-5s colour1=%-3s colour2=%-3s bright=%s dark=%s material=%s" % (
                    slot_index, stock_item.id, stock_item.clothes(), stock_item.cost(),
                    colour1, colour2, bright_rgb, dark_rgb, stock_item.material_name
                )
            except Exception, e:
                print "[Shop] load slot=%d id=%s -- colour logging failed: %s" % (slot_index, item_id, e)

            slot_index += 1
            if slot_index >= max_items:
                break

    except Exception, e:
        print "[Shop] build_stock_from_items_map failed:", e
        stock_dict = {}

    print "[Shop] Loaded %d items for vendor_type=%s (order above matches display order)" % (len(stock_dict), vendor_type)
    return stock_dict


# Custom vendors: add an entry here keyed by the vendor's vendorType
# (see Vendor.py -- WALLOP_M_1 = 0, HUMAN_M_1 = 1, and any new type you
# add there) to give that vendor a restricted stock list. Any
# vendorType not listed here (or with no 'clothes_settings' entry)
# falls back to selling the full catalog.
VENDOR_STOCK_FILTERS = {
    0: {'clothes_settings': [0, 1]},   # WALLOP_M_1 / Endo -- civilian + military dress
    1: {'clothes_settings': [1, 2]},   # HUMAN_M_1  / Arix -- military dress + flight suits
}


def _safe_eval_line(line):
    """
    We can't rely on 'ast' in this Python version, but player.dat lines
    are written using repr(dict). We'll eval them with no builtins allowed.

    If it fails or isn't a dict, return None.
    """
    try:
        obj = eval(line.strip(), {"__builtins__": {}}, {})
    except:
        return None

    if not isinstance(obj, dict):
        return None
    return obj


def _load_all_records():
    """Read every character record out of player.dat, one repr(dict) per line."""
    try:
        f = open(CHAR_FILE, "r")
        lines = f.readlines()
        f.close()
    except Exception, e:
        print "[Shop] Failed to open", CHAR_FILE, ":", e
        return []

    records = []
    for line in lines:
        rec = _safe_eval_line(line)
        if rec:
            records.append(rec)
    return records


def _write_all_records(records):
    """Rewrite player.dat from a list of dicts, one repr(dict) per line."""
    try:
        f = open(CHAR_FILE, "w")
        for rec in records:
            f.write(repr(rec) + "\n")
        f.close()
    except Exception, e:
        print "[Shop] Failed to write", CHAR_FILE, ":", e


def _find_char_record(char_name):
    for rec in _load_all_records():
        if rec.get("name") == char_name:
            return rec
    return None


def _next_free_bag_slot(inventory_dict):
    """Lowest unused bag slotID (>= WEAR_SLOT_COUNT) in a {slotID: InventoryItem} dict."""
    slot = WEAR_SLOT_COUNT
    while slot in inventory_dict:
        slot += 1
    return slot


def _save_offline_state(char_name, player):
    """
    Write player.gold and player.inventory back into this character's
    record in player.dat, under the same 'offline' block CharCreation.py
    already writes (gold / inventory_equipped / inventory_bag).
    """
    records = _load_all_records()
    updated = False
    for rec in records:
        if rec.get("name") == char_name:
            offline = rec.get("offline", {})
            offline["gold"] = getattr(player, "gold", 0)

            inv = getattr(player, "inventory", {}) or {}
            equipped = dict((k, v) for (k, v) in inv.items() if k < WEAR_SLOT_COUNT)
            bag = dict((k, v) for (k, v) in inv.items() if k >= WEAR_SLOT_COUNT)
            try:
                offline["inventory_equipped"] = serialize(equipped)
            except Exception, e:
                print "[Shop] serialize(equipped) failed:", e
            try:
                offline["inventory_bag"] = serialize(bag)
            except Exception, e:
                print "[Shop] serialize(bag) failed:", e

            rec["offline"] = offline
            updated = True
            break

    if updated:
        _write_all_records(records)
        print "[Shop] Saved offline state for '%s'" % char_name
    else:
        print "[Shop] WARNING: could not find '%s' in %s to save" % (char_name, CHAR_FILE)


class ShopMode(Mode):

    def __init__(self, handler, npc_id):
        cursor('mouse')

        Mode.__init__(self, handler, {
            KEY_ESCAPE: [self.click_exit, ignore]
        })

        self.npc_id = npc_id
        self.sale = -1
        self.player_inventory = None
        self.npc_inventory = None
        self.char_name = None

        from Bitcasters.layers.Factory import create
        self.inventory = create('inventory', 0.7, owner=self, full=False)
        self.shop      = create('shop',      0.75, owner=self, full=False)

        # Header for the shop panel (right side)
        owner_name = "Shopkeeper"
        try:
            owner_name = BigWorld.entities[npc_id].name_for_shop_gui()
        except:
            pass

        try:
            self.shop.components['shop'].write('owner', owner_name)
        except:
            pass

        try:
            self.shop.components['shop'].write('title', 'Clothing Shop')
        except:
            pass

        try:
            self.shop.components['ok'].visible = False
        except:
            pass

        # Left panel (player inv + gold) - now pulled from player.dat
        self.updateInventory()

        # Right panel (vendor stock) - generated offline from ITEM_MAP,
        # filtered by this vendor's vendorType if VENDOR_STOCK_FILTERS
        # has an entry for it (see that dict above build_stock_from_items_map).
        vendor_type = None
        try:
            vendor_type = BigWorld.entities[npc_id].vendorType
        except:
            pass
        stock_dict = build_stock_from_items_map(12, vendor_type=vendor_type)
        self.browseShop(stock_dict)

        # Live code would call npc.cell.windowShop() to refresh.
        # Offline we wrap so nothing explodes.
        try:
            BigWorld.entities[npc_id].cell.windowShop()
        except:
            pass

        print "[Shop] Init run"

    def updateInventory(self, *ignored):
        """
        Load the current character's saved info (gold, inventory) from
        player.dat and push it into:
          - self.player_inventory  (real {slotID: InventoryItem} shape --
            this is also what BigWorld.player().inventory gets set to,
            since that property is shared with the real Inventory mode,
            which can't understand any other shape)
          - the left-side inventory UI layer
        """
        p = BigWorld.player()

        # figure out which character we are
        try:
            char_name = getattr(p, "name")
        except:
            char_name = None
        if not char_name:
            char_name = "Unnamed"
        self.char_name = char_name

        char_data = _find_char_record(char_name)

        # pull offline fields or fallback
        gold_val = 0
        equipped_desc = []
        bag_desc = []

        if char_data:
            offline = char_data.get("offline", {})
            gold_val = offline.get("gold", 0)
            equipped_desc = offline.get("inventory_equipped", [])
            bag_desc = offline.get("inventory_bag", [])
        else:
            print "[Shop] No matching char record; using fallback inventory."

        # build the real {slotID: InventoryItem} shape from the saved
        # serialized descriptions
        inv = {}
        try:
            inv.update(deserialize(equipped_desc))
        except Exception, e:
            print "[Shop] failed to deserialize equipped:", e
        try:
            inv.update(deserialize(bag_desc))
        except Exception, e:
            print "[Shop] failed to deserialize bag:", e

        # push these into player object so other systems see them
        try:
            p.gold = gold_val
        except:
            p.__dict__["gold"] = gold_val

        try:
            p.inventory = inv
        except:
            p.__dict__["inventory"] = inv

        self.player_inventory = inv

        # update the left panel layer
        try:
            self.inventory.update(gold_val, self.player_inventory)
        except Exception, e:
           print "[Shop] inventory.update() failed:", e

        print "[Shop] UpdateInventory gold=%s slots=%s" % (
            str(gold_val), str(inv.keys())
        )

    def browseShop(self, shop_inventory):
        """
        Give the right-side shop layer a dict:
            { slot_index: OfflineShopItem, ... }
        """
        self.npc_inventory = shop_inventory
        try:
            self.shop.update(shop_inventory)
        except Exception, e:
            print "[Shop] shop.update() failed:", e

    def click_exit(self):
        BWPersonality.changeMode('WorldMode')

    def clearPrice(self, ok_visible):
        try:
            self.shop.components['ok'].visible = ok_visible
        except:
            pass

        if self.sale >= 16:
            # selling from player inventory
            icon_name = 'icon_%d' % (self.sale - 16)
            try:
                self.inventory.components[icon_name].clear_price()
            except:
                pass
        elif self.sale >= 0:
            # buying from shop list
            buy_name = 'buy_%d' % self.sale
            try:
                self.shop.components[buy_name].clear_price()
            except:
                pass

    def click_ok(self):
        """
        Confirm buy or sell. There's no base/cell for offline entities
        (vendor and player are both created with BigWorld.createEntity
        directly, so neither has .base/.cell), which is why the old
        BigWorld.player().base.sell(...) / cell.sellTo(...) calls always
        threw and silently fell through to a debug print with no actual
        transaction. This does the transaction directly against
        gold/inventory and persists the result to player.dat.
        """
        p = BigWorld.player()

        if self.sale >= 16:
            # selling a player item back to the vendor
            slot = self.sale
            inv = getattr(p, 'inventory', {}) or {}

            if slot not in inv:
                print "[Shop] sell failed: slot %s not in inventory" % str(slot)
            else:
                item_obj = inv[slot]
                try:
                    sell_value = item_obj.cost() / 2
                except Exception, e:
                    print "[Shop] sell failed: could not price item in slot %s: %s" % (str(slot), e)
                    sell_value = None

                if sell_value is not None:
                    del inv[slot]
                    p.gold = getattr(p, 'gold', 0) + sell_value
                    p.inventory = inv
                    self.player_inventory = inv

                    try:
                        self.inventory.update(p.gold, self.player_inventory)
                    except Exception, e:
                        print "[Shop] inventory.update() after sell failed:", e

                    _save_offline_state(self.char_name or getattr(p, 'name', 'Unnamed'), p)
                    print "[Shop] Sold slot=%s value=%s remaining_gold=%s" % (
                        str(slot), str(sell_value), str(p.gold)
                    )

        elif self.sale >= 0:
            # buying from vendor stock
            item_obj = None
            item_id = None
            item_cost = 0

            try:
                item_obj = self.npc_inventory[self.sale]
            except:
                item_obj = None

            if item_obj is not None:
                # Method/attr-style access first (real OfflineShopItem API)
                try:
                    item_id = item_obj.id
                except:
                    try:
                        item_id = item_obj['id']
                    except:
                        pass
                try:
                    item_cost = item_obj.cost()
                except:
                    try:
                        item_cost = item_obj['cost']
                    except:
                        item_cost = 0

            if item_id is None:
                print "[Shop] buy failed: could not resolve item id for sale=%s" % str(self.sale)
            else:
                current_gold = getattr(p, 'gold', 0)
                if current_gold < item_cost:
                    print "[Shop] buy failed: not enough gold (have %s, need %s)" % (
                        str(current_gold), str(item_cost)
                    )
                else:
                    inv = getattr(p, 'inventory', {}) or {}

                    # Use the item's real (colour1, colour2) -- the same
                    # values the shop icon was actually rendered with
                    # (see OfflineShopItem.__init__ / Inventorybutton.
                    # setItem()) -- so what you see in the shop is
                    # exactly what you get once equipped.
                    item_colour1, item_colour2 = 128, 128
                    try:
                        item_colour1, item_colour2 = item_obj.colours
                    except:
                        pass

                    new_item = InventoryItem()
                    new_item.insert({'prototype_id': item_id,
                                      'colour1': item_colour1,
                                      'colour2': item_colour2,
                                      'condition': 0}, 1)

                    slot = _next_free_bag_slot(inv)
                    inv[slot] = new_item
                    p.gold = current_gold - item_cost
                    p.inventory = inv
                    self.player_inventory = inv

                    try:
                        self.inventory.update(p.gold, self.player_inventory)
                    except Exception, e:
                        print "[Shop] inventory.update() after buy failed:", e

                    _save_offline_state(self.char_name or getattr(p, 'name', 'Unnamed'), p)
                    print "[Shop] Bought item_id=%s cost=%s new_slot=%s remaining_gold=%s" % (
                        str(item_id), str(item_cost), str(slot), str(p.gold)
                    )

        self.clearPrice(False)
        self.sale = -1

    def click_icon(self, component):
        """
        Player clicked on their own inventory slot (left panel)
        """
        try:
            comp_i = int(component)
        except:
            return

        self.clearPrice(True)
        self.sale = keyToSlotID((0, comp_i))

        # Estimate sell value from the real item in that slot, if any.
        price_val = 0
        try:
            if self.sale in self.player_inventory:
                item_obj = self.player_inventory[self.sale]
                price_val = item_obj.cost() / 2
        except:
            price_val = 0

        icon_name = 'icon_%s' % component
        try:
            self.inventory.components[icon_name].show_price(price_val)
        except:
            pass

    def click_buy(self, component):
        """
        Player clicked a vendor item (right panel)
        """
        try:
            idx = int(component)
        except:
            return

        self.clearPrice(True)
        self.sale = idx

        price_val = 0
        try:
            # dict-style
            price_val = self.npc_inventory[idx]['cost']
        except:
            try:
                # method-style
                price_val = self.npc_inventory[idx].cost()
            except:
                try:
                    price_val = self.npc_inventory[idx].cost
                except:
                    price_val = 0

        buy_name = 'buy_%s' % component
        try:
            self.shop.components[buy_name].show_price(price_val)
        except:
            pass

    def cleanup(self):
        print "[Shop] Cleanup"
        try:
            self.inventory.cleanup()
        except:
            pass
        try:
            self.shop.cleanup()
        except:
            pass
