# Bitcasters/OfflineSave.py
#
# Shared offline-save helpers for reading/writing player.dat. Used by
# Inventory.py (equip changes) and can be used by ShopMode.py too, so
# every offline system saves gold/inventory to the same place in the
# same shape rather than each keeping its own copy of this logic.

CHAR_FILE = 'player.dat'


def _safe_eval_line(line):
    """
    player.dat lines are written using repr(dict). Eval them with no
    builtins allowed. If it fails or isn't a dict, return None.
    """
    try:
        obj = eval(line.strip(), {'__builtins__': {}}, {})
    except:
        return None

    if not isinstance(obj, dict):
        return None
    return obj


def load_all_records():
    """Read every character record out of player.dat, one repr(dict) per line."""
    try:
        f = open(CHAR_FILE, 'r')
        lines = f.readlines()
        f.close()
    except Exception, e:
        print '[OfflineSave] Failed to open', CHAR_FILE, ':', e
        return []

    records = []
    for line in lines:
        rec = _safe_eval_line(line)
        if rec:
            records.append(rec)
    return records


def write_all_records(records):
    """Rewrite player.dat from a list of dicts, one repr(dict) per line."""
    try:
        f = open(CHAR_FILE, 'w')
        for rec in records:
            f.write(repr(rec) + '\n')
        f.close()
    except Exception, e:
        print '[OfflineSave] Failed to write', CHAR_FILE, ':', e


def find_char_record(char_name):
    for rec in load_all_records():
        if rec.get('name') == char_name:
            return rec
    return None


def next_free_bag_slot(inventory_dict):
    """Lowest unused bag slotID (>= WEAR_SLOT_COUNT) in a {slotID: InventoryItem} dict."""
    from InventoryItem import WEAR_SLOT_COUNT
    slot = WEAR_SLOT_COUNT
    while slot in inventory_dict:
        slot += 1
    return slot


def save_offline_state(char_name, player):
    """
    Write player.gold and player.inventory back into this character's
    record in player.dat, under the 'offline' block (gold /
    inventory_equipped / inventory_bag) CharCreation.py already writes.
    """
    from InventoryItem import serialize, WEAR_SLOT_COUNT

    records = load_all_records()
    updated = False
    for rec in records:
        if rec.get('name') == char_name:
            offline = rec.get('offline', {})
            offline['gold'] = getattr(player, 'gold', 0)

            inv = getattr(player, 'inventory', {}) or {}
            equipped = dict((k, v) for (k, v) in inv.items() if k < WEAR_SLOT_COUNT)
            bag = dict((k, v) for (k, v) in inv.items() if k >= WEAR_SLOT_COUNT)
            try:
                offline['inventory_equipped'] = serialize(equipped)
            except Exception, e:
                print '[OfflineSave] serialize(equipped) failed:', e
            try:
                offline['inventory_bag'] = serialize(bag)
            except Exception, e:
                print '[OfflineSave] serialize(bag) failed:', e

            rec['offline'] = offline
            updated = True
            break

    if updated:
        write_all_records(records)
        print "[OfflineSave] Saved offline state for '%s'" % char_name
    else:
        print "[OfflineSave] WARNING: could not find '%s' in %s to save" % (char_name, CHAR_FILE)
