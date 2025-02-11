{pkgs, ...}: {
  programs.ghostty = {
    package = pkgs.ghostty;
    enable = true;

    settings = {
      font-family = "JetBrainsMono NF";
      font-size = 14;

      theme = "catppuccin-mocha";

      window-decoration = false;
      confirm-close-surface = false;
      quit-after-last-window-closed = true;
    };
  };
}
