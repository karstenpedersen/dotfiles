{ pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./sops.nix
    ./locale.nix
  ];

  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    micro
    wget
    git
    just
    gnumake
    chromium
    firefox
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
