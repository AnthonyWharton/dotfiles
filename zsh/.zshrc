# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh

# Oh My ZSH config load
source $ZSH/oh-my-zsh.sh

# Powerline
source /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(cp extract git pip sudo systemd wd)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor
export EDITOR='vim'

# Stop zsh from sharing history
setopt no_share_history

# Disable ZSH's time command and use the standard time command
disable -r time

# Custom end of line marker (if no new line at end of output it will write \n and add one)
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=" %{$bg[red]%}%{$fg[white]%}\n%{$reset_color%}"

# Start up the ssh-agent
SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent > ~/.ssh-agent.pid
# fi
# if [[ "$SSH_AGENT_PID" == "" ]]; then
#     eval "$(<~/.ssh-agent.pid)" > /dev/null
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

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

alias time='time -p ' # -p for POSIX output

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias quit='exit'
alias ei='vim ~/.config/i3/config'
alias ez='vim ~/.zshrc'
alias rz='source ~/.zshrc'

alias got='git'
alias gs='git status'
alias ga='git add .'
alias gl='git log'
alias push='git push origin'
alias pull='git pull'
alias fetch='git fetch'
alias gitfuck='git reset --soft HEAD~'
alias gitFUCK='git reset --hard HEAD~'

alias tm='~/Documents/Misc/Scripts/tmux-session.sh'

alias work='cd ~/Documents/University-Work/Year-4'
alias uh='cd ~/Documents/Projects/UltraHorizon/UH-Net-Android'

alias make='make -j4'

alias starwars='telnet towel.blinkenlights.nl'

alias dc='sudo killall openvpn'
alias rc='sudo openvpn --config /etc/openvpn/UltraHorizon.ovpn --log /var/log/openvpn.log &'

# Goodbye XPD 13 9350 (QHD) wherever you may be...

# To Do: Someday turn this into a nice wrapper function
alias monitor-reset='xrandr --output eDP1 --auto --output DP1 --off; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
alias monitor-1080p-above='xrandr --output eDP1 --mode 1920x1080 --pos 0x1080 --output DP1 --mode 1920x1080 --pos 0x0; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
# alias monitor-1080p-above2='xrandr --fb 3200x2880 --output eDP-1 --mode 3200x1800 --pos 0x1080 --output DP-1 --mode 1920x1080 --scale 1x1 --pos 640x0; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
# alias monitor-1080p-right='xrandr --fb 6080x1800 --output eDP-1 --mode 3200x1800 --pos 0x0 --output DP-1 --mode 1920x1080 --pos 3200x90 --scale-from 2880x1620; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
# alias monitor-1080p-right2='xrandr --fb 5120x1800 --output eDP-1 --mode 3200x1800 --pos 0x0 --output DP-1 --mode 1920x1080 --pos 3200x640 --scale 1x1; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
# alias monitor-1080p-left='xrandr --fb 6080x1800 --output eDP-1 --mode 3200x1800 --pos 2880x0 --output DP-1 --mode 1920x1080 --pos 0x90 --scale-from 2880x1620; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'
# alias monitor-1080p-left2='xrandr --fb 5120x1800 --output eDP-1 --mode 3200x1800 --pos 1920x0 --output DP-1 --mode 1920x1080 --pos 0x640 --scale 1x1; feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg'

#####

# Overloading sudo
function sudo() {
    case $1 in
        su) command sudo -E -H -s zsh ;;
        * ) command sudo $@ ;;
    esac
}

#####

# Overloading SSH with custom endpoint to bluecrystal
function ssh() {
    case $1 in
        bluecrystalp3 ) ssh snowy -t "ssh bluecrystalp3" ;;
        bluecrystalp4 ) ssh snowy -t "ssh bluecrystalp4" ;;
        * ) command ssh $@ ;;
    esac
}

#####

# Some EXPORT variables
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:~/Documents/University-Work/Year-3/Intro-To-HPC/bcsubmit/
export QT_QPA_PLATFORMTHEME=gtk2

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

