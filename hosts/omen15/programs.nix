{ pkgs, ... }:

{
  imports = [
    ../../modules/home/programs/vscode
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
