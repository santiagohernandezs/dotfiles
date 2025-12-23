#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_REPO="https://github.com/santiagohernandezs/dotfiles.git"

cat <<EOF
What do you want to do.
1) Fresh install (Default), 2) Check dotfiles, 3) Uninstall dotfiles (DANGER!!)
EOF

read -r input

fetch_dotfiles() {
    if ! [[ -d $DOTFILES_DIR ]]; then
        git clone $DOTFILES_REPO "$DOTFILES_DIR"
        echo "Dotfiles fetched"
    else
        echo "Dotfiles dir already exist"
    fi
}

fresh_install() {
    fetch_dotfiles

    local packages=(neovim git unzip curl fzf ripgrep)

    for package in "${packages[@]}"; do

        echo "Installing package: ${package}"
        local command=pacman -Qi "$package" &> /dev/null
        if [ ! $command -eq 0 ]; then
            sudo pacman -S --noconfirm "$package"


        else
            echo "Package ${package} is already installed"
        fi

        echo "Creating symlink for ${package} config"
        mkdir -p "$HOME/.fakeconfig"
        sudo ln -sf "$DOTFILES_DIR/$package/config" "$HOME/.fakeconfig/$package"
        echo "Package ${package} installed"
    done

}

clean_dotfiles() {
    if [[ -d $DOTFILES_DIR ]]; then
        echo "Are you sure? [Y]es, [N]o Y/n"
        read -r validation

        if [ "$validation" == 'n' ] || [ "$validation" == "N" ]; then
            echo "Aborting operation"
        else
            rm -rf "$DOTFILES_DIR"
            rm -rf "$HOME/.fakeconfig"
            echo "Dotfiles removed"
        fi
    else
        echo  "Dotfiles dir does not exist"
    fi
}

case "$input" in
    2) echo  "Checking dotfiles..." ;;
    3) clean_dotfiles ;;
    * ) fresh_install ;;
esac
