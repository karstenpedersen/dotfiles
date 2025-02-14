{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
  ];

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.karsten = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../users/karsten
      ];

      home.stateVersion = "24.05";
    };
    backupFileExtension = "hm";
  };

  # Networking
  networking.hostName = "eq14";
}
