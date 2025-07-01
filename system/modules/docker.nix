{pkgs, ...}: {
  virtualisation.docker = {
    enable = false;

    rootless = {
      package = pkgs.docker;
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        storage-driver = "btrfs";
      };
    };
  };
}
