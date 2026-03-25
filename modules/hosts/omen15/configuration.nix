{ self, inputs, ... }:
{
  flake.nixosConfigurations.omen15 = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.omen15
    ];
  };

  flake.modules.nixos.omen15 =
    { pkgs, config, ... }:
    {
      imports = [
        self.modules.nixos.base
        self.modules.nixos.mangowc
        self.modules.nixos.nix
        self.modules.nixos.audio
        self.modules.nixos.bluetooth
        self.modules.nixos.locale
        self.modules.nixos.karsten
        self.modules.nixos.nvidia
        self.modules.nixos.amd
        self.modules.nixos.agenix
      ];

      services.dbus.enable = true;

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
        dconf
      ];

      system.stateVersion = "26.05";
    };
}
