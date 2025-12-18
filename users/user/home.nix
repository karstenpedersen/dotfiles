{ vars, ... }:

{
  imports = [    
    ./programs.nix
    ./directories.nix
    # ./../../modules/home-manager/desktops/hyprland
    ./../../modules/home-manager/desktops/niri
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "code";
      OPENER = "dolphin";
      TERM = "xterm-256color";
      TERMINAL = "alacritty";
      PAGER = "less";
      BROWSER = "zen";
    };
  };
}
