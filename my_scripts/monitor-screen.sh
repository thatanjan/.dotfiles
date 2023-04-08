#!/usr/bin/bash

# Check if a second monitor is available
if xrandr | grep -q " connected [0-9]"; then
	exec ~/.dotfiles/my_scripts/invert-screen.sh
	exec ~/.dotfiles/my_scripts/arandar-config.sh
else
	exec ~/.dotfiles/my_scripts/normal-screen.sh
fi
