# NixOS Config

My NixOS and Home Manager configurations ft. Hyprland. This repo is my "nix version" of my dotfiles repo [here](https://github.com/januarpancaran/dotfiles)

## Installation

This dotfiles uses nixos-unstable channel, so if you haven't change your channel, be sure to do so by doing this:

```shellSession
# nix-channel --remove nixos
# nix-channel --add https://nixos.org/channels/nixos-unstable nixos
# nix-channel --update
```

Also, if you haven't installed home manager, be sure to do so by doing this:

```shellSession
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
$ nix-shell '<home-manager>' -A install
```

Then, proceed with the installation:

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
# or if you just changed the channel to unstable
sudo nixos-rebuild switch --flake . --upgrade

# Rebuild your home manager configuration
cd $HOME/.config/nixos/home-manager
home-manager switch --flake .
```
