{pkgs, ...}: {
  imports = [
    ./policies.nix
    ./profiles.nix
  ];

  programs.firefox = {
    # package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {pipewireSupport = true;}) {};
    package = pkgs.firefox;
    enable = true;
  };
}
