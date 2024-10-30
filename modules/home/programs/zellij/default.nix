{ config, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
  };
  home.file.".config/zellij".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/zellij/config";
}
