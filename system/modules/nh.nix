{pkgs, ...}: {
  programs.nh = let
    user = "daangsangu";
    configDir = "/home/${user}/.config";
  in {
    package = pkgs.nh;
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
    };
    flake = "${configDir}/nixos";
  };
}
