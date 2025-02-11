{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    user = "yuhshi";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home.nix
      ];

      extraSpecialArgs = {inherit inputs;};
    };
  };
}
