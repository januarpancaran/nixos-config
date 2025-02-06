{pkgs, ...}: {
  virtualisation.docker = {
    package = pkgs.docker;
    enable = true;
    storageDriver = "btrfs";
    enableOnBoot = true;
  };
}
