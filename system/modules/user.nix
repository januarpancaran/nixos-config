{pkgs, ...}: let
  user = "daangsangu";
in {
  users = {
    users.${user} = {
      isNormalUser = true;
      extraGroups = ["wheel" "video" "audio" "networkmanager" "docker"];
    };

    defaultUserShell = pkgs.zsh;
  };

  services.getty.autologinUser = user;
}
