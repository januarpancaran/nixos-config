{pkgs, ...}: {
  programs.vscode = {
    package = pkgs.vscode;
    enable = true;

    profiles.default = {
      enableUpdateCheck = true;
      enableExtensionUpdateCheck = true;

      extensions = with pkgs.vscode-extensions; [
        # Prettier
        esbenp.prettier-vscode

        # Python
        ms-python.python
        ms-python.debugpy
        ms-python.vscode-pylance
        ms-python.isort
        ms-python.black-formatter
        ms-python.pylint

        # Jupyter
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        ms-toolsai.vscode-jupyter-cell-tags
        ms-toolsai.vscode-jupyter-slideshow

        # C/C++
        ms-vscode.cpptools-extension-pack
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        xaver.clang-format

        # Live Server
        ritwickdey.liveserver
        ms-vscode.live-server

        # Intellicode
        visualstudioexptteam.vscodeintellicode
        visualstudioexptteam.intellicode-api-usage-examples

        # Java
        redhat.java
        vscjava.vscode-java-pack
        vscjava.vscode-gradle
        vscjava.vscode-maven
        vscjava.vscode-java-test
        vscjava.vscode-java-debug

        # ESLint
        dbaeumer.vscode-eslint

        # Docker
        ms-azuretools.vscode-docker

        # Git
        eamodio.gitlens
        github.copilot
        github.vscode-pull-request-github

        # Code runner
        formulahendry.code-runner

        # Auto tag
        formulahendry.auto-rename-tag
        formulahendry.auto-close-tag

        # Vscode icons
        vscode-icons-team.vscode-icons

        # Path intellisense
        christian-kohler.path-intellisense

        # Golang
        golang.go

        # Flutter
        dart-code.dart-code
        dart-code.flutter

        # Indent rainbow
        oderwat.indent-rainbow

        # Tailwind CSS
        bradlc.vscode-tailwindcss

        # Better comments
        aaron-bond.better-comments

        # Vim
        vscodevim.vim

        # Pdf reader
        tomoki1207.pdf

        # Error lens
        usernamehw.errorlens

        # Import cost
        wix.vscode-import-cost

        # Rust
        rust-lang.rust-analyzer

        # Vue
        vue.volar

        # Theme
        catppuccin.catppuccin-vsc
        jdinhlife.gruvbox
        github.github-vscode-theme

        # Kubernetes
        ms-kubernetes-tools.vscode-kubernetes-tools

        # PHP
        devsense.phptools-vscode
        bmewburn.vscode-intelephense-client
        devsense.composer-php-vscode
        devsense.profiler-php-vscode

        # Markdownlint
        davidanson.vscode-markdownlint

        # Svelte
        svelte.svelte-vscode
      ];

      userSettings = {
        editor = {
          fontFamily = "JetBrainsMono Nerd Font";
          fontSize = 18;
          fontLigatures = true;
        };

        terminal.integrated.fontFamily = "JetBrainsMono Nerd Font";

        workbench = {
          sideBar.location = "right";
          colorTheme = "Catppuccin Mocha";
          iconTheme = "vscode-icons";
        };

        code-runner = {
          clearPreviousOutput = true;
          runInTerminal = true;
          saveFileBeforeRun = true;
        };

        vim = {
          leader = " ";
          autoIndent = true;
          cursorStylePerMode = let
            cursor = "block";
          in {
            insert = cursor;
            normal = cursor;
            replace = cursor;
            visual = cursor;
            visualblock = cursor;
            visualline = cursor;
          };
          enableNeovim = true;
          neovimConfigPath = "~/.config/nvim/init.lua";
          neovimPath = "${pkgs.neovim-unwrapped}/bin/nvim";
          neovimUseConfigFile = true;
          highlightedyank.enable = true;
          smartRelativeLine = true;
        };
      };
    };
  };
}
