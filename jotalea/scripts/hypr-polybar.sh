#!/bin/bash

# Kill any existing polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor information from Hyprland
MONITORS=$(hyprctl monitors -j | jq -r '.[].name')

if [[ -z "$MONITORS" ]]; then
    echo "No monitors detected!"
    exit 1
fi

# Launch polybar on each monitor
for monitor in $MONITORS; do
    echo "Launching polybar on monitor: $monitor"
    MONITOR=$monitor polybar main &
done

echo "Polybar launched successfully"
