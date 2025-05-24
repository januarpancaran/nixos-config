{pkgs, ...}: {
  programs.chromium = {
    package = pkgs.chromium.override {enableWideVine = true;};
    enable = true;

    commandLineArgs = [
      "--enable-features=UseOzonePlatform,TouchpadOverscrollHistoryNavigation,AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
      "--ozone-platform=wayland"
    ];

    extensions = [
      # Ublock Origin Lite
      "ddkjiahejlhfcafbddmgiahcphecmpfh"
      # Catppuccin Mocha
      "bkkmolkhemgaeaeggcmfbghljjjoofoh"
      # Always Active Window
      "ehllkhjndgnlokhomdlhgbineffifcbj"
      # Zotero Connector
      "ekhagklcjbdpajgpjgmbionohlpdbjgc"
    ];
  };
}
