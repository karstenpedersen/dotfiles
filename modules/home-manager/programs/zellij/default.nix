{ config, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    exitShellOnExit = true;
  };
  home.file.".config/zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home-manager/programs/zellij/config";
}
