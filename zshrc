# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx autojump brew rvm)

# Ignore case in autojump
export AUTOJUMP_IGNORE_CASE=1

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# node.js
export PATH=/usr/local/share/npm/bin:$PATH

# enable extended globbing at all times
setopt extended_glob

# read the aliases
source $HOME/.aliases

# Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# environment variables here
#export EDITOR=vimconsole
export EDITOR=subl
export GIT_EDITOR=vimconsole
export VISUAL=subl

export ECLIPSE_HOME=/Applications/eclipse

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Highlight source code for less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

# cdargs
source /usr/local/etc/bash_completion.d/cdargs-bash.sh

# sublime library path
export SUBLIME_LIBRARY=/Users/iveney/Library/Application\ Support/Sublime\ Text\ 3

# fish shell like syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for pkgconfig and cairo
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig

# ccache
export PATH=/usr/local/opt/ccache/libexec:$PATH
