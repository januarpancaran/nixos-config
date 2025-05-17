{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    acpi
    bat
    blueberry
    brightnessctl
    curl
    dconf
    discord
    eog
    evince
    foliate
    fzf
    glib
    gnome-control-center
    htop
    hyprshot
    insomnia
    kdePackages.xwaylandvideobridge
    libreoffice
    mpv
    mysql_jdbc
    nautilus
    netbeans
    obs-studio
    papirus-icon-theme
    pavucontrol
    playerctl
    polkit_gnome
    ripgrep
    spotify
    telegram-desktop
    unrar
    unzip
    wget
    wl-clipboard
    yazi
    zip
    zotero
    zoxide

    # Programming
    cargo
    gcc
    go
    gradle
    maven
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
        pip
        scikit-learn
        seaborn
      ]))

    (octaveFull.withPackages (p:
      with pkgs.octavePackages; [
        image
      ]))
  ];
}
