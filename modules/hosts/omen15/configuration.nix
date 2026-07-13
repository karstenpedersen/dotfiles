{ self, inputs, ... }:
{
  flake.meta-hosts.omen15 = {
    name = "omen15";
  };

  flake.nixosConfigurations.${self.meta-hosts.omen15.name} = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.modules.nixos.omen15
    ];
  };

  flake.modules.nixos.omen15 =
    { pkgs, ... }:
    let
      omen15 = self.meta-hosts.omen15;
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
        # self.modules.nixos.cuda

        self.modules.nixos.karsten
      ];

      services.dbus.enable = true;

      programs.nix-ld.enable = true;

      programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;  # or choose one below
      };

      # Bootloader
      boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
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
      environment.systemPackages = with pkgs; [
        micro
        wget
        git
        just
        chromium
        dconf
        kdePackages.dolphin
      ];

      system.stateVersion = "26.05";
    };
}
