{ pkgs, config, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      simplified_ui = true;
      theme = "catppuccin-mocha";
      pane_frames = true;
      ui.pane_frames = {
        hide_prefix = true;
        hide_session_name = false;
        rounded_corners = false;
      };
      scrollback_editor = "${pkgs.helix}";
    };
  };
  home.file.".config/zellij/themes/" = {
    source = ./themes;
    recursive = true;
  };
  home.file.".config/zellij/layouts/" = {
    source = ./layouts;
    recursive = true;
  };
}
