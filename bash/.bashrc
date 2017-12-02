

#
#   Note that I have moved to ZSH so this is pretty untouched these days.
#   A lot of the shell goodies in here are in .zshrc and should be compatible
#   here as well, so you may want to look there.
#


################################################################################
### .bashrc                                                                  ###
###   A concoction of .bashrc goodies, mostly from the internet but          ###
###   but some written myself.                                               ###
################################################################################
### Custom Alias'                                                            ###
################################################################################

alias ll='ls -lah'
alias la='ls -lah'
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

alias gs='git status'
alias ga='git add .'
alias gl='git branch -a'
alias push='git push origin'
alias pull='git pull'
alias gitfuck='git reset --soft HEAD~'
alias gitFUCK='git reset --hard HEAD~'

alias tm='~/Documents/Misc/Scripts/tmux-session.sh'

alias work='cd ~/Documents/University-Work/Year-2/'
alias cnc='cd ~/Documents/University-Work/Year-2/Concurrent-Computing/'
alias lan='cd ~/Documents/University-Work/Year-2/Language-Engineering/'
alias spe='cd ~/Documents/University-Work/Year-2/Software-Product-Engineering/'

alias ark='ssh -X -i ~/Documents/Misc/SSH/privateArk -p 9669 anthony@ark.itgr.uk'
alias arks='sftp -i ~/Documents/Misc/SSH/privateArk -P 9669 anthony@ark.itgr.uk'
alias ryn='ssh -X -i ~/Documents/Misc/SSH/privateDroplets -l ant -p 9669 ant@ryn.itgr.uk'
alias ryns='sftp -i ~/Documents/Misc/SSH/privateDroplets -P 9669 ant@ryn.itgr.uk'

alias starwars='telnet towel.blinkenlights.nl'

alias dc='sudo killall openvpn'
alias rc='sudo openvpn --config /etc/openvpn/UltraHorizon-EC-Auth.conf --writepid /run/openvpn/openvpn.pid --log /var/log/openvpn.log &'

export QT_QPA_PLATFORMTHEME=gtk2

################################################################################
### From Ubuntu's .bashrc (Edited)                                           ###
################################################################################

# Check the window size after each command and, if necessary, Update the values 
# of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# The Command Line Prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]${PWD}\[\033[00m\]\n\$ '
export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

function __prompt_command() {
  local EXIT="$?"             # This needs to be first
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]' 

  if [ $EXIT != 0 ]; then
    PS1+='\[\033[01;41m\] $? \[\033[00m\]'      # Add red if exit code non 0
  fi

  PS1+='\n\$ ' 
}

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

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

################################################################################
### From various sources                                                     ###
################################################################################

# A few path variables
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/texmf/

# Go up n directories. Usage: user:~$ up n
up() {
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}

#####

# Colour man pages nicely.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#####

# Remove everything Except
rmex() {
  ls -al | grep -v $1 | xargs "rm -rv"
}

# Neat way to extract archives.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

#####

# Extend History
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"
alias didido='history | grep'

#####

# START tmux completion
# This file is in the public domain
# See: http://www.debian-administration.org/articles/317 for how to write more.
# Usage: Put "source bash_completion_tmux.sh" into your .bashrc
_tmux() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts=" \
    attach-session \
    bind-key \
    break-pane \
    capture-pane \
    choose-client \
    choose-session \
    choose-window \
    clear-history \
    clock-mode \
    command-prompt \
    confirm-before \
    copy-buffer \
    copy-mode \
    delete-buffer \
    detach-client \
    display-message \
    display-panes \
    down-pane \
    find-window \
    has-session \
    if-shell \
    join-pane \
    kill-pane \
    kill-server \
    kill-session \
    kill-window \
    last-window \
    link-window \
    list-buffers \
    list-clients \
    list-commands \
    list-keys \
    list-panes \
    list-sessions \
    list-windows \
    load-buffer \
    lock-client \
    lock-server \
    lock-session \
    move-window \
    new-session \
    new-window \
    next-layout \
    next-window \
    paste-buffer \
    pipe-pane \
    previous-layout \
    previous-window \
    refresh-client \
    rename-session \
    rename-window \
    resize-pane \
    respawn-window \
    rotate-window \
    run-shell \
    save-buffer \
    select-layout \
    select-pane \
    select-prompt \
    select-window \
    send-keys \
    send-prefix \
    server-info \
    set-buffer \
    set-environment \
    set-option \
    set-window-option \
    show-buffer \
    show-environment \
    show-messages \
    show-options \
    show-window-options \
    source-file \
    split-window \
    start-server \
    suspend-client \
    swap-pane \
    swap-window \
    switch-client \
    unbind-key \
    unlink-window \
    up-pane"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0

}
complete -F _tmux tmux

# END tmux completion


# added by Anaconda3 4.3.0 installer
export PATH="/opt/anaconda3/bin:$PATH"
