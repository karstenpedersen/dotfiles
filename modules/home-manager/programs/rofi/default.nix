{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    pass = {
      enable = true;
      package = pkgs.rofi-pass-wayland;
      extraConfig = ''
        backend=wtype
        clipboard_backend=wl-clipboard
      '';
    };
    font = "Fira Mono 12";
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        background = mkLiteral "#000000"; 
        background-alt = mkLiteral "#1b1b1b";
        foreground = mkLiteral "#ffffff";
        foreground-alt = mkLiteral "#ffffff";
        primary = mkLiteral "#ffffff";

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        accent-color = mkLiteral "@foreground";

        margin = 0;
        padding = 0;
        spacing = 0;
        border = 0;

        width = mkLiteral "800px";
      };
      window = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        border = mkLiteral "2px";
        border-color = mkLiteral "@primary";
        border-radius = mkLiteral "3px";
        padding = mkLiteral "6px";
        transparency = "real";
      };
      mainbox = {
        children = mkLiteral "[inputbar, listview]";
      };
      inputbar = {
        text-color = mkLiteral "@foreground";
        background-color = mkLiteral "@background";
        padding = mkLiteral "8px 8px";
        spacing = mkLiteral "8px";
        children = mkLiteral "[prompt, entry]";
      };
      prompt = {
        text-color = mkLiteral "@foreground";
      };
      entry = {
        text-color = mkLiteral "@foreground-alt";
      };
      listview = {
        lines = 10;
        scrollbar = true;
      };
      scrollbar = {
        background-color = mkLiteral "@background-alt";
        handle-color = mkLiteral "@foreground-alt";
        margin-left = mkLiteral "6px";
        handle-width = mkLiteral "5px";
      };
      element = {
        text-color = mkLiteral "@foreground";
        padding = mkLiteral "6px 8px";
        spacing = mkLiteral "8px";
        children = mkLiteral "[element-text]";
      };
      "element selected" = {
        text-color = mkLiteral "@foreground-alt";
        background-color = mkLiteral "@background-alt";
      };
      element-text = {
        text-color = mkLiteral "inherit";
      };
    };
    extraConfig = {
      # show-icons = true;
      terminal = "kitty";
    };
  };
}
