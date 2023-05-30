#!/usr/bin/bash

source ~/.dotfiles/my_scripts/wallpaper.sh &

pulseaudio-equalizer enable &

picom --config ~/.config/picom/picom.conf --experimental-backends &

echo "" >>~/.config/picom/picom.conf &

source ~/.dotfiles/my_scripts/monitor-screen.sh &
