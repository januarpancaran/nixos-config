{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; let
    octaveCustom = octaveFull.override {
      graphicsmagick = graphicsmagick.override {
        quantumdepth = 32;
      };
    };
  in [
    acpi
    bat
    blueberry
    brightnessctl
    curl
    dconf
    eog
    foliate
    fzf
    glib
    gnome-control-center
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
    kdePackages.xwaylandvideobridge
    yazi
    zip
    zoxide
    # Programming
    cargo
    clang
    go
    nodejs
    openjdk23
    rustc
    texliveBasic
    typescript

    (python313.withPackages (p:
      with python313Packages; [
        matplotlib
        numpy
        opencv
        pandas
        scikit-learn
        seaborn
      ]))

    (octaveCustom.withPackages (p:
      with pkgs.octavePackages; [
        image
      ]))
  ];

  programs.mpv = {
    package = pkgs.mpv;
    enable = true;
  };
}
