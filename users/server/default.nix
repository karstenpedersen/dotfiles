{ inputs, config, pkgs, vars, ... }:

{
  sops.secrets."${vars.username}-password".neededForUsers = true;
  users.mutableUsers = false;

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = {
      imports = [
        ../../modules/home-manager/base.nix
        ./home.nix
      ];
    };
    openssh.authorizedKeys.keys = [
      "TODO"
    ];
    shell = pkgs.bash;
    backupFileExtension = "hm";
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  # User account
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
    hashedPasswordFile = config.sops.secrets."${vars.username}-password".path;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };
}
