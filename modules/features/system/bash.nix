{ ... }:

{
  flake.modules.nixos.bash =
    { pkgs, ... }:
    {
      programs.bash = {
        enable = true;

      };
    };
}
