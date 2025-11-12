{ pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/alacritty
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/zathura
    ../../modules/home-manager/zed-editor
    ../../modules/home-manager/programs/emacs
    ./cli.nix
  ];

  home.packages = with pkgs; [
    discord
    zotero
    xournalpp
    bruno
    octaveFull
    godot_4
    freecad-wayland
  ];
}
