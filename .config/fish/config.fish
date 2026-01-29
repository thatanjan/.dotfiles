## Source from conf.d before our fish config
if test -f /usr/share/cachyos-fish-config/conf.d/done.fish
  source /usr/share/cachyos-fish-config/conf.d/done.fish
end

source /home/anjan/.dotfiles/.config/fish/conf.d/alias.fish
source /home/anjan/.dotfiles/.config/fish/conf.d/functions.fish

set PATH /home/anjan/.dotfiles/.config/hypr/scripts $PATH
set PATH /home/anjan/.local/bin $PATH
set PATH /home/anjan/.yarn/bin $PATH
set PATH /home/anjan/.emacs.d/bin $PATH
set PATH /var/lib/snapd/snap/bin $PATH
set PATH /home/anjan/.cargo/bin $PATH
set PATH /home/anjan/.config/composer/vendor/bin $PATH
set PATH /home/anjan/.dotfiles/my_scripts/ $PATH

set -x QT_QPA_PLATFORMTHEME qt5ct

set SUDO_EDITOR nvim
set GIT_EDITOR nvim
set EDITOR nvim

set -g fish_key_bindings fish_vi_key_bindings

function fish_greeting
    # neofetch
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Format man pages
set -x MANROFFOPT -c
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end

# Set the cursor to a block in insert mode
set -U fish_cursor_insert block

zoxide init fish | source
alias cd='z'

# Set locale to English (US) with UTF-8 encoding
set -x LANG en_US.UTF-8
set -x LC_TIME en_US.UTF-8
# You could also set LC_ALL to ensure all locale settings are English:
# set -x LC_ALL en_US.UTF-8
