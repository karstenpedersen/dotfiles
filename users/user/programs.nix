{ pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/alacritty
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/zathura
    ../../modules/home-manager/programs/zed-editor
    ../../modules/home-manager/programs/emacs
    ../../modules/home-manager/programs/vesktop
    ../../modules/home-manager/programs/zen-browser
    ./cli.nix
  ];

  home.packages = with pkgs; [
    zotero
    xournalpp
    bruno
    inputs.quickshell.packages.${pkgs.system}.default
    prismlauncher
    kdePackages.dolphin
    telegram-desktop
    pureref
  ];
}
