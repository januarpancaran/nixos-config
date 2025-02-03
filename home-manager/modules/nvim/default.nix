{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./lua/plugin
  ];

  programs.neovim = {
    package = inputs.neovim-nightly.packages.${pkgs.system}.default;
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
