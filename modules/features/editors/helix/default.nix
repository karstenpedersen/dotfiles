{ ... }:

{
  flake.modules.homeManager.helix =
    { config, ... }:
    {
      programs.helix = {
        enable = true;
      };
    };
}
