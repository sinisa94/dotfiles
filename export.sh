#! /bin/bash
sudo cp ~/.config/i3/config ~/dotfiles/config
sudo cp ~/.Xresources ~/dotfiles/.Xresources
sudo cp ~/.emacs.d/init.el ~/dotfiles/init.el
sudo cp /etc/i3status.conf ~/dotfiles/i3status.conf
sudo cp ~/.xinitrc ~/dotfiles/xinitrc
sudo cp ~/.xinputrc ~/dotfiles/xinputrc
echo "Exported configs to -> ~/dotfiles/"
