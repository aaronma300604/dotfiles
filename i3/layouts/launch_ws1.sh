#!/bin/bash

FLAG="$HOME/.config/i3/.ws1_initialized"
LAYOUT="$HOME/.config/i3/layouts/ws1.json"
WS="1"

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

zen-browser --no-remote &
