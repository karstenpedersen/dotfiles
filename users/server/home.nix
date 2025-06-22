{ vars, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/bash
    ../../modules/home-manager/programs/fzf
    ../../modules/home-manager/programs/btop
    ../../modules/home-manager/programs/git
    ../../modules/home-manager/programs/direnv
    ../../modules/home-manager/programs/k9s
    ../../modules/home-manager/programs/cava
    ../../modules/home-manager/programs/helix
    ../../modules/home-manager/programs/zellij
  ];

  home.packages = with pkgs; [
    devenv
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

    tealdeer

    age
    hyperfine

    acpi

    dive

    # Processors
    jq
    yq
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    sessionVariables = {
      EDITOR = "hx";
    };
  };
}
