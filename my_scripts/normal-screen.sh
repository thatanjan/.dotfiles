#!/usr/bin/bash

# inverting the screen
# xrandr -o inverted
xrandr --output eDP --rotate normal

# Resetting mouse
xinput --set-prop "MSFT0001:00 06CB:CE2D Mouse" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
xinput --set-prop "MSFT0001:00 06CB:CE2D Touchpad" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
