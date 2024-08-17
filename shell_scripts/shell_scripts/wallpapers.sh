# #!/bin/zsh
# WALLPAPER_DIR=~/Pictures/Wallpapers/
# SELECTED_WALLPAPER=$(ls $WALLPAPER_DIR | wofi --show dmenu --prompt "Select Wallpaper")
#
# if [ -n "$SELECTED_WALLPAPER" ]; then
#     swww img "$WALLPAPER_DIR/$SELECTED_WALLPAPER"
# else
#     echo "No wallpaper selected."
# fi
#!/bin/zsh

WALLPAPER_DIR=/home/ibrahem/Pictures/Wallpapers

# List wallpapers in wofi and select
SELECTED_WALLPAPER=$(ls $WALLPAPER_DIR | wofi --show dmenu --prompt "Select Wallpaper")


# Check if swww is running, start it if not
if ! pgrep -x "swww" > /dev/null; then
    swww init &
    sleep 2 # Give swww some time to start
fi
if [ -n "$SELECTED_WALLPAPER" ]; then
    swww img "$WALLPAPER_DIR/$SELECTED_WALLPAPER"
else
    echo "No wallpaper selected."
fi

