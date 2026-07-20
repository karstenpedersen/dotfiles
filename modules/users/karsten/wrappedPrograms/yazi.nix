{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.yazi = inputs.wrapper-modules.wrappers.yazi.wrap {
        inherit pkgs;
      };
    };
}