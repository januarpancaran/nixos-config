{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    acpi
    bat
    blueberry
    brightnessctl
    curl
    dconf
    eog
    firefox
    fzf
    glib
    grim
    htop
    jq
    killall
    nautilus
    networkmanagerapplet
    obs-studio
    papirus-icon-theme
    playerctl
    polkit_gnome
    slurp
    spotify
    swww
    telegram-desktop
    unrar
    unzip 
    webcord
    wget
    wl-clipboard
    xwaylandvideobridge
    yazi
    zoxide
  ];

  programs.mpv = {
    package = pkgs.mpv;
    enable = true;
  };
}
