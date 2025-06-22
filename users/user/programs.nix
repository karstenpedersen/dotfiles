{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/alacritty
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/zathura
    ./cli.nix
  ];

  home.packages = with pkgs; [
    discord
    zotero
    xournalpp
    bruno
    octaveFull
    godot_4
  ];
}
