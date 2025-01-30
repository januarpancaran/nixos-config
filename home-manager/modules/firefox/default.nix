{pkgs, ...}: {
  imports = [
    ./policies.nix
    ./profiles.nix
  ];

  programs.firefox = {
    package = pkgs.firefox;
    enable = true;
  };
}
