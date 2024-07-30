#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export VISUAL=nano
export TERMINAL=st
export PATH=$PATH:/opt/texbin/
export EDITOR="$VISUAL"
export XDG_RUNTIME_DIR=/tmp/runtime-user
