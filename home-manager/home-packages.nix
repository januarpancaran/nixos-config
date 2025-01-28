{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    bat
    blueberry
    brightnessctl
    curl
    dconf
    dunst
    eog
    fastfetch
    firefox
    git
    glib
    grim
    htop
    jq
    killall
    nautilus
    neovim
    networkmanagerapplet
    obs-studio
    playerctl
    polkit_gnome
    rofi-wayland
    slurp
    spotify
    swww
    telegram-desktop
    trash-cli
    unrar
    unzip 
    webcord
    wget
    wl-clipboard
    wlogout
    xwaylandvideobridge
    zoxide
  ];

  programs.mpv = {
    package = pkgs.mpv;
    enable = true;
  };
}
