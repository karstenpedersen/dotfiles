{ ... }:

{
  flake.modules.homeManager.zed =
    { config, ... }:
    {
      programs.zed-editor.enable = true;

      home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/features/editors/zed/config";
    };
}
