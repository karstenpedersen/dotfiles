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
    element-desktop
    signal-desktop
    zotero
    via
    xournalpp
    nextcloud-client
    obs-studio
    kdePackages.kdenlive
    kdePackages.dragon
    obsidian
    bruno
    prismlauncher
    hyprland
    octaveFull
  ];

  services.mpris-proxy.enable = true;
}
