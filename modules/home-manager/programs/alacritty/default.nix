{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        padding = {
          x = 3;
        };
      };
      font = {
        normal = {
          family = "Fira Mono Nerd Font";
          style = "Medium";
        };
        bold = {
          family = "Fira Mono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Fira Mono Nerd Font";
          style = "MediumItalic";
        };
        size = 11;
      };
      env.term = "xterm-256color";
    };
  };
}
