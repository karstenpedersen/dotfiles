{ pkgs, ... }:

{
  imports = [
    ../../modules/home/programs/alacritty
    ../../modules/home/programs/vscode
    ../../modules/home/programs/emacs
    ./cli.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    spotify
    webcord
    zotero
    via
    chromium
    xournalpp
    nextcloud-client
    obs-studio
  ];
  # obs-studio.catppuccin.enable = true;
  # gtk.catppuccin.enable = true;
}
