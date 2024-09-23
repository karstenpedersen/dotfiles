{ pkgs, ... }:

{
  imports = [
    ../../modules/home/programs/vscode
    ../../modules/home/programs/alacritty
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
  ];
}
