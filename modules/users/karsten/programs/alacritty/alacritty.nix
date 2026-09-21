{ inputs, ... }:

{
  perSystem =
    { pkgs, ... }:
    {
      packages.alacritty = inputs.wrappers.wrappers.alacritty.wrap {
        inherit pkgs;

        settings = {
          general.import = [
            "~/.config/alacritty/dank-theme.toml"
          ];
        };
      };
    };
}
