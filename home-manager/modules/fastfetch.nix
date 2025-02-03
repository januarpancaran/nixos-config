{pkgs, ...}: {
  programs.fastfetch = {
    package = pkgs.fastfetch;
    enable = true;

    settings = {
      logo = {
        type = "small";
      };

      display = {
        separator = " ";
        color = {
          keys = "magenta";
        };
        size = {
          ndigits = 0;
          maxPrefix = "MB";
        };
        key = {
          type = "icon";
        };
      };

      modules = [
        {
          type = "title";
          color = {
            user = "green";
            at = "red";
            host = "blue";
          };
        }
        "os"
        "kernel"
        "memory"
        "packages"
        "terminal"
        "shell"
        "terminalfont"
        "wm"
        "uptime"
        {
          type = "command";
          key = "OS Age";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "colors";
          key = "Colors";
          block = {
            range = [1 6];
          };
        }
      ];
    };
  };
}
