{pkgs, ...}: {
  virtualisation.docker = {
    enable = false;
    storageDriver = "btrfs";
    enableOnBoot = true;

    rootless = {
      package = pkgs.docker;
      enable = true;
      setSocketVariable = true;
    };
  };
}
