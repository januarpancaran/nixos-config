{
  pkgs,
  config,
  ...
}: {
  # Intel
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      libvdpau-va-gl
      intel-compute-runtime
      intel-media-driver
      intel-vaapi-driver
      vpl-gpu-rt
    ];

    extraPackages32 = [pkgs.pkgsi686Linux."intel-vaapi-driver"];
  };

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };

  hardware.cpu.intel.updateMicrocode = true;

  # Nvidia
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia-container-toolkit.enable = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false;
    };

    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
