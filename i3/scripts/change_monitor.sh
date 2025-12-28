#!/bin/bash

# Monitores
MON1="HDMI-0"
MON2="DP-4"

# Workspace actual
CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

# Monitor actual del workspace
CURRENT_OUTPUT=$(i3-msg -t get_workspaces | jq -r ".[] | select(.name==\"$CURRENT_WS\") | .output")

# Determinar monitor destino
if [ "$CURRENT_OUTPUT" = "$MON1" ]; then
    TARGET_OUTPUT="$MON2"
elif [ "$CURRENT_OUTPUT" = "$MON2" ]; then
    TARGET_OUTPUT="$MON1"
else
    # Si no está en ninguno de los dos, enviamos a MON1 por defecto
    TARGET_OUTPUT="$MON1"
fi

# Mover workspace
i3-msg "workspace $CURRENT_WS; move workspace to output $TARGET_OUTPUT"
