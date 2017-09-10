# If you come from bash you might have to change your $PATH.
 export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/home/anthony/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git powerline cabal last-working-dir lol pip sudo systemd web-search wd)

source $ZSH/oh-my-zsh.sh
. /usr/local/lib/python3.5/dist-packages/powerline/bindings/zsh/powerline.zsh

# User configuration

 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Stop zsh from sharing history
setopt no_share_history

# Custom end of line marker (if no new line at end of output it will write \n and add one)
setopt PROMPT_CR
setopt PROMPT_SP
export PROMPT_EOL_MARK=" %{$bg[red]%}%{$fg[white]%}\n%{$reset_color%}"

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

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias quit='exit'
alias ei='vim ~/.config/i3/config'
alias ez='vim ~/.zshrc'
alias rz='source ~/.zshrc'

alias gs='git status'
alias ga='git add .'
alias gl='git branch -a'
alias push='git push origin'
alias pull='git pull'
alias fetch='git fetch'
alias gitfuck='git reset --soft HEAD~'
alias gitFUCK='git reset --hard HEAD~'

alias tm='~/Documents/Misc/Scripts/tmux-session.sh'

alias work='cd ~/Documents/University-Work/Year-2/'
alias concurrent='cd ~/Documents/University-Work/Year-2/Concurrent-Computing/Term2'
alias langeng='cd ~/Documents/University-Work/Year-2/Language-Engineering/Term2'
alias spe='cd ~/Documents/University-Work/Year-2/Software-Product-Engineering/'
alias sps='cd ~/Documents/University-Work/Year-2/Signals-Patterns-Symbols/'
alias coconut='cd ~/Documents/University-Work/Year-2/Complexity-Coding-Number-Theory' 

alias ark='ssh -X -i ~/Documents/Misc/SSH/privateArk -p 9669 anthony@ark.itgr.uk'
alias arks='sftp -i ~/Documents/Misc/SSH/privateArk -P 9669 anthony@ark.itgr.uk'
alias ryn='ssh -X -i ~/Documents/Misc/SSH/privateDroplets -l ant -p 9669 ant@ryn.itgr.uk'
alias ryns='sftp -i ~/Documents/Misc/SSH/privateDroplets -P 9669 ant@ryn.itgr.uk'

alias starwars='telnet towel.blinkenlights.nl'

alias dc='sudo killall openvpn'
alias rc='sudo openvpn --config ~/.openvpn/UltraHorizon.ovpn --log /var/log/openvpn.log &'

alias monitor-fix='xrandr --output eDP-1 --auto --output DP-1 --off'
alias monitor-1080p-above='xrandr --fb 3200x3420 --output eDP-1 --mode 3200x1800 --pos 0x1620 --scale 1x1 --output DP-1 --mode 1920x1080 --pos 160x0 --scale-from 2880x1620'

#####

# Some EXPORT variables
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/texmf/
export PATH="/opt/anaconda3/bin:$PATH"

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

# Neat way to extract archives.
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar xvf $1    ;;
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

cd
