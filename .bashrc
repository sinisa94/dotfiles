#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
## aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias more='less'
alias less='less -R'
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
alias ls='ls -hF --group-directories-first --color=auto --time-style=iso'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias cp='cp -iv'
alias cpp='rsync -aP'
alias mv='mv -iv'
alias rm='rm -vI'                    # 'rm -i' prompts for every file
alias cal='cal -m'
cmd_exists() { command -v "$1" > /dev/null 2>&1 || { echo "missing $1"; return 1; }; }
if cmd_exists fzf; then
    alias pacs='pacman --color always -Sl | sed -e "s: :/:; /installed/d" | cut -f 1 -d " " | fzf --multi --ansi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S'
    if cmd_exists pikaur; then
	alias pars='pikaur --color always -Sl | sed -E "s: :/:; s/ (\x1b\[[0-9;]*m)?unknown-version/\1/" | fzf --multi --ansi --preview "pikaur -Si {1} " | xargs -ro pikaur -S'
    fi
    if cmd_exists yay; then
    alias yayz='yay --color always -Sl | sed -e "s: :/:; s/ 0$//;" | fzf --multi --ansi --preview "yay -Si {1}" | xargs -ro yay -S'
    fi
alias pacr="pacman --color always -Q | cut -f 1 -d ' ' | fzf --multi --ansi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
fi
alias update='sudo pacman -Sy --needed archlinux-keyring && sudo pacman -Su'
alias storage='cd /run/media/sinisa94/storage/'
alias brave='brave --password-store=gnome'
alias debian='ssh sinisa94@debian'
alias alienware='ssh sinisa94@alienware-pc'
alias teams='exec /opt/teams-for-linux/teams-for-linux'
alias grayjay='/opt/grayjay/Grayjay'
# Expand the history size
export HISTSIZE=500
export HISTFILESIZE=10000
export HISTTIMEFORMAT="[%F %T] "        # add timestamp to history
export HISTCONTROL=erasedups:ignoredups:ignorespace
export PROMPT_COMMAND='history -a'
export PROMPT_DIRTRIM=2
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export CDPATH="."
shopt -s checkwinsize
shopt -s histappend
shopt -s autocd 2>/dev/null
shopt -s cdspell 2>/dev/null
shopt -s extglob
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
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:ow=00;92:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
export OTHER_WRITABLE='34;46'
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
export VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.json
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
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
			*.tar.bz2) cmd_exists tar && tar xvjf $archive ;;
			*.tar.gz) cmd_exists tar && tar xvzf $archive ;;
			*.bz2) cmd_exists bunzip2 && bunzip2 $archive ;;
			*.rar) cmd_exists unrar && unrar x $archive ;;
			*.gz)  cmd_exists gunzip && gunzip $archive ;;
			*.tar) cmd_exists tar && tar xvf $archive ;;
			*.tbz2) cmd_exists tar && tar xvjf $archive ;;
			*.tgz) cmd_exists tar && tar xvzf $archive ;;
			*.zip) cmd_exists unzip && unzip $archive ;;
			*.Z) cmd_exists uncompress && uncompress $archive ;;
			*.7z) cmd_exists 7z && 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}
function mktar() { cmd_exists tar && tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function mkzip() { cmd_exists zip && zip -r "${1%%/}.zip" "$1"; }
function mk7z()  { cmd_exists 7z && 7z a -r "${1%%/}.7z" "$1"; }
note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi
    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "[%(%Y-%m-%d %H:%M:%S)T] %s\n" -1 "$*" >> "$HOME/.notes"
    fi
}

# telnet mapscii.me <--- ascii world map

