#!/bin/bash

# Cerrar todas las ventanas del workspace activo
CURRENT_WS=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true) | .name')

i3-msg "[workspace=\"$CURRENT_WS\"] kill"
i3-msg "workspace $CURRENT_WS; [workspace=\"$CURRENT_WS\"] kill"
