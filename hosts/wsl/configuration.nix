{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.default

    ./hardware-configuration.nix

    ../../modules/wsl/base.nix
    ../../modules/nixos/nix.nix
  ];

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      karsten = {
        imports = [
          ../../modules/home-manager/base.nix
          ../../users/karsten
        ];
      };
    };
    backupFileExtension = "hm";
  };

  # Networking
  networking.hostName = "wsl";
}
