{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    git
    nautilus
    neovim
    polkit_gnome
  ];
}
