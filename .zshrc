# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/dylan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

#ZSH_THEME="robbyrussell"
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
#DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages screen colorize command-not-found extract)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

docker() {
  case $1 in
    ps)
      shift
      command docker ps --format '\nNAMES\t{{.Names}}\nIMAGE\t{{.Image}}\nID\t{{.ID}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}' "$@"
      ;;
    psn)
      shift
      command docker ps --format '\n{{.ID}}: {{.Status}}\t{{.Names}}' "$@"
      ;;
    *)
      command docker "$@";;
  esac
}

tmux-new() {
  if [[ -n $TMUX ]]; then
    tmux switch-client -t "$(TMUX= tmux -S "${TMUX%,*,*}" new-session -dP "$@")"
  else
    tmux new-session "$@"
  fi
}

export WORKON_HOME=$HOME/.environments
source /usr/local/bin/virtualenvwrapper.sh

DEFAULT_USER="dylan"
if [ "$TMUX" = "" ]; then tmux; fi

#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias fixmouse='sudo rmmod usbhid && sudo modprobe usbhid'
alias ..='cd ..'
alias ...='cd ../..'
alias update='sudo apt-get update && sudo apt-get upgrade --yes'
alias install='sudo apt-get install'
alias c='clear'
alias cat='clear && cat' 
alias ls='clear; ls -l --color=auto'
alias lsa='clear; ls -al --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias fh='history | grep'
alias rm='rm -rf'
alias ..='cd .. ; clear'
alias ...='cd ../.. ; clear'
alias update='sudo apt-get update && sudo apt-get upgrade --yes'
alias install='sudo apt-get install'
alias tomvne='cd ~/Documents/vikingco/repo/mvne-platform && clear'
alias tovtf='cd ~/Documents/vikingco/repo/vtf && clear'
alias home='cd ~ && clear'
alias fb='fb-messenger-cli'
alias s='clear && git status -s'
alias glog='clear; git log --oneline --decorate=full -n220 '
alias gsquash='git rebase --interactive --autosquash master; clear'
alias grebase='git checkout master; git pull ; git checkout -; git rebase --interactive master; clear'
alias gamend='git add --all; git commit --amend --no-edit; git push origin +HEAD; clear'
alias gitHasReq='git diff master..$(git rev-parse --abbrev-ref HEAD) requirements/'
alias tomaster='clear; git checkout master'
alias rmdockerimg='docker rmi $(docker images -a | grep "^<none>" | awk "{print $3}"); clear'
alias dockerCleanMvne='docker rm -f -v $(docker ps -a -q -f name=mvne_run -f status=exited) && docker rmi -f $(docker images -q -f dangling=true) && docker volume rm $(docker volume ls -qf dangling=true)'
alias dockerredis_clear_cache='docker exec -it mvne_redis redis-cli FLUSHALL'
