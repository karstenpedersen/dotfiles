{ pkgs, ... }:
{
  imports = [
    ../../modules/home-manager/programs/alacritty
    ../../modules/home-manager/programs/vscode
    ./cli.nix
  ];

  home.packages = with pkgs; [
    spotify
    webcord
    zotero
    xournalpp
    nextcloud-client
    obs-studio
    kdePackages.kdenlive
    kdePackages.dragon
    obsidian
    bruno
    prismlauncher
    # hyprland
    octaveFull
    wdisplays
    godot_4
  ];
}
