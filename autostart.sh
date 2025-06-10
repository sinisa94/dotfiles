#!/bin/bash

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec nm-applet &
# sound tray app
exec pasystray &
# firewall tray not working :S
exec firewalld &
#exec sudo firewall-applet &
#status bar
exec slstatus &
#browser
exec brave &
#grayjay
exec grayjay &
# mouse settings tray
exec solaar -w hide &
# xrandr configs 
exec ~/monitors.sh &
# keyboard
exec ~/hhkb-i3.sh &
# bkground
exec feh --bg-scale ~/dotfiles/wall.jpg &
# arduino fix
exec wmname LG3D &
# transition effects
exec picom --animations -b &
# trying to find which key is not used so i can rebind it to caps
#exec xmodmap -e 'keycode 66 = F13'
