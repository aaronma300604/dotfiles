#!/bin/bash

FLAG="$HOME/.config/i3/.ws3_initialized"
LAYOUT="$HOME/.config/i3/layouts/ws3.json"
WS="3"

# ¿Existe el workspace 3 ahora mismo?
workspace_exists() {
    i3-msg -t get_workspaces | grep -q "\"name\":\"$WS\""
}

# Si la flag existe pero el workspace NO → resetear flag
if [ -f "$FLAG" ] && ! workspace_exists; then
    rm "$FLAG"
fi

# Si ya está inicializado → solo ir al workspace
if [ -f "$FLAG" ]; then
    i3-msg "workspace $WS"
    exit 0
fi

# Primera vez: crear layout
touch "$FLAG"

i3-msg "workspace $WS; append_layout $LAYOUT"

kitty --class pkmn -e bash -c "pokemon-colorscripts -s -rn umbreon,porygon2,haxorus,aegislash --no-title; exec bash" &
kitty --class fexpl -e bash -c "yazi; exec bash" &
code &
