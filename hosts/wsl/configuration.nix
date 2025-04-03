{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/wsl/base.nix
  ];

  # WSL
  wsl = {
    defaultUser = "karsten";
    docker-desktop.enable = true;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      karsten = {
        imports = [
          ../../modules/home-manager/base.nix
          ../../users/karsten
        ];
      };
    };
    backupFileExtension = "hm";
  };

  # User
  users.users.karsten = {
    isNormalUser = true;
    description = "karsten";
    shell = pkgs.bash;
  };

  # VSCode
  environment.systemPackages = [
    pkgs.wget
  ];
  vscode-remote-workaround.enable = true;

  # Networking
  networking.hostName = "wsl";
}
