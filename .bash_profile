#!/bin/bash

# Environment variables
export EDITOR=vim
export VISUAL=vim
export TEXEDIT="$EDITOR"

# PATH configuration
export PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:/usr/share/j9.4/bin"
export PATH="$PATH:$HOME/.local/bin"

# Go configuration
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOROOT:$GOPATH:$GOBIN"
export GO111MODULE="on"

# Node.js configuration
export NVM_DIR="$HOME/.nvm"
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
    nvm use 16 >/dev/null 2>&1
fi

# Command aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias ip='ip -color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias su='su -l'

# Git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt configuration
if [[ $- == *i* ]]; then
    force_color_prompt=yes
    color_prompt=yes
    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\] $(parse_git_branch)\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
    fi
    unset color_prompt force_color_prompt
fi

# Terminal integration
if [ -f /etc/profile.d/vte.sh ]; then
    source /etc/profile.d/vte.sh
fi

# Keyboard layout (uncomment preferred layout)
# setxkbmap -layout us
# setxkbmap -layout uk
# setxkbmap -layout de
setxkbmap -layout se 2>/dev/null
