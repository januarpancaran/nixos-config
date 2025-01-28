{
  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config.allowUnfree = true;
}
