{ pkgs, ... }:

{
  programs.neovim.extraPackages = with pkgs; [
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
    
    # Nix
    alejandra
    statix
    
    # Java
    google-java-format
    checkstyle
  ];
}
