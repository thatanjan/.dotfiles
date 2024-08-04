# Important
alias cat=bat

alias wcv='cd ~/.dotfiles/.config/hypr/ && neovide waybar/config'
alias hcv='cd ~/.dotfiles/.config/hypr/ && neovide hyprland.conf'
alias hc='cd ~/.dotfiles/.config/hypr/'

alias red='redshift -l 23.810331:90.412521 -b'
alias i3='neovide ~/.config/i3/config'
alias ri3='bat ~/.config/i3/config'
alias ali='neovide ~/.config/fish/config.fish'
alias rali='neovide ~/.config/fish/config.fish'
alias kitcon='neovide ~/.config/kitty/kitty.conf'

alias neovidePer='cd ~/.dotfiles/.config/neovide/ && git checkout personal'

alias cdpor='cd ~/git_projects/portfolio'
alias pors='cd ~/git_projects/portfolio && yarn dev'
alias porv='cd ~/git_projects/portfolio && neovide src'

alias cdcfs='cd ~/git_projects/confession/server'
alias cdcfc='cd ~/git_projects/confession/client'
alias cf='cd ~/git_projects/confession/server && neovide src'
alias cfs='cd ~/git_projects/confession/server && yarn dev'
alias cfc='cd ~/git_projects/confession/client&& neovide .'
alias cfcs='cd ~/git_projects/confession/client&& yarn dev'
alias cfcbs='cd ~/git_projects/confession/server && yarn both-dev'

alias cdcc='cd ~/git_projects/cules-coding'
alias ccv='cd ~/git_projects/cules-coding && v .'
alias ccs='cd ~/git_projects/cules-coding && yarn dev'

# For git
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gcl='git clone'
alias gba='git branch -a'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gp='git push origin'
alias gpu='git pull origin'
alias gcm="git commit -m"
alias gcmv="git commit"
alias gcam="git commit -am"
alias gcamnd="git commit --amend -m"
alias gstr="git restore"
alias gstrs="git restore --staged"
alias gl='git log'
alias gm='git merge'
alias gf='git fetch origin'

# For configs
alias v='neovide'
alias nvcon='cd ~/.config/nvim/ && neovide init.lua'
alias picoc='neovide ~/.config/picom/picom.conf'
alias alac='neovide ~/.config/alacritty/alacritty.yml'
alias liconv='v ~/.dotfiles'
alias cdlico='cd ~/.dotfiles'
alias qcon='neovide ~/.config/qtile/config.py'
alias newv='cd  ~/.dotfiles/.config/neovide/ && neovide .'


# System
alias po='poweroff'
alias rbt='reboot'

# Pacman
alias paci='sudo pacman -S'
alias pacr='sudo pacman -Rns'
alias pacu='sudo pacman -Syu'

alias yad='yarn add --dev'
alias ya='yarn add'


alias arch='sudo mount /dev/sda12 /mnt/arch'
alias uarch='sudo umount /mnt/arch'
alias cdarch='cd /mnt/arch/home/anjan'

alias arco='sudo mount /dev/sda13 /mnt/arco'
alias uarco='sudo umount /mnt/arco'
alias cdarco='cd /mnt/arco/home/anjan'

alias pha='php artisan'

## For Redwood
alias yrw='yarn redwood'
alias yrwg='yarn redwood generate'


set PATH /home/anjan/.dotfiles/.config/hypr/scripts $PATH
set PATH /home/anjan/.local/bin $PATH
set PATH /home/anjan/.yarn/bin $PATH
set PATH /home/anjan/.emacs.d/bin $PATH
set PATH /var/lib/snapd/snap/bin $PATH
set PATH /home/anjan/.cargo/bin $PATH
set PATH /home/anjan/.config/composer/vendor/bin $PATH
set PATH /home/anjan/.dotfiles/my_scripts/ $PATH

set -x QT_QPA_PLATFORMTHEME qt5ct

set SUDO_EDITOR 'nvim'
set GIT_EDITOR 'nvim'
set EDITOR 'nvim'

set -g fish_key_bindings fish_vi_key_bindings

function fish_greeting
    # neofetch
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

zoxide init fish | source
alias cd='z'
