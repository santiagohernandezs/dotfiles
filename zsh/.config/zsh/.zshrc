#########################
### ZSH CONFIGURATION ###
#########################
#
#
# This file is sourced by zsh upon start. It should contain commands to set up
# aliases, functions, options, key bindings, etc.
#
# Source all exports if they exist
if [[ -f $HOME/.config/zsh/.zsh_exports ]]; then
  source $HOME/.config/zsh/.zsh_exports
fi
#
#
# Source all files if they exist
if [[ -f $XDG_CONFIG_HOME/zsh/.zsh_aliases ]]; then
  source $XDG_CONFIG_HOME/zsh/.zsh_aliases
fi
#
#
# Source all functions if they exist
if [[ -f $XDG_CONFIG_HOME/zsh/.zsh_functions ]]; then
  source $XDG_CONFIG_HOME/zsh/.zsh_functions
fi
#
# Powerlevel10k configuration
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#
#
# Zinit configuration
ZINIT_HOME="${XDG_DATA_HOME}:-${HOME}/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
#
#
# Zsh Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab
#
#
# Snippets
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::zoxide
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
#
#
# Key bindings
bindkey '^f' autosuggest-accept
#
#
# zsh
setopt appendhistory                    # Append history to file
setopt sharehistory                     # Share history between sessions
setopt hist_ignore_space                # Ignore commands starting with space
setopt hist_ignore_all_dups             # Ignore all duplicates in history
setopt hist_save_no_dups                # Do not save duplicates in history
setopt hist_ignore_dups                 # Ignore duplicates in history
setopt hist_find_no_dups                # Do not find duplicates in history
#
#
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
#
#
# Load Complitions
autoload -U compinit && compinit
zinit cdreplay -q
#
#
# 1password completions
eval "$(op completion zsh)"; compdef _op op
#
#
# zoxide init
eval "$(zoxide init zsh)"
#
#
#fzf
eval "$(fzf --zsh)"
#
#
# vim
bindkey -v
#
#
# pyenv
eval "$(pyenv init --path)"
#
#
# Load env vars from files
#
config_files=(
  "$HOME/.cargo/env" # cargo
  "$HOME/.local/share/deno/env" # deno
  "$HOME/.bun/_bun" # bun completions
  "$XDG_CONFIG_HOME/zsh/.p10k.zsh" # powerlevel10k
  "$NVM_DIR/nvm.sh" # nvm
)

load_env_files "${config_files[@]}"
