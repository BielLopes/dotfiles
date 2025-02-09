#!/bin/zsh

# Key binds for zsh
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _list _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:]}={[:upper:]}' 'l:|=* r:|=*' 'r:|[.]=** r:|=**'
zstyle ':completion:*' original false
zstyle :compinstall filename '/home/gabriel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Alias for fast commands
alias ls="ls --color=auto"
alias la="ls -a"
alias lg="lazygit"
alias lsql="lazysql"
alias sil-hq="harlequin --adapter postgres --host localhost --port 5432 -U admin --password admin --dbname sil-versao-nova"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Use powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Zoxide initialization
eval "$(zoxide init zsh)"

# Add local bin to PATH
export PATH="$PATH:$HOME/.local/bin"

# Add rust to PATH
. "$HOME/.cargo/env"

# Wayvnc alias
alias wayvnc="/backup/Applications/Wayvnc/wayvnc/build/wayvnc"

# Connect vpn and ti file-system
alias vpn="/backup/Applications/vpn-connection.sh"
alias ti-fs="/backup/Applications/arquivos-ti.sh"

# Set JAVA_HOME to the custom JDK installation
export JAVA_HOME=/backup/Applications/jdk-23
export PATH=$JAVA_HOME/bin:$PATH

# Start nvm
source /usr/share/nvm/init-nvm.sh

# Add nixpkgs binaries to the PATH
export PATH=$PATH:$HOME/.nix-profile/bin
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/gabriel/.lmstudio/bin"
