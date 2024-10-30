{ ... }:

{
  imports = [
    ../../modules/home/window-managers/hyprland
    ./programs.nix
  ];

  desktop.hyprland.enable = true;

  home = {
    username = "karsten";
    homeDirectory = "/home/karsten";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "code";
      OPENER = "dolphin";
      TERM = "xterm-256color";
      TERMINAL = "alacritty";
      PAGER = "less";
      BROWSER = "firefox";
    };
  };
}
