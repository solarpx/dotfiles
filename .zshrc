ZSH_DISABLE_COMPFIX="true"

# colorize shell output
export CLICOLOR=1

autoload -Uz compinit && compinit -i
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats " %F{cyan}%c%u(%b)%f %a"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[staged]+="%F{red}"
  fi
}

setopt PROMPT_SUBST
export PROMPT='%F{blue}%n@%m%f:%F{green}%1~%f$vcs_info_msg_0_ %# '

# add paths
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/usr/local/sbin"

# add brew to shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="${PATH}:/opt/homebrew/opt/postgresql@15/bin:$PATH"

# add tty for github signatures
GPG_TTY=$(tty)
export GPG_TTY

# add rust env
export PATH="$HOME/.cargo/bin:$PATH"

# LLVM loader 
export LIBCLANG_PATH="/Library/Developer/CommandLineTools/usr/lib"
export DYLD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib:$DYLD_LIBRARY_PATH"

# Solana
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Anchor
export PATH="$HOME/.avm/bin:$PATH" # For zsh

# Foundry
. "$HOME/.cargo/env"
export PATH="$PATH:/Users/solarpx/.foundry/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# python
eval "$(pyenv init -)"

# anthropic
if [ -f "$HOME/.anthropic/.env" ]; then
  export $(grep -v '^#' "$HOME/.anthropic/.env" | xargs)
fi

# AWS
export AWS_SHARED_CREDENTIALS_FILE="/Volumes/SSD/.KEYSTORE/aws/config"
