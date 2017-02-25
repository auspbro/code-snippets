#!/bin/sh

#backlight off
isaset -y -f 0x286 0xfb

#eDP1 off
xrandr -d :0.0 --output eDP1 --off

#reset DSI bridge
isaset -y -f 0x287 0x20
#isaset -y -f 0x287 0x00
