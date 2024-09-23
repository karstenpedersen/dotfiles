{ config, lib, pkgs, ... }:

{
  imports = [
    ./programs.nix
  ];
  home = {
    username = "karsten";
    homeDirectory = "/home/karsten";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "codium";
      OPENER = "codium";
      TERM = "xterm-256color";
      TERMINAL = "alacritty";
      PAGER = "less";
      BROWSER = "chromium";
    };
  };
}