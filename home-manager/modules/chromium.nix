{pkgs, ...}: {
  programs.chromium = {
    package = pkgs.chromium.override {
      enableWideVine = true;
      proprietaryCodecs = true;
    };
    enable = true;

    commandLineArgs = [
      "--enable-features=UseOzonePlatform,TouchpadOverscrollHistoryNavigation,AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport,UseMultiPlaneFormatForHardwareVideo"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
      "--enable-hardware-overlays"
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
