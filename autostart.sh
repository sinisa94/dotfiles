#!/bin/bash

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec nm-applet &
exec pasystray &
exec firewalld &
exec firewall-applet &
exec slstatus &
exec firefox &
exec solaar -w hide &
exec ~/monitors.sh
exec ~/hhkb-i3.sh
