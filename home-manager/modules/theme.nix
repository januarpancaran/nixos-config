{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };

    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-nord-dark";
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
