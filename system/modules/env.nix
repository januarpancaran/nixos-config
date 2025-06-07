{
  environment.sessionVariables = let
    user = "daangsangu";
    configDir = "/home/${user}/.config";
  in {
    EDITOR = "nvim";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = 24;
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DEKSTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
    QT_QPA_PLATFORM = "wayland; xcb";
    GDK_BACKEND = "wayland, x11, *";
    ELECTRON_OZONE_PLATFORM_THEME = "wayland";
    NIXOS_OZONE_WL = 1;
    FLAKE = "${configDir}/nixos";
  };

  environment.pathsToLink = ["/share/zsh"];
}
