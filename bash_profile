# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

## session vars
export PS1="[\u]:/\W:> "
export PATH="$PATH:/usr/local/bin"
export GERRIT_USER="bw-brian-cella"
export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1

## shell alias
alias l='ls -alG'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias vi='vim'
alias x='exit'
alias c='clear'
alias qfind="find . -name "
alias psg="ps -ef | grep "

## work alias
alias work="cd ~/work"


## AWS
#HOLO_ENV="017 Admin"
 
## Kill DS Store files
find ~ -name ".DS_Store" -delete

