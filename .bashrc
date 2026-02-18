#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
## aliases
alias grep='grep --color=auto'
alias more='less'
alias df='df -kTh'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias bc="bc -ql"                   # calc: echo "expressions" | bc
alias ls='ls -hF --group-directories-first --color=auto'
alias lr='ls -R  --color=auto'                    # recursive ls
alias ll='ls -l  --color=auto'
alias la='ll -A  --color=auto'
alias lx='ll -BX  --color=auto'                   # sort by extension
alias lz='ll -rS  --color=auto'                   # sort by size
alias lt='ll -rt  --color=auto'                   # sort by date
alias lm='la | more'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'                    # 'rm -i' prompts for every file
alias cal='cal -m'
alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
alias pars='paru --color always -Sl | sed -e "s: :/:; s/ unknown-version//; /installed/d" | fzf --multi --ansi --preview "paru -Si {1}" | xargs -ro paru -S'
alias pacr="pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias update='sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su'
alias storage='cd /run/media/sinisa94/storage/'
alias brave='brave --password-store=gnome'
alias debian='ssh sinisa94@debian'
alias alienware='ssh sinisa94@alienware-pc'
alias teams='exec /opt/teams-for-linux/teams-for-linux'
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T"        # add timestamp to history
# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace
# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize
# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
shopt -s autocd
PROMPT_COMMAND='history -a'
# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR=/run/user/$(id -u)
PS1='[\[\033[01;32m\]\u\[\033[00m\]@\h \[\e[1;31m\W\[\e[0m\]]\$ '
# colors
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
export LESS_TERMCAP_mb=$'\E[01;31m'      #red
export LESS_TERMCAP_md=$'\E[01;31m'      #red
export LESS_TERMCAP_me=$'\E[0m'          #reset
export LESS_TERMCAP_so=$'\E[01;44;33m'   #yellow
export LESS_TERMCAP_se=$'\E[0m'          #reset
export LESS_TERMCAP_us=$'\E[01;32m'      #green
export LESS_TERMCAP_ue=$'\E[0m'          #reset
export LESS_TERMCAP_mr=$'\e[1;31m'       # reverse: bright red
export LESS_TERMCAP_mh=$'\e[2m'          # dim: faint text
export VISUAL=nano
export EDITOR="$VISUAL"
export TERMINAL=st
export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
# Enable bash programmable completion features in interactive shells, dep: bash-completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi
#dep: pkgfile
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}
function mktar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function mkzip() { zip -r "${1%%/}.zip" "$1" ; }
function mk7z()  { 7z a -r "${1%%/}.7z" "$1" ; }
