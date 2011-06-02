export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
source /usr/local/Cellar/cdargs/1.35/contrib/cdargs-bash.sh
alias ls='ls -G'
alias ll='ls -Glh'

# RVM init script
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

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
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh

# OpenCV for python
export PYTHONPATH="/usr/local/lib/python2.6/site-packages/:$PYTHONPATH"

if [ -f `brew --prefix`/etc/autojump ]; then
	. `brew --prefix`/etc/autojump
fi

