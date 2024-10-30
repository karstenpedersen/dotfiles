{ pkgs, config, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      flavor.use = "catppuccin-mocha";
      manager = {
        show_hidden = true;
        show_symlink = true;
        scrolloff = 8;
      };
      preview = {
        tab_size = 2;
        wrap = "yes";
      };
      opener = {
        edit = [
          {
            run = "${pkgs.helix}/bin/helix '$@'";
            block = true;
            for = "unix";
          }
          {
            run = "${pkgs.vscode}/bin/code '$@'";
            block = true;
            for = "unix";
          }
        ];
        play = [
          {
            run = "${pkgs.kdePackages.dragon}/bin/dragon '$@'";
            orphan = true;
            for = "unix";
          }
        ];    
        open = [
          {
            run = "${pkgs.xdg-utils}/bin/xdg-open '$@'";
            desc = "Open";
          }
        ];
      };
      open = {
        rules = [
          { mime = "text/*"; use = "edit"; }
          { mime = "video/*"; use = "play"; }
          { name = "*.json"; use = "edit"; }
          { name = "*.html"; use = [ "open" "edit" ]; }
        ];
      };
    };
    keymap = {
      
    };
    # flavors = {
    #   catppuccin-mocha = ./flavors/catppuccin-mocha.yazi;
    # };
  };
  home.file = {
    # ".config/yazi/theme.toml".text = ''
    #   [flavor]
    #   use = "catppuccin-mocha"

    #   [opener]
    #   edit = [
    #     { run = 'hx $@', block = true, for = "unix" },
    #   ]
    #   open = [
    #     { run = 'xdg-open "$@"', desc = "Open" }
    #   ]
    # '';
    ".config/yazi/flavors".source = ./flavors;
  };
  programs.bash.initExtra = ''
    function yy() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
  '';
}
