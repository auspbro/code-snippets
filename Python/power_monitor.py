#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Monitoring Power on your laptop
This script works a dream for its purpose. I was recently working with my laptop and 
stepping a way for a couple of seconds, someone had unplugged my power, to plug in their own device.
I was happily in the zone working away when suddenly I got an alert that it was about to shutdown,
 so I should plug it in.

Luckily I didn't lose anything. Now when working in a place where there are many people working (shared workspace)
 I run this Python script in the back ground. 
It polls every 5 seconds to check the power in the laptop, if it disconnects it will show on the 
screen that the power has been disconnected, but the best thing is it beeps.

You can see below the output from the script, so you can see how it works if you reconnect the power
 when it goes out, so now if my machine starts beeping I can check the power so I don't get caught again.
'''

import os
import win32con
import sys
import time
from ctypes import *

class PowerClass(Structure):
    _fields_ = [('ACLineStatus', c_byte),
            ('BatteryFlag', c_byte),
            ('BatteryLifePercent', c_byte),
            ('Reserved1',c_byte),
            ('BatteryLifeTime',c_ulong),
            ('BatteryFullLifeTime',c_ulong)]


powerclass = PowerClass()

while True:
    result = windll.kernel32.GetSystemPowerStatus( byref(powerclass) )

    try:
        state = int(powerclass.ACLineStatus)
    except:
        state = 0 

    if state == 1:
        print 'Power is on...'
    else:
        print 'Power is off...\a'  #\a = bell sounds beep on computer
    
    print 'Sleeping for 5 seconds...'
    time.sleep(5)