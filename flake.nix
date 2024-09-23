{
  description = "Dotfiles Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      omen15 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/omen15/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}
