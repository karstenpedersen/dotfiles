{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/bash
    ../../modules/home-manager/programs/yazi
    ../../modules/home-manager/programs/fzf
    ../../modules/home-manager/programs/btop
    ../../modules/home-manager/programs/git
    ../../modules/home-manager/programs/lazygit
    ../../modules/home-manager/programs/tmux
    ../../modules/home-manager/programs/starship
    ../../modules/home-manager/programs/direnv
    ../../modules/home-manager/programs/nb
    ../../modules/home-manager/programs/skim
    ../../modules/home-manager/programs/k9s
    ../../modules/home-manager/programs/cava
    ../../modules/home-manager/programs/global
    ../../modules/home-manager/programs/helix
    ../../modules/home-manager/programs/zellij
    ../../modules/home-manager/programs/nb
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
    strace
    bpftrace
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
    calc
    wl-clipboard
    ffmpegthumbnailer
    xdg-utils

    tealdeer
    cheat
    graph-easy

    age
    hyperfine
    lolcat

    # Containers
    podman
    podman-tui
    lazydocker
    dive

    # Processors
    jq
    yq
  ];
}
