{ pkgs, inputs, ... }:
let
  toLua = file: "lua << EOF\n${builtins.readFile file}EOF\n";
in 
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

    plugins = with pkgs.vimPlugins; [
      {
        plugin = alpha-nvim;
        config = toLua ./lua/plugins/alpha-nvim.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua ./lua/plugins/comment-nvim.lua;
      }

      # Completions
      {
        plugin = nvim-cmp;
        config = toLua ./lua/plugins/completions.lua;
      }
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      friendly-snippets

      # Git
      {
        plugin = gitsigns-nvim;
        config = toLua ./lua/plugins/gitsigns.lua;
      }

      # Indent
      {
        plugin = indent-blankline-nvim;
        config = toLua ./lua/plugins/indent-blankline.lua;
      }
      {
        plugin = rainbow-delimiters-nvim;
        config = toLua ./lua/plugins/rainbow-delimiters.lua;
      }

      # Lspconfig
      {
        plugin = nvim-lspconfig;
        config = toLua ./lua/plugins/lsp-config.lua;
      }

      # Lualine
      {
        plugin = lualine-nvim;
        config = toLua ./lua/plugins/lualine.lua;
      }
      nvim-web-devicons

      # Markdown Preview
      markdown-preview-nvim

      # None ls
      {
        plugin = none-ls-nvim;
        config = toLua ./lua/plugins/none-ls.lua;
      }

      # Tmux
      vim-tmux-navigator

      # Telescope
      {
        plugin = telescope-ui-select-nvim;
        config = toLua ./lua/plugins/telescope-ui-select.lua;
      }
      telescope-nvim
      plenary-nvim

      # Theme
      {
        plugin = catppuccin-nvim;
        config = toLua ./lua/plugins/theme.lua;
      }

      # Treesitter
      {
        plugin = nvim-treesitter.withAllGrammars;
        config = toLua ./lua/plugins/treesitter.lua;
      }
    ];

    extraPackages = with pkgs; [
      # Lsp
      bash-language-server
      clang-tools
      vscode-langservers-extracted
      eslint
      gopls
      jdt-language-server
      lua-language-server
      marksman
      nil
      pyright
      rust-analyzer
      sqls
      svelte-language-server
      tailwindcss-language-server
      typescript-language-server
      vue-language-server

      # None ls
      # Shell
      shfmt

      # Lua
      stylua

      # Javascript
      eslint_d
      jq
      prettierd

      # Css
      stylelint

      # Markdown
      markdownlint-cli2

      # Golang
      go-tools
      asmfmt
      golangci-lint
      golangci-lint-langserver
      golines
      gofumpt

      # Cpp
      cpplint
      cppcheck

      # Python
      pylint
      black
      isort

      # Nixos
      alejandra
      statix

      # Java
      google-java-format
      checkstyle
    ];
  };
}
