{ config, ... }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "${config.home.homeDirectory}/documents";
    download = "${config.home.homeDirectory}/downloads";
    videos = "${config.home.homeDirectory}/videos";
    pictures = "${config.home.homeDirectory}/pictures";
    templates = null;
    desktop = null;
    music = null;
    publicShare = null;
    extraConfig = {
      XDG_REPOS_DIR = "${config.home.homeDirectory}/repos";
    };
  };
}
