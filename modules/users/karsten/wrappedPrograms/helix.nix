{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.helix = inputs.wrapper-modules.wrappers.helix.wrap {
        inherit pkgs;

        settings = {
          editor.line-number = "relative";
        };
      };
    };
}