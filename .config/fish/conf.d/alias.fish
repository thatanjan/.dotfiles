# Important
alias cat=bat

alias wcv='cd ~/.dotfiles/.config/hypr/ && nvim waybar/config.jsonc'
alias hcv='cd ~/.dotfiles/.config/hypr/ && nvim hyprland.lua'
alias hc='cd ~/.dotfiles/.config/hypr/'

alias red='redshift -l 23.810331:90.412521 -b'
alias i3='nvim ~/.config/i3/config'
alias ri3='bat ~/.config/i3/config'
alias ali='nvim ~/.config/fish/config.fish'
alias rali='nvim ~/.config/fish/config.fish'
alias kitcon='nvim ~/.config/kitty/kitty.conf'

alias nvimPer='cd ~/.dotfiles/.config/nvim/ && git checkout personal'

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

alias deshd='cd ~/git_projects/deshly/ && npm run dev'
alias desh='cd ~/git_projects/deshly/'
alias deshv='cd ~/git_projects/deshly/ && nvim .'

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
alias nvcon='cd ~/.config/nvim/ && nvim init.lua'
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

alias pha='php artisan'

## For Redwood
alias yrw='yarn redwood'
alias yrwg='yarn redwood generate'


# For Copy
alias cpsync='rsync -ah --progress'

# From Cachyos


# Replace ls with eza
alias ls='eza -Al --icons  --color=always --group-directories-first ' # preferred listing
alias la='eza -a --icons--color=always --group-directories-first  '  # all files and dirs
alias ll='eza -l --icons--color=always --group-directories-first  '  # long format
alias lt='eza -aT --icons --color=always --group-directories-first ' # tree listing
alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles


# Common use
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages


# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# pi -> omp
# alias pi='omp'
alias ompc='omp --continue'
alias ompr='omp --resume'

