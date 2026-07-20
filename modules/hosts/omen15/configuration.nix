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

      selfpkgs = self.packages."${pkgs.system}";
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

      programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
          (with pkgs.dotnetCorePackages; combinePackages [
            sdk_8_0
            sdk_10_0
          ])
        ];
      };

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
      environment.systemPackages = [
        pkgs.micro
        pkgs.wget
        pkgs.just
        pkgs.chromium
        pkgs.dconf
        pkgs.kdePackages.dolphin
        # git
        selfpkgs.git
      ];

      environment.sessionVariables = {
        DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
      };

      system.stateVersion = "26.05";
    };
}
