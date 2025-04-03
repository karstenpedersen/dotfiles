{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/ssh.nix
  ];

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.karsten = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../users/karsten
      ];
    };
    backupFileExtension = "hm";
  };

  # Users
  users.users.karsten = {
    isNormalUser = true;
    description = "karsten";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "TODO"
    ];
    shell = pkgs.bash;
    hashedPasswordFile = config.sops.secrets."user-password".path;
  };

  services.fstrim.enable = true;

  # Networking
  networking.hostName = "eq14";
}
