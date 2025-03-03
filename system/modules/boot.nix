{
  pkgs,
  config,
  ...
}: {
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        configurationLimit = 5;
      };

      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = ["quiet" "acpi_backlight=native" "i915.force_probe=46a6" "mem_sleep_default=s2idle" "modprobe.blacklist=iTCO_wdt"];

    initrd.kernelModules = ["i915" "nvidia" "nvidia_modeset" "nvidia_drm" "nvidia_uvm"];
    extraModprobeConfig = ''
      options snd slots=snd-hda-intel
    '';

    extraModulePackages = [config.boot.kernelPackages.nvidiaPackages.stable];
  };
}
