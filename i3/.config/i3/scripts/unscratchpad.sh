#!/usr/bin/env bash
# Script: scratchpad_tiling.sh
# Muestra la ventana del scratchpad y la pone en tiling

# Mostrar la ventana del scratchpad
i3-msg scratchpad show


# Cambiar la ventana enfocada a tiling (por si estaba flotante)
i3-msg [con_id=$(i3-msg -t get_tree | jq '.. | select(.focused?==true).id')] floating disable

