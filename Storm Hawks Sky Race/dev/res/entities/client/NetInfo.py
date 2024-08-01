# uncompyle6 version 3.9.0
# Python bytecode version base 2.5 (62131)
# Decompiled from: Python 2.7.13 (v2.7.13:a06454b1afa1, Dec 17 2016, 20:53:40) [MSC v.1500 64 bit (AMD64)]
# Embedded file name: /entities/client/NetInfo.py
# Compiled at: 2008-12-16 09:35:38
import BigWorld
showNetInfoFlag = True
NETINFOFILE = None

def showNetInfo():
    global NETINFOFILE
    global showNetInfoFlag
    t = str(BigWorld.time())
    li = str(BigWorld.LatencyInfo().value)
    NETINFOFILE.write((' ').join([t, li, '\n']))
    NETINFOFILE.flush()
    showNetInfoFlag = True


def initShowNetInfo():
    global NETINFOFILE
    global showNetInfoFlag
    showNetInfoFlag = True
    NETINFOFILE = open('NetInfo.txt', 'a')
    st = str(BigWorld.serverTime())
    t = str(BigWorld.time())
    NETINFOFILE.write((' ').join([st, t, '\n']))
    NETINFOFILE.flush()


def spawnShowNetInfo():
    global showNetInfoFlag
    if showNetInfoFlag == True:
        showNetInfoFlag = False
        BigWorld.callback(5.0, showNetInfo)