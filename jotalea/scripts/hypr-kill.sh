#!/bin/bash
active_window=$(hyprctl activewindow -j | jq -r '.class')
if [[ "$active_window" != "polybar" ]]; then
    hyprctl dispatch killactive
fi
