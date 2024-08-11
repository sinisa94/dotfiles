#**Don't expect this to be used as instructions, it's only for my reference.**
---
## Dependancies:
- i3
- i3-status
- i3lock
- urxvt
- font: "Iosvevka"
- nano
- nano-syntax-highlighting 
- emacs
- vt-wheel
- extra/archlinux-wallpaper
- xscreensaver
- lxappearance
- feh
- sensors
- wmname
- picom
---
## Config paths
| config    | path                | comment                                                 |
|-----------|---------------------|---------------------------------------------------------|
| i3        | ~/.config/i3/conf   |                                                         |
| i3-status | /etc/i3status.conf  |                                                         |
| urxvt     | ~/.Xresources       |                                                         |
| nano      | /etc/nanorc         | include  "/usr/share/nano-syntax-highlighting/*.nanorc" |
| emacs     | ~/.emacs.d/init.el  |                                                         |
| monitors  | ~/monitors.sh       |                                                         |
| hhkb      | ~/hhkb-i3.sh        |                                                         |
| inputrc   | ~/.xinputrc         |                                                         |
| autostart | ~/.dwm/autostart.sh |                                                         |
| bashrc    | ~/.bashrc           |                                                         |

---
## Misc
- Icon theme: Numix-Minimal-Mistakes
- Theme Adawaita-dark
- "patch --merge -i ./patches/st-xxx.diff" <- patching suckless
- suckless : make clean && sudo make install
- del key&nano binds fix for st  .inputrc instead of "tput smkx"
- oomd for arch in oomd-systemdconfig.png
