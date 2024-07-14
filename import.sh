#! /bin/bash
sudo cp ~/dotfiles/xinitrc ~/.xinitrc 
sudo cp ~/dotfiles/.inputrc ~/.inputrc
sudo cp ~/dotfiles/.Xresources ~/.Xresources 
sudo cp ~/dotfiles/config ~/.config/i3/config 
sudo cp ~/dotfiles/i3status.conf /etc/i3status.conf 
sudo cp ~/dotfiles/init.el ~/.emacs.d/init.el 
sudo cp ~/dotfiles/hhkb-i3.sh ~/hhkb-i3.sh
sudo cp ~/dotfiles/monitors.sh ~/monitors.sh 
sudo chmod +x ~/hhkb-i3.sh 
echo "Imported configs from -> ~/dotfiles/"
