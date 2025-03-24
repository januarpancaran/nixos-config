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
    discord
    eog
    foliate
    fzf
    glib
    gnome-control-center
    grim
    htop
    kdePackages.xwaylandvideobridge
    mpv
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
    openjdk
    rustc
    texliveBasic
    typescript

    (python3.withPackages (p:
      with python3Packages; [
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
}
