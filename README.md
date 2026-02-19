#**Don't expect this to be used as instructions, it's only for my reference.**
---
## Dependancies:
old:
- i3
- i3-status
- i3lock
- urxvt
- vt-wheel
current:
- font: "ttc-iosvevka"
- emacs
- global
- nano
- nano-syntax-highlighting 
- xscreensaver
- lxappearance
- feh
- sensors
- wmname
- scrot
- mpv
- cmus
- pkgfile
- bash-completions
---
## Config paths
| app       | config path         | comment                                                 |
|-----------|---------------------|---------------------------------------------------------|
| i3        | ~/.config/i3/conf   |                                                         |
| i3-status | /etc/i3status.conf  |                                                         |
| urxvt     | ~/.Xresources       |                                                         |
|-------------------------------------------------------------------------------------------|
| nano      | /etc/nanorc         | include  "/usr/share/nano-syntax-highlighting/*.nanorc" |
| emacs     | ~/.emacs.d/init.el  |                                                         |
| monitors  | ~/monitors.sh       |                                                         |
| hhkb      | ~/hhkb-i3.sh        |                                                         |
| inputrc   | ~/.xinputrc         |                                                         |
| autostart | ~/.dwm/autostart.sh |                                                         |
| bashrc    | ~/.bashrc           |                                                         |
| feh       | ~/.fehbg            | wall.jpg required                                       |

## Misc
- Icon theme: Numix-Minimal-Mistakes
- Theme Adawaita-dark
- "patch --merge -i ./patches/st-xxx.diff" <- patching suckless
- suckless : make clean && sudo make install
- oomd for arch in oomd-systemdconfig.png

no display manager fix for brave
https://wiki.archlinux.org/title/GNOME/Keyring

Note: since ~ 20.10.2025 .dwm/autostart.sh has issues with systray or any other apps beside nextcloud so ~/systrayfix.sh is made to be run from terminal
