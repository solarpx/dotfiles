#!/bin/bash

# Open new shell in current directory
source /etc/profile.d/vte.sh

# Set default editor
export EDITOR=vim
export VISUAL=vim
export TEXEDIT="$EDITOR"

# source nvm
source /usr/share/nvm/init-nvm.sh

# un-softblock wifi (network manager cli)
nmcli radio wifi on
