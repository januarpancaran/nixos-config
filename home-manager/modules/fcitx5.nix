{pkgs, ...}: {
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;

        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-nord
          fcitx5-chinese-addons
        ];

        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys"."0" = "Control+backslash";
          };

          addons = {
            classicui.globalSection = {
              Theme = "Nord-Dark";
              Font = "JetBrainsMono Nerd Font 14";
              MenuFont = "JetBrainsMono Nerd Font 14";
              TrayFont = "JetBrainsMono Nerd Font Bold 14";
            };
          };
        };
      };
    };
  };
}
