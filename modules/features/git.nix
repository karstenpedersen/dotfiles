{ config, ... }:
{
  flake.modules.homeManager.git = args: {
    programs.git = {
      enable = true;

      settings = {
        user = {
          name = config.flake.meta.users.karsten.name;
          email = config.flake.meta.users.karsten.email;
        };
        extraConfig = {
          init = {
            defaultBranch = "main";
          };
        };
      };
    };
  };
}