{
  description = "OS and home-manager flake";

  inputs = {
    # OS
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    none-ls-extras = {
      url = "github:nvimtools/none-ls-extras.nvim";
      flake = false;
    };

    # Zsh plugins
    zsh-fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    auto-cpufreq,
    home-manager,
    ...
  } @ inputs: let
    host = "daangsangu";
    user = "yuhshi";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};

      modules = [
        ./system/configuration.nix
        auto-cpufreq.nixosModules.default
      ];
    };

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [./home-manager/home.nix];

      extraSpecialArgs = {inherit inputs;};
    };
  };
}
