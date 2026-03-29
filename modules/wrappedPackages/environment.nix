{ inputs, ... }:

{
  perSystem =
    { pkgs, self', ... }:
    {
      packages.karsten-terminal = inputs.wrapper-modules.alacritty.wrap {
        inherit pkgs;
        settings = {

        };
      };

      packages.karsten-environment = inputs.wrapper-modules.nushell.wrap {
        inherit pkgs;

      };
    };
}