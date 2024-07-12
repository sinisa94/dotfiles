# Dependancies:
- i3
- i3-status
- urxvt
- font: "Iosvevka"
- nano
- nano-syntax-highlighting 
- emacs
- vt-wheel

#Config paths
- i3 conf 		    path: ~/.config/i3/conf
- i3-status conf    path: /etc/i3status.conf
- urxvt conf 		path: ~/.Xresources
- nano config 		path: /etc/nanorc && include "/usr/share/nano-syntax-highlighting/*.nanorc"
- emacs conf        path: ~/.emacs.d/init.el
- monitors          path: ~/monitors.sh
- hhkb              path: ~/hhkb-i3.sh
- st                ./st
#Misc
- Icon theme: Numix-Minimal-Mistakes
- Theme Adawaita-dark
- "patch --merge -i ./patches/st-xxx.diff" <- patching st
- del key&nano binds fix for st "echo "set enable-keypad on" >> .inputrc"
- oomd for arch in .png
