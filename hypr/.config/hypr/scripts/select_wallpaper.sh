#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpapers"
SCRIPTS_DIR="$HOME/.config/hypr/scripts"

if [ ! -d "$WALLPAPER_DIR" ]; then
    exit 1
fi

SELECTION=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort | rofi -dmenu -i -theme material-you -p "󰸉 ")

if [ -z "$SELECTION" ]; then
    exit 0
fi

"$SCRIPTS_DIR/change_wallpaper.sh" "$WALLPAPER_DIR/$SELECTION"
