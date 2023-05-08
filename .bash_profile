#!/bin/bash

# bash_profile is run on login
PATH=$PATH:/bin
PATH=$PATH:/bin/local/sbin/git-tcl
PATH=$PATH:/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/share/j9.4/bin

# set go envvars
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN

# go modules
export GO111MODULE="on"

# Colorize commands
alias ls='ls --color=auto'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias su='su -l'

# Set keymaps
# setxkbmap -layout us
# setxkbmap -layout uk
# setxkbmap -layout de
setxkbmap -layout se

# Colorize git branch
force_color_prompt=yes
color_prompt=yes
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

# Source nvm script
source /usr/share/nvm/init-nvm.sh
nvm use 16

# Set default editor
export EDITOR=nano
export VISUAL=nano
export TEXEDIT="$EDITOR"

# Open new shell in current directory
source /etc/profile.d/vte.sh
