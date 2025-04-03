{ ... }:
{
  imports = [
    ./programs.nix
    ./directories.nix
    ../../modules/home-manager/desktops/hyprland
    ../../modules/home-manager/services/kanshi
  ];

  # Enable Hyprland config
  custom.desktop.hyprland.enable = true;

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
