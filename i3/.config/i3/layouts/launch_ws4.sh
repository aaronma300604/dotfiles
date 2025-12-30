#!/bin/bash

FLAG="$HOME/.config/i3/.ws4_initialized"
LAYOUT="$HOME/.config/i3/layouts/ws4.json"
WS="4"

workspace_exists() {
    i3-msg -t get_workspaces | grep -q "\"name\":\"$WS\""
}

if [ -f "$FLAG" ] && ! workspace_exists; then
    rm "$FLAG"
fi

if [ -f "$FLAG" ]; then
    i3-msg "workspace $WS"
    exit 0
fi

touch "$FLAG"

i3-msg "workspace $WS; append_layout $LAYOUT"

kitty --class dysk -e bash -c "dysk; exec bash" &
kitty --class fetch -e bash -c "fastfetch; exec bash" &
kitty --class astro -e bash -c "astroterm --color --constellations --speed 2000 --fps 64 --city Singapore; exec bash" &
