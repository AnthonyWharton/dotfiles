#!/usr/bin/env bash

###############################################################################
### BASH IT THINGS

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="$HOME/.bashit"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-custom'

# Theme settings
# TODO: Fork theme and make own version, as I don't quite have the control I
#       want to implement some changes from just config.
POWERLINE_LEFT_PROMPT="user_info python_venv cwd"
POWERLINE_RIGHT_PROMPT="in_vim scm battery clock"

PROMPT_CHAR=${POWERLINE_PROMPT_CHAR:="$"}
THEME_CLOCK_FORMAT="%H:%M:%S %d-%m-%Y"

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
# unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the
# prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Load Bash It
source "$BASH_IT/bash_it.sh"

###############################################################################
### BASH SETUP

shopt -s autocd
shopt -s cdspell
shopt -s direxpand dirspell
shopt -s globstar
shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize

# Extend History
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
export HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
alias didido='history | grep'

###############################################################################
### CUSTOM ALIASES

alias ll='ls -lah'
alias lo='ls -oh'
alias lh='ls -lh'
alias sl='ls'
alias l='ls'
alias s='ls'

alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias df='df -h'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias quit='exit'
alias ei='vim ~/.config/i3/config'
alias eb='vim ~/.bashrc'
alias rb='source ~/.bashrc'

alias got='git'
alias gs='git status'

alias tm='~/Documents/Misc/Scripts/tmux-session.sh'

alias work='cd ~/Documents/University-Work/Year-4/Project'
alias uh='cd ~/Documents/Projects/UltraHorizon/UH-Net-Android'

# alias make='make -j4'

alias starwars='telnet towel.blinkenlights.nl'

alias dc='sudo killall openvpn'
alias rc='sudo openvpn --config /etc/openvpn/UltraHorizon.ovpn --log /var/log/openvpn.log &'

# To Do: Someday turn this into a nice wrapper function/utility
alias monitor-reset='xrandr --output eDP1 --auto --output DP1 --off; ~/.config/scripts/set-background.sh'
alias monitor-1080p-above='xrandr --output eDP1 --mode 1920x1080 --pos 0x1080 --output DP1 --mode 1920x1080 --pos 0x0; ~/.config/scripts/set-background.sh'

###############################################################################
### SYSTEM MISC

# PATH additions
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/texmf/
export PATH="$PATH:/home/anthony/Documents/University-Work/Year-3/Intro-To-HPC/bcsubmit"
export PATH="$PATH:/home/anthony/Documents/University-Work/Year-4/Project/souper/build"

# nanoBench PATH (temp)
export NANOBENCH_HOME="/home/anthony/Documents/University-Work/Year-4/Project/nanoBench"
export NANOBENCH_CFG="$NANOBENCH_HOME/configs/cfg_Skylake_common.txt"
export PATH="$PATH:$NANOBENCH_HOME"

# Connect to SSH Agent
SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor
export EDITOR='vim'

# Some EXPORT variables
export QT_QPA_PLATFORMTHEME=gtk2
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Colour man pages nicely.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

###############################################################################
### CUSTOM FUNCTIONS

# Overload sudo such that `sudo suu` will start a shell with the same home
# directory and environment variables as the current shell.
function sudo() {
	if [[ $# == 1 && "$1" == "suu" ]]; then
		command sudo -Es /bin/bash
	else
		command sudo $@
	fi
}

# Go up n directories. Usage: user:~$ up n
up() {
	local d=""
	limit=$1
	for ((i=1 ; i <= limit ; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

