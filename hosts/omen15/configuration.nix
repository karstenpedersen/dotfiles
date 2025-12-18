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
    # ../../modules/nixos/hyprland.nix
    ../../modules/nixos/services/emacs.nix
    # ../../modules/nixos/plasma.nix
    ../../modules/nixos/niri.nix
    # ../../modules/nixos/noctalia.nix
    ../../modules/nixos/virtualization.nix
    ../../modules/nixos/ssh.nix
    ../../modules/nixos/nvidia.nix

    ../../users/user
  ];

  nixpkgs.overlays = [
    inputs.unison-lang.overlay
  ];

  # Networking
  networking.hostName = "omen15";
}
