{ pkgs, ... }:

{
  imports = [
    ../../modules/home/programs/alacritty
    ../../modules/home/programs/vscode
    ../../modules/home/programs/emacs
    ../../modules/home/programs/firefox
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
  # obs-studio.catppuccin.enable = true;
  # gtk.catppuccin.enable = true;
}
