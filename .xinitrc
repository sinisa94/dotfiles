#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
xsetroot -solid "#1e1e1e" &
DISPLAY=:0 dbus-launch dwm
