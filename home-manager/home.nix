{
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home.username = "daangsangu";
  home.homeDirectory = "/home/daangsangu";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
