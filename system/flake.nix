{
  description = "System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    auto-cpufreq,
    ...
  } @ inputs: let
    host = "nixos-daangsangu";
    system = "x86_64-linux";
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {inherit inputs;};

      modules = [
        ./configuration.nix
        auto-cpufreq.nixosModules.default
      ];
    };
  };
}
