{pkgs, ...}: {
  programs.mpv = {
    package = pkgs.mpv;
    enable = true;

    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      gpu-context = "wayland";
    };
  };
}
