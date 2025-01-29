{ pkgs, ... }:

{
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
          type = "colors";
          key = "Colors";
          block = {
            range = [ 1 6 ];
          };
        }
      ];
    };
  };
}
