# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/common/Lib/bsddb/test/test_1413192.py
# Compiled at: 2008-12-16 09:37:56
import shutil, tempfile, warnings
try:
    from bsddb3 import db
except ImportError:
    from bsddb import db

env_name = tempfile.mkdtemp()

class Context:

    def __init__(self):
        self.env = db.DBEnv()
        self.env.open(env_name, db.DB_CREATE | db.DB_INIT_TXN | db.DB_INIT_MPOOL)
        self.the_txn = self.env.txn_begin()
        self.map = db.DB(self.env)
        self.map.open('xxx.db', 'p', db.DB_HASH, db.DB_CREATE, 438, txn=self.the_txn)
        del self.env
        del self.the_txn


warnings.filterwarnings('ignore', 'DBTxn aborted in destructor')
try:
    context = Context()
    del context
finally:
    warnings.resetwarnings()

try:
    shutil.rmtree(env_name)
except EnvironmentError:
    pass