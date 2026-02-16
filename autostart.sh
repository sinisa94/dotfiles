#!/bin/bash

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec firewalld &
exec slstatus &
exec gnome-keyring-daemon &
exec brave &
exec ~/hhkb-i3.sh &
exec feh --bg-center ~/dotfiles/wall.jpg &
