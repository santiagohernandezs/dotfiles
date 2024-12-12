# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# XDG
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

# Cargo
. "$HOME/.cargo/env"

# Zinit
ZINIT_HOME="${XDG_DATA_HOME}:-${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then

  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Zsh Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# Key bindings
bindkey '^f' autosuggest-accept

# Source zsh aliases
source $XDG_CONFIG_HOME/zsh/.zsh_aliases

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000 
export HISTDUP=erase                    # Erase duplicates in history
setopt appendhistory                    # Append history to file
setopt sharehistory                     # Share history between sessions
setopt hist_ignore_space                # Ignore commands starting with space
setopt hist_ignore_all_dups             # Ignore all duplicates in history
setopt hist_save_no_dups                # Do not save duplicates in history
setopt hist_ignore_dups                 # Ignore duplicates in history
setopt hist_find_no_dups                # Do not find duplicates in history

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# SSH Agent
export SSH_AUTH_SOCK="~/.1password/ssh-agent.sock"

# Snippets
zinit snippet OMZP::zoxide
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load Complitions
autoload -U compinit && compinit

zinit cdreplay -q

# Expose .local/bin to PATH
export PATH=/home/tao/.local/bin:$PATH

# 1password completions
eval "$(op completion zsh)"; compdef _op op

# nvm
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# zoxide init
eval "$(zoxide init zsh)"

#fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(fzf --zsh)"

# vim
bindkey -v
export KEYTIMEOUT=1

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# deno
export DENO_INSTALL="$XDG_DATA_HOME/deno"

# pnpm
export PNPM_HOME="/home/tao/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# go
export PATH=$PATH:~/go/bin

# pyenv
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
[[ -d $PYENV_ROOT ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# pnpm end
. "/home/tao/.local/share/deno/env"

# go
export PATH=$PATH:/usr/local/go/bin

# bun completions
[ -s "/home/tao/.bun/_bun" ] && source "/home/tao/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

