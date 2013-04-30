# home brew installation binary 
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# my PS1
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# cdargs
source /usr/local/Cellar/cdargs/1.35/contrib/cdargs-bash.sh

# useful alias for coreutils
alias ls='ls -G'		    # turn color on
alias ll='ls -Glh'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | less'
alias du='du -c -h'

# other alias
alias diff='colordiff'
alias grep='grep --color=auto'
alias psgrep='ps aux | grep '

# RVM init script
# This loads RVM into a shell session.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

# git completion
source /Users/iveney/.git-completion.bash

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# Less Colors ends

# ssh host completion
complete -o default -o nospace -W "$(grep '^Host' $HOME/.ssh/config | cut -d ' ' -f2)" scp sftp ssh

# homebrew bash completion
source /usr/local/etc/bash_completion.d/cdargs-bash.sh

# OpenCV for python
export PYTHONPATH="/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"

# CUDA binary
export PATH=/usr/local/cuda/bin:$PATH
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# Used for python2.7 from Homebrew
# see this:  https://github.com/mxcl/homebrew/wiki/Homebrew-and-Python
export PATH=/usr/local/share/python:$PATH

# define editor
export EDITOR=mvim

# for autojump
if [ -f `brew --prefix`/etc/autojump ]; then
	. `brew --prefix`/etc/autojump
fi

# ccache
#export PATH=/usr/local/Cellar/ccache/3.1.4/libexec:$PATH

[[ -s "/Users/iveney/.rvm/scripts/rvm" ]] && source "/Users/iveney/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
