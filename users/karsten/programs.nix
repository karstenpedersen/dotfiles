{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/alacritty
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/emacs
    ../../modules/home-manager/programs/firefox
    ./cli.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    spotify
    webcord
    zotero
    via
    xournalpp
    nextcloud-client
    obs-studio
    kdePackages.kdenlive
    kdePackages.dragon
    obsidian
  ];
}
