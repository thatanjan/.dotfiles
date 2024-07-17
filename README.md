## Documentation for Arco Linux setup with Hyprland

### Install all the necessary packages

1. Official packages

```bash
cd ~/.dotfiles/
xargs -a arcoPkgs.txt sudo pacman -S --needed
```

2. AUR packages

```bash
cd ~/.dotfiles/
xargs -a arcoAurPkgs.txt yay -S --needed
```

## List all the packages(Optional)

```bash
pacman -Qnq > arcoPkgs.txt
pacman -Qmq > arcoAurPkgs.txt
```

### Setup git and ssh

```bash
git config --global user.email "thatanjan@gmail.com"
git config --global user.name "Anjan Shomodder"


ssh-keygen -t ed25519 -C "thatanjan@gmail.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519

cat ~/.ssh/id_ed25519.pub | wl-copy
```

### Install try_swap_workspace

- Clone the repo:

```bash
cd ~
git clone git@github.com:hyprwm/contrib.git
```

- Install the package

```bash
cd contrib/try_swap_workspace
sudo make install
```

### Make sure stow is installed

```bash
sudo pacman -S stow
```

### Get the config

```bash
git clone https://github.com/thatanjan/.dotfiles
cd ~/.dotfiles

## getting neovim modules
git submodule init
git submodule update
```

### Stow the config

```bash
cd ~/.dotfiles
stow .
stow --adopt .  ## To overwrite existing files
```
