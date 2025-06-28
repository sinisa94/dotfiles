#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias storage='cd /run/media/sinisa94/storage/'
PS1='[\u@\h \W]\$ '
export VISUAL=nano
export TERMINAL=st
export PATH=$PATH:/opt/texbin/
export EDITOR="$VISUAL"
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export TESSDATA_PREFIX=/usr/share/tessdata
export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/sinisa94/.local/share/flatpak/exports/share
export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
debian(){
    ssh sinisa94@debian
        }
alienware(){
   ssh sinisa94@alienware-pc
}
