{ inputs, ... }:

{
  perSystem =
    { config, pkgs, ... }:
    let
      tomlFmt = pkgs.formats.toml { };
      log-command = ["log" "--reversed" "--no-pager" "-r" "all()" "-n" "20"];

      settings = {
        user = {
          name = "karsten";
          email = "karstenfp.all@gmail.com";
        };
        aliases = {
          l = log-command;
        };
        ui = {
          default-command = log-command;
        };
        snapshot = {
          max-new-file-size = "15MiB";
        };
      };
    in
    {
      packages.karsten-jujutsu = inputs.wrapper-modules.wrappers.jujutsu.wrap {
        inherit pkgs;
        env = {
          JJ_CONFIG = toString (tomlFmt.generate "jujutsu.toml" settings);
        };
      };
    };

  flake.wrapperModules.jujutsu =
    { config, lib, pkgs, ... }:
    {
      options.user = lib.mkOption {
        type = lib.types.
      };
    };
}