{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/documentation.nix
    ../../modules/nixos/eduroam.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/plasma.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/nvidia.nix

    ../../users/user
  ];

  # Networking
  networking.hostName = "omen15";
}
