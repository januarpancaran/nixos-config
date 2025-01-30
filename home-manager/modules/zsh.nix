{ pkgs, inputs, ... }:

{
  programs.zsh = {
    package = pkgs.zsh;
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    completionInit = "autoload -U compinit && compinit";

    history = {
      append = true;
      share = true;
      findNoDups = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      saveNoDups = true;
      path = "$HOME/.zsh_history";
      save = 10000;
      size = 10000;
    };

    plugins = [
      {
        name = "fzf-tab";
        src = inputs.zsh-fzf-tab;
      }
    ];

    shellAliases = {
      ls = "ls -a --color=yes";
      ll = "ll -a --color=yes";
      svim = "sudo nvim";
      nfzf = "nvim $(fzf -m --preview='bat --color=always {}')";
      cat = "bat";
      grep = "grep --color=yes";
      rm = "trash-put";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };

    profileExtra = ''
      if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec Hyprland
      fi
    '';

    initExtra = ''
      zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
      zstyle ":completion:*" list-colors "$\{(s.:.)LS_COLORS}"
      zstyle ":completion:*" menu no
      zstyle ":fzf-tab-complete:cd:*" fzf-preview "ls --color $realpath"
      zstyle ":fzf-tab-complete:__zoxide_z:*" fzf-preview "ls --color $realpath"

      bindkey "^f" autosuggest-accept
      bindkey "^p" history-search-backward
      bindkey "^n" history-search-forward

      if [ -f ${pkgs.fastfetch}/bin/fastfetch ]; then
        fastfetch
      fi

      source <(fzf --zsh)
      eval "$(zoxide init zsh)"
      eval "$(starship init zsh)"
    '';
  };
}
