#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'
PS1='[\u@\h \W]\$ '
export VISUAL=nano
export TERMINAL=st
export EDITOR="$VISUAL"
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export VDPAU_DRIVER=/usr/lib/vdpau/libvdpau_va_gl.so
debian(){
    ssh sinisa94@debian
}
sinisa94(){
    ssh sinisa94@sinisa94-pc
}

