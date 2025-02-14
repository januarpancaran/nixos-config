# NixOS Config

My NixOS and Home Manager configurations ft. Hyprland. This repo is my "nix version" of my dotfiles repo [here](https://github.com/januarpancaran/dotfiles)

## Installation

```bash
# Make a folder in your home folder
mkdir -p $HOME/.config/nixos # Or any other places that you want

# Clone this repo
git clone --depth 1 https://github.com/januarpancaran/nixos-config.git
cd nixos-config
cp -r {system,home-manager} $HOME/.config/nixos

# Copy your hardware configuration
cp /etc/nixos/hardware-configuration.nix $HOME/.config/nixos/system
```

Before rebuilding your system and home manager, you need to change all user and hostname variables in this configuration. Also, feel free to change the packages before rebuilding in case you don't want programs that i use.

```bash
# Rebuild your system configuration
cd $HOME/.config/nixos/system
sudo nixos-rebuild switch --flake .

# Rebuild your home manager configuration
cd $HOME/.config/nixos/home-manager
home-manager switch --flake .
```
