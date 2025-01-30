{ pkgs, lib, ... }: 
let
  mkToml = str: lib.concatStrings ["${str}"];
in {
  programs.starship = {
    package = pkgs.starship;
    enable = true;

    settings = {
      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
      aws.format = mkToml "'\\[[$symbol($profile)(\($region\))(\[$duration\])]($style)\\]'";
      bun.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      c.format = mkToml "'\\[[$symbol($version(-$name))]($style)\\]'";
      cmake.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      cmd_duration.format = mkToml "'\\[[⏱ $duration]($style)\\]'";
      cobol.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      conda.format = mkToml "'\\[[$symbol$environment]($style)\\]'";
      crystal.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      daml.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      dart.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      deno.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      docker_context.format = mkToml "'\\[[$symbol$context]($style)\\]'";
      dotnet.format = mkToml "'\\[[$symbol($version)(🎯 $tfm)]($style)\\]'";
      elixir.format = mkToml "'\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\]'";
      elm.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      erlang.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      fennel.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      fossil_branch.format = mkToml "'\\[[$symbol$branch]($style)\\]'";
      gcloud.format = mkToml "'\\[[$symbol$account(@$domain)(\($region\))]($style)\\]'";
      git_branch.format = mkToml "'\\[[$symbol$branch]($style)\\]'";
      git_status.format = mkToml "'([\[$all_status$ahead_behind\]]($style))'";
      golang.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      gradle.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      guix_shell.format = mkToml "'\\[[$symbol]($style)\\]'";
      haskell.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      haxe.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      helm.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      hg_branch.format = mkToml "'\\[[$symbol$branch]($style)\\]'";
      java.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      julia.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      kotlin.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      kubernetes.format = mkToml "'\\[[$symbol$context( \($namespace\))]($style)\\]'";
      lua.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      memory_usage.format = mkToml "'\\[$symbol[$ram( | $swap)]($style)\\]'";
      meson.format = mkToml "'\\[[$symbol$project]($style)\\]'";
      nim.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      nix_shell.format = mkToml "'\\[[$symbol$state( \($name\))]($style)\\]'";
      nodejs.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      ocaml.format = mkToml "'\\[[$symbol($version)(\($switch_indicator$switch_name\))]($style)\\]'";
      opa.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      openstack.format = mkToml "'\\[[$symbol$cloud(\($project\))]($style)\\]'";
      os.format = mkToml "'\\[[$symbol]($style)\\]'";
      package.format = mkToml "'\\[[$symbol$version]($style)\\]'";
      perl.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      php.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      pijul_channel.format = mkToml "'\\[[$symbol$channel]($style)\\]'";
      pulumi.format = mkToml "'\\[[$symbol$stack]($style)\\]'";
      purescript.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      python.format = mkToml "'\\[[\${symbol}\${pyenv_prefix}(\${version})(\($virtualenv\))]($style)\\]'";
      raku.format = mkToml "'\\[[$symbol($version-$vm_version)]($style)\\]'";
      red.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      ruby.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
      rust.format = mkToml "'\\[[$symbol($version)]($style)\\]'";
    };
  };
}
