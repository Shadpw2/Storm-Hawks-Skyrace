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
from InventoryItem import keyToSlotID, slotIDToKey
from Mode import Mode
import BigWorld
import items as game_items


def _colour_strengths_for_setting(cs):
    """
    Return two scalar floats for this clothing setting.
    Inventorybutton.setItem() does:

        for (layer, colour) in zip((self.layers[2], self.layers[1]), item.colours):
            layer.bg.colour = tuple(
                (int(x * 256) for x in translateColour(colour, 'clothesColour2'))
            )[:3] + (255, )

    This tells us:
      - 'colour' is passed directly into translateColour()
      - translateColour() expects a single numeric tint value (NOT a tuple, NOT a string)

    So we give it two floats: a base tint and a slightly dimmer tint.
    We derive them from clothes_setting so different items aren't all identical.
    """
    base_strengths = [
        (1.0, 0.7),  # clothes_setting 0
        (0.9, 0.6),  # 1
        (0.8, 0.5),  # 2
        (0.7, 0.4),  # 3
        (0.6, 0.3),  # 4
    ]
    return base_strengths[cs % len(base_strengths)]


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

        # colours: MUST be two numeric tint values, not tuples
        # the Inventorybutton will pass these to translateColour()
        # which expects a single scalar it can manipulate.
        strengthA, strengthB = _colour_strengths_for_setting(cs)
        self.colours = [strengthA, strengthB]

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


def build_stock_from_items_map(max_items=12):
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
    """
    stock_dict = {}
    try:
        try:
            item_ids = sorted(game_items.ITEM_MAP.keys())
        except:
            item_ids = game_items.ITEM_MAP.keys()

        slot_index = 0
        for item_id in item_ids:
            raw = game_items.ITEM_MAP[item_id]

            # description: try CLOTHES_DESC[clothes_setting]
            desc_txt = 'No description.'
            try:
                cs_tmp = raw.get('clothes_setting', 0)
                desc_txt = game_items.CLOTHES_DESC[cs_tmp]
            except:
                pass

            stock_item = OfflineShopItem(item_id, raw, desc_txt)
            stock_dict[slot_index] = stock_item

            slot_index += 1
            if slot_index >= max_items:
                break

    except Exception, e:
        print "[Shop] build_stock_from_items_map failed:", e
        stock_dict = {}

    return stock_dict


def _safe_eval_line(line):
    """
    We can't rely on 'ast' in this Python version, but your characters.txt lines
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

        # Left panel (player inv + gold) - now pulled from characters.txt
        self.updateInventory()

        # Right panel (vendor stock) - generated offline from ITEM_MAP
        stock_dict = build_stock_from_items_map(12)
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
        Load the current character's saved info (gold, inventory) from characters.txt
        and push it into:
          - self.player_inventory
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

        # read characters.txt, find this char's record
        char_data = None
        try:
            f = open("characters.txt", "r")
            lines = f.readlines()
            f.close()
        except Exception, e:
            print "[Shop] Failed to open characters.txt:", e
            lines = []

        for line in lines:
            rec = _safe_eval_line(line)
            if not rec:
                continue
            if rec.get("name") == char_name:
                char_data = rec
                break

        # pull offline fields or fallback
        gold_val = 0
        inv_obj = {"equipped": [], "bag": []}

        if char_data:
            offline = char_data.get("offline", {})
            gold_val = offline.get("gold", 0)
            inv_obj["equipped"] = offline.get("inventory_equipped", [])
            inv_obj["bag"] = offline.get("inventory_bag", [])
        else:
            print "[Shop] No matching char record; using fallback inventory."

        # push these into player object so other systems see them
        try:
            p.gold = gold_val
        except:
            p.__dict__["gold"] = gold_val

        try:
            p.inventory = inv_obj
        except:
            p.__dict__["inventory"] = inv_obj

        self.player_inventory = inv_obj

        # update the left panel layer
        try:
            self.inventory.update(gold_val, self.player_inventory)
        except Exception, e:
           print "[Shop] inventory.update() failed:", e

        # debug
        try:
            inv_keys = self.player_inventory.keys()
        except:
            inv_keys = type(self.player_inventory)
        print "[Shop] UpdateInventory gold=%s inv_keys=%s" % (
            str(gold_val), str(inv_keys)
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
        Confirm buy or sell. Offline we just log what would've happened.
        """
        if self.sale >= 16:
            # selling a player item
            try:
                BigWorld.player().base.sell(self.sale)
            except:
                print "[Shop] offline sell stub sale=%s" % str(self.sale)

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
                # Dict-style access
                try:
                    item_id = item_obj['id']
                except:
                    pass
                try:
                    item_cost = item_obj['cost']
                except:
                    pass

                # Method/attr-style access
                if item_id is None:
                    try:
                        item_id = item_obj.id
                    except:
                        pass
                if not item_cost:
                    try:
                        item_cost = item_obj.cost()
                    except:
                        try:
                            item_cost = item_obj.cost
                        except:
                            pass

            try:
                BigWorld.entities[self.npc_id].cell.sellTo(self.sale)
            except:
                print "[Shop] offline buy stub idx=%s id=%s cost=%s" % (
                    str(self.sale), str(item_id), str(item_cost)
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

        # Estimate sell value. Offline fallback = 0.
        price_val = 0
        try:
            if isinstance(self.player_inventory, dict):
                price_val = 0
            else:
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
