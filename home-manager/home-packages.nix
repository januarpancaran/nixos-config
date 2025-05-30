{pkgs, ...}: {
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
    vscode

    (python312.withPackages (p:
      with pkgs.python312Packages; [
        black
        isort
        matplotlib
        numpy
        opencv4
        pandas
        pylint
        scikit-learn
        seaborn
        streamlit
      ]))

    (octaveFull.withPackages (p:
      with pkgs.octavePackages; [
        image
      ]))
  ];
}
