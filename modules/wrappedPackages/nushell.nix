{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.karsten-nushell = inputs.wrapper-modules.nushell.wrap {
        inherit pkgs;
        "config.nu".content = ''

        '';
        "env.nu".content = ''

        '';
      };
    };
}