#!/usr/bin/env bash

# ==============================================================================
#  Dotfiles Installer Script (GNU Stow)
#  Highly optimized for modern Wayland/Hyprland environment
# ==============================================================================

set -euo pipefail

# --- Color palette & Icons ---
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"
COLOR_YELLOW="\033[33m"
COLOR_BLUE="\033[34m"
COLOR_MAGENTA="\033[35m"
COLOR_CYAN="\033[36m"

ICON_INFO="ℹ"
ICON_SUCCESS="✔"
ICON_WARN="⚠"
ICON_ERROR="✖"
ICON_ARROW="➜"

# --- Helper log functions ---
log_info() {
    echo -e "${COLOR_BLUE}${ICON_INFO} ${COLOR_BOLD}$1${COLOR_RESET}"
}

log_success() {
    echo -e "${COLOR_GREEN}${ICON_SUCCESS} ${COLOR_BOLD}$1${COLOR_RESET}"
}

log_warn() {
    echo -e "${COLOR_YELLOW}${ICON_WARN} ${COLOR_BOLD}$1${COLOR_RESET}"
}

log_error() {
    echo -e "${COLOR_RED}${ICON_ERROR} ${COLOR_BOLD}$1${COLOR_RESET}"
}

# --- Welcome Banner ---
clear
echo -e "${COLOR_MAGENTA}${COLOR_BOLD}"
echo "    ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗"
echo "    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝"
echo "    ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗"
echo "    ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║"
echo "    ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║"
echo "    ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝"
echo -e "${COLOR_RESET}"
echo -e "${COLOR_CYAN}${COLOR_BOLD}   Modern Desktop & Shell dotfiles installer | Santiago Hernandez${COLOR_RESET}"
echo "======================================================================"
echo ""

# --- Prerequisites Check ---
log_info "Verificando dependencias..."

if ! command -v stow &> /dev/null; then
    log_error "GNU Stow no está instalado."
    log_info "Instálalo usando tu gestor de paquetes:"
    echo "  -> Arch Linux: sudo pacman -S stow"
    echo "  -> Debian/Ubuntu: sudo apt install stow"
    echo "  -> macOS: brew install stow"
    exit 1
fi
log_success "GNU Stow detectado."

# --- Target directories ensure ---
log_info "Asegurando directorios del sistema..."
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share"
mkdir -p "$HOME/.local/state"
mkdir -p "$HOME/.local/opt"
log_success "Directorios base creados/verificados."

# --- Copying template secret files if missing ---
log_info "Verificando archivos de configuración locales..."

# Git config.local
GIT_LOCAL_CONF="git/.config/git/config.local"
GIT_LOCAL_EXAMPLE="git/.config/git/config.local.example"
if [ -f "$GIT_LOCAL_EXAMPLE" ] && [ ! -f "$GIT_LOCAL_CONF" ]; then
    log_warn "No se encontró '$GIT_LOCAL_CONF'. Creando uno desde la plantilla..."
    cp "$GIT_LOCAL_EXAMPLE" "$GIT_LOCAL_CONF"
    log_info " -> ¡Recuerda rellenar tus datos reales en '$GIT_LOCAL_CONF'!"
else
    log_success "Archivo '$GIT_LOCAL_CONF' verificado."
fi

# Zsh .zsh_secrets
ZSH_SECRETS="zsh/.config/zsh/.zsh_secrets"
ZSH_SECRETS_EXAMPLE="zsh/.config/zsh/.zsh_secrets.example"
if [ -f "$ZSH_SECRETS_EXAMPLE" ] && [ ! -f "$ZSH_SECRETS" ]; then
    log_warn "No se encontró '$ZSH_SECRETS'. Creando uno desde la plantilla..."
    cp "$ZSH_SECRETS_EXAMPLE" "$ZSH_SECRETS"
    log_info " -> ¡Recuerda configurar tus API keys en '$ZSH_SECRETS'!"
else
    log_success "Archivo '$ZSH_SECRETS' verificado."
fi

# --- Tmux TPM installation ---
log_info "Verificando gestor de plugins de Tmux (TPM)..."
TPM_DIR="$HOME/.local/opt/tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    log_warn "TPM no detectado. Clonando repositorio en '$TPM_DIR'..."
    mkdir -p "$(dirname "$TPM_DIR")"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    log_success "TPM instalado correctamente."
else
    log_success "TPM verificado."
fi

# --- Packages to Stow ---
# We define the default packages
PACKAGES=(
    "dunst"
    "ghostty"
    "git"
    "hypr"
    "kanata"
    "nvim"
    "quickshell"
    "rofi"
    "starship"
    "tmux"
    "yazi"
    "zsh"
)

# --- Stowing execution ---
echo ""
log_info "Aplicando configuraciones con GNU Stow (Restow)..."

for PKG in "${PACKAGES[@]}"; do
    if [ -d "$PKG" ]; then
        echo -e "${COLOR_CYAN}${ICON_ARROW} Enlazando ${COLOR_BOLD}$PKG${COLOR_RESET}..."
        # -R (restow) clears old links and creates new ones
        stow -R "$PKG"
    else
        log_warn "Directorio del paquete '$PKG' no encontrado. Saltando..."
    fi
done

echo ""
log_success "¡Todos los enlaces simbólicos han sido creados!"
echo "======================================================================"
echo -e "${COLOR_GREEN}${COLOR_BOLD}¡Instalación completada con éxito! 🎉${COLOR_RESET}"
echo -e "${COLOR_YELLOW}Nota: Si instalaste configuraciones de Zsh, abre una nueva terminal o ejecuta 'source ~/.config/zsh/.zshrc'${COLOR_RESET}"
echo "======================================================================"
