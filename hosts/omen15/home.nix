{ inputs, pkgs, ... }:

{
  imports = [
    ./programs.nix
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "codium";
    OPENER = "codium";
    TERM = "xterm-256color";
    TERMINAL = "alacritty";
    PAGER = "less";
    BROWSER = "chromium";
  };
}
