{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.starship = inputs.wrappers.wrappers.starship.wrap {
        inherit pkgs;
      };
    };
}