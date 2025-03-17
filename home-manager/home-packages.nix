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
    kdePackages.xwaylandvideobridge
    nautilus
    obs-studio
    papirus-icon-theme
    pavucontrol
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
