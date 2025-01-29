{ pkgs, inputs, ... }:

{
  programs.neovim = {
    package = inputs.neovim-nightly.packages.${pkgs.system}.default;
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./lua/options.lua}
    '';
  };
}
