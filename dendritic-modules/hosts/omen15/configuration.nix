{ config, inputs, ... }:
{
  flake.nixosConfigurations.omen15 = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      config.flake.modules.nixos.omen15
    ];
  };

  flake.modules.nixos.omen15 =
    {
      pkgs,
      ...
    }:
    {
      imports = [
        config.flake.modules.nixos.base
        config.flake.modules.nixos.hyprland
        config.flake.modules.nixos.mangowc
        config.flake.modules.nixos.nix
        config.flake.modules.nixos.audio
        config.flake.modules.nixos.bluetooth
        config.flake.modules.nixos.locale
        config.flake.modules.nixos.karsten
      ];

      # Bootloader
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      # Networking
      networking = {
        hostName = "omen15";
        firewall.enable = true;
        networkmanager = {
          enable = true;
        };
      };

      # Packages
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = with pkgs; [
        micro
        wget
        git
        just
        chromium
      ];

      system.stateVersion = "24.05";
    };
}
