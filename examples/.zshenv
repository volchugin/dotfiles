#!/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='rxvt-256color'

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# other software
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export COMPOSER_HOME="$XDG_CONFIG_HOME/composer"
export I3_CONFIG="$XDG_CONFIG_HOME/i3"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
export GIMP_VERSION="2.10"
export SCREENSHOT="$HOME/Documents/images/screenshots"

# fzf
#export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS="-m"
FZF_DEFAULT_OPTS+=" --color='light'"
FZF_DEFAULT_OPTS+=" --height 40%"
FZF_DEFAULT_OPTS+=" --layout=reverse"
#FZF_DEFAULT_OPTS+=" --bind 'ctrl-u:preview-up,ctrl-d:preview-down,ctrl-o:toggle+up,ctrl-i:toggle+down,ctrl-space:toggle-preview'"
FZF_DEFAULT_OPTS+=" --inline-info"
FZF_DEFAULT_OPTS+=" --preview 'cat {}'"
FZF_DEFAULT_OPTS+=" --preview-window=right:60%:wrap"

# X11
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# Racket
export PLTUSERHOME="$XDG_DATA_HOME"/racket

# golang
export GOPATH="$HOME/workspace/go"
export GOBIN="$HOME/workspace/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NPM_CONFIG_PREFIX="$XDG_CONFIG_HOME/node_modules"

# git
export GIT_REVIEW_BASE=master # See gitconfig

# PATH
export PATH="$COMPOSER_HOME/vendor/bin:$PATH"                       # COMPOSER
export PATH="$GOBIN:$PATH"                                          # GOBIN
export PATH="$NPM_BIN:$PATH"                                        # NPM

# Cloud
#source $CLOUD/development/env
