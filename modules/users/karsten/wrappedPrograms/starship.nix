{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
        inherit pkgs;
      };
    };
}