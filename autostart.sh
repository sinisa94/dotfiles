#!/bin/bash

# xrandr configs 
exec ~/monitors.sh &
# keyboard
exec ~/hhkb-i3.sh &
#status bar
exec slstatus &
# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec nm-applet &
# sound tray app
exec pasystray &
# firewall tray not working :S
exec firewalld &
# mouse settings tray
exec solaar -w hide &
# arduino fix
exec wmname LG3D &
# bkground
exec feh --bg-fill ~/dotfiles/dark.jpg &
#browser
exec gnome-keyring-daemon &
exec brave &
#grayjay
exec grayjay &
exec nextcloud --background &
#exec picom --animations -b &
# trying to find which key is not used so i can rebind it to caps
#exec xmodmap -e 'keycode 66 = F13'
#steam
exec steam
