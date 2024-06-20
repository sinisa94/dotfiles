#!/bin/bash

xrandr --output DisplayPort-0 --primary --gamma 0.5 --output DVI-D-0 --left-of DisplayPort-0 --gamma 0.8 --output HDMI-A-0 --right-of DisplayPort-0 --gamma 0.8

setxkbmap -layout us,rs -option grp:shifts_toggle,grp_led:scroll
