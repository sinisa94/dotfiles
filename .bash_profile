#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
#[ -f /home/sinisa94/.dart-cli-completion/bash-config.bash ] && . /home/sinisa94/.dart-cli-completion/bash-config.bash || true
## [/Completion]
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
