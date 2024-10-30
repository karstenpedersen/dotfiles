{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/programs/bash
    ../../modules/home/programs/yazi
    ../../modules/home/programs/fzf
    ../../modules/home/programs/btop
    ../../modules/home/programs/git
    ../../modules/home/programs/lazygit
    ../../modules/home/programs/tmux
    ../../modules/home/programs/starship
    ../../modules/home/programs/direnv
    ../../modules/home/programs/nb
    ../../modules/home/programs/skim
    ../../modules/home/programs/k9s
    ../../modules/home/programs/cava
    ../../modules/home/programs/global
    ../../modules/home/programs/helix
    ../../modules/home/programs/zellij
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
