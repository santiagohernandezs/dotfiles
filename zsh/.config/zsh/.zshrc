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
# Source all files if they exist
if [[ -f $XDG_CONFIG_HOME/zsh/.zsh_aliases ]]; then
  source $XDG_CONFIG_HOME/zsh/.zsh_aliases
fi
#
# Source all functions if they exist
if [[ -f $XDG_CONFIG_HOME/zsh/.zsh_functions ]]; then
  source $XDG_CONFIG_HOME/zsh/.zsh_functions
fi
#
# Zinit configuration
ZINIT_HOME="${XDG_DATA_HOME}:-${HOME}/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
#
# Zsh Plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
#
# Snippets
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit snippet OMZP::kubectl
zinit snippet OMZP::minikube
zinit ice as"completion"
zinit snippet "$XDG_OPT_HOME/bun/_bun" # bun completions
zinit snippet OMZP::nvm
zinit snippet OMZP::aws
#
zinit light Aloxaf/fzf-tab # Fuzzy completion for zsh using fzf (NEEDS TO BE BEFORE COMPINIT and AFTER ZSH-COMPLETIONS)
#
# Key bindings
bindkey '^f' autosuggest-accept
bindkey ' ' magic-space
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
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 -al --group-directories-first --icons $realpath'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' group-name ''
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-flags '--preview-window=down:10%:wrap'
#
# Load Complitions
autoload -U compinit && compinit
zinit cdreplay -q
zinit light zsh-users/zsh-syntax-highlighting # Syntax highlighting (NEEDS TO BE AFTER COMPINIT)
#
# zoxide init
eval "$(zoxide init zsh)"
#
# starship
eval "$(starship init zsh)"
#
#fzf
eval "$(fzf --zsh)"
#
# vim
bindkey -v
#
# pyenv
eval "$(pyenv init --path)"
#
# Load env vars from files
#
config_files=(
  "$HOME/.local/opt/cargo/env" # cargo
  "$NVM_DIR/nvm.sh" # nvm
)

load_env_files "${config_files[@]}"

# Ensure unique entries in PATH
typeset -U PATH path
