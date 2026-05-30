#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Uso: $0 /ruta/al/fondo"
    exit 1
fi

WALLPAPER=$(realpath "$1")
if [ ! -f "$WALLPAPER" ]; then
    echo "Error: '$WALLPAPER' no existe."
    exit 1
fi

MONITORS=$(hyprctl monitors -j | jq -r '.[] | .name')
CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"
> "$CONFIG_PATH"

for MON in $MONITORS; do
    hyprctl hyprpaper wallpaper "$MON,$WALLPAPER"
    cat <<EOF >> "$CONFIG_PATH"
wallpaper {
    monitor = $MON
    path = $WALLPAPER
    fit_mode = cover
}

EOF
done

matugen image --source-color-index 0 "$WALLPAPER"

ROFI_GEN_COLORS="$HOME/.local/share/rofi/themes/material-you/colors.rasi"
ROFI_CONF_COLORS="$HOME/.config/rofi/colors.rasi"

if [ -f "$ROFI_CONF_COLORS" ] && [ ! -L "$ROFI_CONF_COLORS" ]; then
    rm -f "$ROFI_CONF_COLORS"
    ln -sf "$ROFI_GEN_COLORS" "$ROFI_CONF_COLORS"
elif [ ! -f "$ROFI_CONF_COLORS" ]; then
    ln -sf "$ROFI_GEN_COLORS" "$ROFI_CONF_COLORS"
fi

qs ipc call theme reloadColors

