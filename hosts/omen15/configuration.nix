{ config, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.default
    inputs.sops-nix.nixosModules.sops

    ./hardware-configuration.nix

    ../../modules/nixos/base.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/documentation.nix
    # ../../modules/nixos/eduroam.nix
    ../../modules/nixos/bluetooth.nix
    ../../modules/nixos/printing.nix
    ../../modules/nixos/audio.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/xserver.nix
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

  # Define a user account
  users.users.karsten = {
    isNormalUser = true;
    description = "karsten";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # Networking
  networking.hostName = "omen15";

  # Secrets
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.gnome.gnome-keyring.enable = true;

  # Nvidia
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        # offload.enable = true;
        amdgpuBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:7:0:0";
      };
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # nvidiaSettings = true;
    };
  };
}
