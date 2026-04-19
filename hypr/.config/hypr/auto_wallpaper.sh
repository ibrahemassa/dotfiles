#!/bin/bash

# Define a unique identifier for this script
SCRIPT_NAME="new_wallpaper"
PIDFILE="/tmp/${SCRIPT_NAME}.pid"

# Check if the script is already running
if [ -f "$PIDFILE" ]; then
    old_pid=$(cat "$PIDFILE")

    # Verify that the process is still running and belongs to this script
    if ps -p "$old_pid" -o comm= | grep -q "$SCRIPT_NAME"; then
        kill "$old_pid"
    fi

    rm -f "$PIDFILE"
fi

# Save the current script's PID
echo $$ > "$PIDFILE"

# Function to set a random wallpaper
set_wallpaper() {
    wallpapers_path=~/Pictures/catppuccin

    # Pick random wallpaper (ignore files starting with "not")
    wallpaper=$(find "$wallpapers_path" -type f ! -name 'not*' | shuf -n 1)

    if [ -n "$wallpaper" ]; then
        # Preload + set wallpaper for all monitors
        hyprctl hyprpaper preload "$wallpaper"
        hyprctl hyprpaper wallpaper ",$wallpaper"

        # Clean unused wallpapers from memory
        hyprctl hyprpaper unload unused
    fi
}

# Set the initial wallpaper
set_wallpaper

# Loop to update wallpaper every minute
while true; do
    sleep 60
    set_wallpaper
done
