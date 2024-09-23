{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/programs/yazi
    ../../modules/home/programs/fzf
    ../../modules/home/programs/btop
    ../../modules/home/programs/git
    ../../modules/home/programs/lazygit
    ../../modules/home/programs/tmux
    ../../modules/home/programs/starship
    ../../modules/home/programs/direnv
    ../../modules/home/programs/nb
  ];

  home.packages = with pkgs; [
    cz-cli
    micro
    man-pages
    eza
    ripgrep
    ripgrep-all
    file
    fd
    pstree
    xxd
    git-ignore
    duf
    gawk
    unzip
    zip
    gnutar
    gnused
    sd
    gnupg
    trash-cli
    gh
    slides
    pre-commit

    tealdeer
    cheat

    # Containers
    podman
    podman-tui

    # Processors
    jq
    yq
  ];
}