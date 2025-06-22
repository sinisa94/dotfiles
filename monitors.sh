#!/bin/bash

#xrandr --output DisplayPort-0 --primary --gamma 0.62:0.63:0.58 --output DVI-D-0 --left-of DisplayPort-0 --gamma 0.8 --output HDMI-A-0 --right-of DisplayPort-0 --gamma 0.86
xrandr --output DisplayPort-0 --primary --mode 1680x1050 --pos 1050x630 --rotate normal --gamma 0.8 --output HDMI-A-0 --mode 1920x1080 --pos 2730x600 --rotate normal --gamma 0.62:0.63:0.58 --output DVI-D-0 --mode 1680x1050 --pos 0x0 --rotate right --gamma 0.86

