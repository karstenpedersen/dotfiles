{ ... }:

{
  flake.modules.homeManager.zed-editor =
    { ... }:
    {
      programs.zed-editor.enable = true;

      home.file."~/.config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dendritic-modules/config";
    };
}