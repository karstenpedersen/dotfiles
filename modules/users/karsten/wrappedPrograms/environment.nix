{ inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.environment = inputs.wrapper-modules.lib.makeWrapper pkgs {
        wrapper = {

        };
      };
    };
}