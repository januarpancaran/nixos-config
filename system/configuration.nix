{
  config,
  lib,
  pkgs,
  ...
}: let
  host = "nixos-daangsangu";
in {
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = host;
  networking.networkmanager = {
    enable = true;
    wifi.powersave = true;
  };

  time.timeZone = "Asia/Jakarta";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.printing.enable = true;
  services.libinput.enable = true;
  services.gvfs.enable = true;

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    cudatoolkit
    libnotify
    trash-cli
  ];

  services.openssh.enable = true;
  networking.firewall.enable = true;
  security.apparmor.enable = true;

  system.stateVersion = "24.11";
}
