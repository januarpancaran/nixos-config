{
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; let
      read = file: "${builtins.readFile file}";
    in [
      {
        plugin = alpha-nvim;
        type = "lua";
        config = ''
          require("alpha").setup(require("alpha.themes.dashboard").config)
        '';
      }

      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
          require("Comment").setup()
        '';
      }

      # Completions
      {
        plugin = nvim-cmp;
        type = "lua";
        config = read ../../after/plugin/completions.lua;
      }
      cmp-nvim-lsp
      luasnip
      cmp_luasnip
      friendly-snippets

      # Git
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = read ../../after/plugin/gitsigns.lua;
      }

      # Indent
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = read ../../after/plugin/indent-blankline.lua;
      }
      {
        plugin = rainbow-delimiters-nvim;
        type = "lua";
        config = read ../../after/plugin/rainbow-delimiters.lua;
      }

      # Lspconfig
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = read ../../after/plugin/lsp-config.lua;
      }

      # Lualine
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup({
            options = {
              theme = "dracula",
            }
          })
        '';
      }
      nvim-web-devicons

      # Markdown Preview
      {
        plugin = markdown-preview-nvim;
        type = "lua";
        config = read ../../after/plugin/markdown-preview.lua;
      }

      # None ls
      {
        plugin = none-ls-nvim;
        type = "lua";
        config = read ../../after/plugin/none-ls.lua;
      }
      (pkgs.vimUtils.buildVimPlugin {
        name = "none-ls-extras-nvim";
        src = inputs.none-ls-extras;
        dependencies = [none-ls-nvim];
      })

      # Vim tmux navigator
      {
        plugin = vim-tmux-navigator;
        type = "lua";
        config = read ../../after/plugin/vim-tmux-navigator.lua;
      }

      # Telescope
      {
        plugin = telescope-nvim;
        type = "lua";
        config = read ../../after/plugin/telescope.lua;
      }
      telescope-ui-select-nvim
      plenary-nvim

      # Theme
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          vim.cmd.colorscheme("catppuccin-mocha")
        '';
      }

      # Treesitter
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = read ../../after/plugin/treesitter.lua;
      }

      # Trouble
      {
        plugin = trouble-nvim;
        type = "lua";
        config = read ../../after/plugin/trouble-nvim.lua;
      }

      # Undotree
      {
        plugin = undotree;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
        '';
      }

      # Supermaven
      {
        plugin = supermaven-nvim;
        type = "lua";
        config = ''
          require("supermaven-nvim").setup({
            keymaps = {
              accept_suggestion = "<C-f>",
              clear_suggestion = "<C-]>",
              accept_word = "<C-j>",
            },
          })
        '';
      }

      # Render Markdown
      {
        plugin = render-markdown-nvim;
        type = "lua";
        config = ''
          require("render-markdown").setup({
            completions = { lsp = { enabled = true } },
          })
        '';
      }
    ];

    extraPackages = with pkgs; [
      # Lsp
      bash-language-server
      clang-tools
      docker-compose-language-service
      dockerfile-language-server-nodejs
      eslint
      gopls
      jdt-language-server
      lua-language-server
      marksman
      matlab-language-server
      nixd
      rust-analyzer
      sqls
      svelte-language-server
      tailwindcss-language-server
      texlab
      typescript-language-server
      vscode-langservers-extracted
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
      golines
      gofumpt

      # Cpp
      cpplint
      cppcheck

      # Python
      ruff

      # Nix
      alejandra

      # Java
      google-java-format
      checkstyle

      # LaTex
      textidote

      # Docker
      hadolint
    ];

    extraPython3Packages = ps:
      with ps; [
        ruff
      ];
  };
}
