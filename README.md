# Dependancies:
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
# Config paths
- i3 conf 		    path: ~/.config/i3/conf
- i3-status conf    path: /etc/i3status.conf
- urxvt conf 		path: ~/.Xresources
- nano config 		path: /etc/nanorc && include "/usr/share/nano-syntax-highlighting/*.nanorc"
- emacs conf        path: ~/.emacs.d/init.el
- monitors          path: ~/monitors.sh
- hhkb              path: ~/hhkb-i3.sh
- inputrc           path: ~/.xinputrc 
- autostart         path: ~/.dwm/autostart.sh
# Misc
- st in ./st
- dwm in ./dwm
- dwmblocks in ./dwmblocks
- Icon theme: Numix-Minimal-Mistakes
- Theme Adawaita-dark
- "patch --merge -i ./patches/st-xxx.diff" <- patching suckless
- suckless : sudo make install
- del key&nano binds fix for st  .inputrc instead of "tput smkx"
- oomd for arch in oomd-systemdconfig.png

