unamestr=`uname`

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias l="tail -f /var/log/apache2/*.log"
alias r="sudo apache2ctl restart"

# ENVIRONMENT
export PATH=/opt/local/bin:/opt/local/sbin:$HOME/bin:$HOME/.local/bin:$PATH

export PS1='\[[01;31m\]\u\[[01;33m\]@\[[01;36m\]\h \[[01;33m\]\w \[[01;35m\]$ \[[00m\]'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
