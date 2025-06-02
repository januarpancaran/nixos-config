{
  pkgs,
  config,
  ...
}: {
  # Intel
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      libvdpau-va-gl
      mkl
      vpl-gpu-rt
    ];
  };

  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";};

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
      finegrained = true;
    };

    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

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
