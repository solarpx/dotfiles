ZSH_DISABLE_COMPFIX="true"

# add rust env
. "$HOME/.cargo/env"

# add brew to shell environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# loads nvm and bash_completion
export NVM_DIR="$HOME/.nvm"

# Colorize shell output
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

# Add tty for github signatures
GPG_TTY=$(tty)
export GPG_TTY

# Solana
export PATH="/Users/solarpx/.local/share/solana/install/active_release/bin:$PATH"

# Foundry
. "$HOME/.cargo/env"
export PATH="$PATH:/Users/solarpx/.foundry/bin"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# python
eval "$(pyenv init -)"

# anthropic
if [ -f "$HOME/.anthropic/.env" ]; then
  export $(grep -v '^#' "$HOME/.anthropic/.env" | xargs)
fi

# path
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:/usr/local/sbin"
