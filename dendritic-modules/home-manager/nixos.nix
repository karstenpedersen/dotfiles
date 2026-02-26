{ config, inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      backupFileExtension = "home-manager-backup";
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}