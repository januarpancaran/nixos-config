{pkgs, ...}: {
  imports = [
    ./lua/plugin
  ];

  programs.neovim = {
    package = pkgs.neovim-unwrapped;
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./lua/config/options.lua}
      ${builtins.readFile ./lua/config/remaps.lua}
    '';
  };
}
