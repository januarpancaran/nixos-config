{
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home.username = "yuhshi";
  home.homeDirectory = "/home/yuhshi";
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
