#! /bin/bash
sudo cp ~/.xinitrc ~/dotfiles/xinitrc
sudo cp ~/.xinputrc ~/dotfiles/xinputrc
sudo cp ~/.Xresources ~/dotfiles/.Xresources
sudo cp ~/.config/i3/config ~/dotfiles/config
sudo cp /etc/i3status.conf ~/dotfiles/i3status.conf
sudo cp ~/.emacs.d/init.el ~/dotfiles/init.el
sudo cp ~/hhkb-i3.sh ~/dotfiles/hhkb-i3.sh
sudo cp ~/monitors.sh ~/dotfiles/monitors.sh 
echo "Exported configs to -> ~/dotfiles/"
