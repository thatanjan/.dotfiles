#!/usr/bin/bash

# inverting the screen
# xrandr -o inverted
xrandr --output eDP --rotate inverted

# Inverting mouse
xinput --set-prop "MSFT0001:00 06CB:CE2D Mouse" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
xinput --set-prop "MSFT0001:00 06CB:CE2D Touchpad" "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

xrandr --output eDP --mode 1920x1080 --pos 0x1080 --rotate inverted --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal

echo "Successfully inverted screen"
