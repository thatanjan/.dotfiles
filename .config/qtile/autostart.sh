#!/usr/bin/bash

feh --bg-fill "https://images.pexels.com/photos/141876/pexels-photo-141876.jpeg?auto=compress&cs=tinysrgb&w=1600" &

pulseaudio-equalizer enable &

picom --config ~/.config/picom/picom.conf --experimental-backends &

echo "" >>~/.config/picom/picom.conf &

source ~/.dotfiles/my_scripts/monitor-screen.sh &
