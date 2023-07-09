# Important
alias cat=bat

alias wcv='cd ~/.dotfiles/.config/hypr/ && nvim waybar/config'
alias hcv='cd ~/.dotfiles/.config/hypr/ && nvim hyprland.conf'
alias hc='cd ~/.dotfiles/.config/hypr/'


alias red='redshift -l 23.810331:90.412521 -b'
alias i3='nvim ~/.config/i3/config'
alias ri3='bat ~/.config/i3/config'
alias ali='nvim ~/.config/fish/config.fish'
alias rali='nvim ~/.config/fish/config.fish'
alias kitcon='nvim ~/.config/kitty/kitty.conf'

alias nvimPer='cd ~/.dotfiles/.config/nvim/ && git checkout personal'
alias nvimDro='cd ~/.dotfiles/.config/nvim/ && git checkout droppe'

alias cdpor='cd ~/git_projects/portfolio'
alias pors='cd ~/git_projects/portfolio && yarn dev'
alias porv='cd ~/git_projects/portfolio && nvim src'

alias cdcfs='cd ~/git_projects/confession/server'
alias cdcfc='cd ~/git_projects/confession/client'
alias cf='cd ~/git_projects/confession/server && nvim src'
alias cfs='cd ~/git_projects/confession/server && yarn dev'
alias cfc='cd ~/git_projects/confession/client&& nvim .'
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
alias v='nvim'
alias nvcon='nvim ~/.config/nvim/init.lua'
alias picoc='nvim ~/.config/picom/picom.conf'
alias alac='nvim ~/.config/alacritty/alacritty.yml'
alias liconv='v ~/.dotfiles'
alias cdlico='cd ~/.dotfiles'
alias qcon='nvim ~/.config/qtile/config.py'
alias newv='cd  ~/.dotfiles/.config/nvim/ && nvim .'


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

# for Droppe
alias droppe='cd ~/git_projects/droppe-one/frontend/'
alias droppev='cd ~/git_projects/droppe-one/frontend/ & nvim .'
alias droppeu='cd ~/git_projects/droppe-one/ & docker-compose up'
alias dropped='cd ~/git_projects/droppe-one/ & docker-compose down'

alias droppeb='cd ~/git_projects/droppe-one/frontend-blog/'
alias droppebv='cd ~/git_projects/droppe-one/frontend-blog/ & nvim .'
alias droppebu='cd ~/git_projects/droppe-one/backend-blog/ & docker-compose up'
alias droppebs='cd ~/git_projects/droppe-one/backend-blog/ & yarn develop'
alias droppebd='cd ~/git_projects/droppe-one/backend-blog/ & docker-compose down'
alias droppebcs='cd ~/git_projects/droppe-one/frontend-blog/ & yarn dev'

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
# set PATH /.emacs.d/bin $PATH
# set PATH /home/anjan/.emacs.d/bin $PATH

# set PATH /home/anjan/scripts/ $PATH

set -x QT_STYLE_OVERIDE GTK+
set -x QT_QPA_PLATFORMTHEME qt5ct

# set -U $budspencer_pwdstyle long

set SUDO_EDITOR 'nvim'
set GIT_EDITOR 'nvim'
set EDITOR 'nvim'

set -g fish_key_bindings fish_vi_key_bindings


function fish_greeting
    neofetch
end

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold red
      echo 'N'
    case insert
      set_color --bold green
      echo 'I'
    case replace_one
      set_color --bold green
      echo 'R'
    case visual
      set_color --bold brmagenta
      echo 'V'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end

# Use oh my posh
# oh-my-posh init fish | source
# oh-my-posh init fish --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/easy-term.omp.json' | source
oh-my-posh init fish --config '~/.mytheme.omp.json' | source
