#!/usr/bin/bash

feh --bg-fill "https://www.worldanvil.com/uploads/images/64c41fff4d8ccbd1f2eaaa3e7bc01e82.jpg" &

pulseaudio-equalizer enable &

picom --config ~/.config/picom/picom.conf --experimental-backends &

echo "" >>~/.config/picom/picom.conf &

source ~/.dotfiles/my_scripts/monitor-screen.sh &
