{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    acpi
    bat
    blueberry
    brightnessctl
    curl
    dconf
    eog
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
    ripgrep
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
    # Programming
    cargo
    clang
    go
    nodejs
    openjdk23
    python314
    rustc
  ];

  programs.mpv = {
    package = pkgs.mpv;
    enable = true;
  };
}
