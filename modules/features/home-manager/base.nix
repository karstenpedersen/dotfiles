{ config, inputs, ... }:
{
  flake.modules.homeManager.base = args: {
    imports = [
      (
        { osConfig, ... }:
        {
          home.stateVersion = osConfig.system.stateVersion;
        }
      )
      config.flake.modules.homeManager.fonts
    ];

    programs.home-manager.enable = true;
  };
}