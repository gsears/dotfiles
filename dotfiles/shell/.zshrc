#!/bin/bash

###########################################################################
#                             Load .dotfiles
###########################################################################
DOTFILES_REPO="$(dirname "$(readlink "${HOME}/.dotfiles/.dotfiles-config")")"
source ${DOTFILES_REPO}/config.sh
reload_dot_files
###########################################################################

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# This line is mandatory to prevent agnoster theme to set prompt as <username@machine-name>
DEFAULT_USER="$(whoami)"
ZSH_THEME="amuse"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  brew
  asdf
  yarn
  npm
  node
  vscode
  zsh-vi-mode
  terraform
  fzf
)

# zsh-syntax-highlighting
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
# ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red') # To have commands starting with `rm -rf` in red:

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh
source ${ZSH}/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Used for anchor auto completion - load /usr/local/share/zsh/site-functions/_anchor
autoload -U compinit && compinit

[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

# asdf
. $HOME/.asdf/asdf.sh

# check asdf shims first before brew
alias brew='env PATH="${PATH//.asdf/shims:/}" brew'

# java
. ~/.asdf/plugins/java/set-java-home.zsh

# android

ANDROID_HOME="${HOME}/Library/Android/sdk"
# bun completions
[ -s "/Users/gareth/.bun/_bun" ] && source "/Users/gareth/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/gareth/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

