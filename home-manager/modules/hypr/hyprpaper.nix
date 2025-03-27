{pkgs, ...}: {
  services.hyprpaper = {
    package = pkgs.hyprpaper;
    enable = true;
    settings = {
      preload = ["your_image_here"];
      wallpaper = [", your_image_here"];
    };
  };
}
