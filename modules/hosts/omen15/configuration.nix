{ self, inputs, ... }:
{
  flake.meta-hosts.omen15 = {
    name = "omen15";
  };

  flake.nixosConfigurations.${self.meta-hosts.omen15.name} = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.hostOmen15
    ];
  };

  flake.modules.nixos.hostOmen15 =
    { pkgs, ... }:
    let
      omen15 = self.meta-hosts.omen15;

      selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
    in
    {
      imports = [
        self.modules.nixos.nix
        self.modules.nixos.mangowc
        self.modules.nixos.locale
        self.modules.nixos.agenix
        self.modules.nixos.unfree
        self.modules.nixos.nvidia
        self.modules.nixos.amd
        self.modules.nixos.godot
        self.modules.nixos.voyager

        self.modules.nixos.karsten
      ];

      services.dbus.enable = true;

      programs.nix-ld = {
        enable = true;
      };

      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;
      };

      # Bootloader
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };

      boot.enableContainers = true;

      # Virtualisation
      virtualisation.containers.enable = true;
      virtualisation.podman = {
        enable = true;
        defaultNetwork.settings.dns_enabled = true;
      };
      virtualisation.docker = {
        enable = true;
      };

      # Networking
      networking = {
        hostName = omen15.name;
        firewall.enable = true;
        networkmanager = {
          enable = true;
        };
      };

      # Packages
      environment.systemPackages = [
        pkgs.micro
        pkgs.wget
        pkgs.just
        pkgs.chromium
        pkgs.dconf
        pkgs.kdePackages.dolphin
        selfpkgs.git
      ];

      system.stateVersion = "26.05";
    };
}
