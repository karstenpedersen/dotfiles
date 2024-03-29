{ config, pkgs, outputs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/hypr
    ../../modules/home-manager/programs/lf
    ../../modules/home-manager/programs/git
    ../../modules/home-manager/programs/git
    ../../modules/home-manager/programs/bash
    ../../modules/home-manager/programs/starship
    ../../modules/home-manager/programs/kitty
    ../../modules/home-manager/programs/nixvim
    ../../modules/home-manager/programs/btop
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/rofi
    ../../modules/home-manager/programs/firefox
    ../../modules/home-manager/programs/waybar
    ../../modules/home-manager/programs/zathura
    ../../modules/home-manager/programs/swaylock
    ../../modules/home-manager/programs/zoxide
    ../../modules/home-manager/programs/lazygit
    ../../modules/home-manager/programs/bat
    ../../modules/home-manager/programs/direnv
    ../../modules/home-manager/programs/kakoune
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
      })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # bug: https://github.com/nix-community/home-manager/issues/2942
    };
  };

  # Packages
  home.packages = with pkgs; [
    libnotify
    devbox
    man-pages
    pass
    gnupg
    xdragon
    pistol
    ripgrep
    fzf
    eza
    fd
    gnused
    jq
    gawk
    pstree
    hyprpicker
    wl-clipboard
    pipewire
    wireplumber
    polkit-kde-agent
    pamixer
    light
    playerctl
    grimblast
    wtype
    swayidle
    unzip
    zip
    gnutar
    pdftk
    python3
    lazydocker
    pandoc
    sshfs
    bpftrace

    # Android
    android-tools

    # Applications
    zotero
    obsidian-wayland
    rnote
    discord
    webcord
    spotify
    nextcloud-client
    pavucontrol
    xournalpp
    godot_4
    aseprite
    geogebra
    chromium
    anki-bin
    obs-studio
    libsForQt5.kdenlive
    libsForQt5.dragon

    # Games
    rogue
    prismlauncher
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];

  # Mime types
  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "text/*" = [ "nvim.desktop" ];
  #     "application/pdf" = [ "zathura.desktop" ];
  #   };
  # };
}
