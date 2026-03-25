{ inputs, ... }:

{
  flake.modules.homeManager.dms =
    { config, ... }:
    {
      imports = [
        inputs.dms.homeModules.dank-material-shell
      ];

      programs.dank-material-shell = {
        enable = true;
        systemd = {
          enable = true;             # Systemd service for auto-start
          restartIfChanged = true;   # Auto-restart dms.service when dank-material-shell changes
        };
      };

      home.file.".config/DankMaterialShell" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/features/dms/config";
      };
    };
}