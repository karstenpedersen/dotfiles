{ inputs, pkgs, vars, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/wsl/base.nix
  ];

  # WSL
  wsl = {
    defaultUser = vars.username;
    docker-desktop.enable = true;
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = {
      imports = [
        ../../modules/home-manager/base.nix
        ../../users/user/home.nix
      ];
    };
    backupFileExtension = "hm";
  };

  # User
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
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
