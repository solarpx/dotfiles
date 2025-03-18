#!/bin/bash

# Source .bash_profile for environment setup
if [ -f ~/.bash_profile ]; then
    source ~/.bash_profile
fi

# Interactive shell specific settings
if [[ $- == *i* ]]; then
    # Enable tab completion
    bind 'set show-all-if-ambiguous on'
    bind 'TAB:menu-complete'

    # History settings
    HISTSIZE=10000
    HISTFILESIZE=20000
    HISTCONTROL=ignoreboth
    shopt -s histappend

    # Check window size after each command
    shopt -s checkwinsize

    # un-softblock wifi (network manager cli)
    nmcli radio wifi on 2>/dev/null
fi
