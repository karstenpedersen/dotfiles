{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/k3s.nix
    ../../modules/nixos/fail2ban.nix

    ../../users/server
  ];

  # Networking
  networking.hostName = "eq14";
}
