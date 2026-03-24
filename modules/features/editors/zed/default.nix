{ ... }:

{
  flake.modules.homeManager.zed-editor =
    { config, ... }:
    {
      programs.zed-editor.enable = true;

      home.file.".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/features/zed/config";
    };
}
