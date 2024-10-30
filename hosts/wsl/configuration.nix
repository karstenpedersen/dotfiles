{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-wsl.nixosModules.default
    ../../../modules/common/nix.nix
    ../../../modules/wsl/base.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      karsten = {
        imports = [
          ../../../modules/home-manager/base.nix
          ../../../users/karsten
        ];

        # Home
        programs.home-manager.enable = true;
        home.stateVersion = "24.05";
      };
    };
    backupFileExtension = "hm";
  };

  networking.hostName = "wsl";
}
