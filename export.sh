#! /bin/bash
sudo cp ~/.config/i3/config ~/dotfiles
sudo cp ~/.Xresources ~/dotfiles/.Xresources
sudo cp ~/.emacs.d/init.el ~/dotfiles/init.el
sudo cp /etc/i3status.conf ~/dotfiles/i3status.conf
echo "Exported configs to -> ~/dotfiles/"
