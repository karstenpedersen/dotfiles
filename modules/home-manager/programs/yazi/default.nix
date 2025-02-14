{ ... }:

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
            run = "\${EDITOR:-vi} \"$@\"";
            block = true;
            for = "unix";
            desc = "Edit using \${EDITOR:-vi}";
          }
          {
            run = "\${VISUAL:-code} \"$@\"";
            block = true;
            for = "unix";
            desc = "Visual Editor";
          }
        ];
        play = [
          {
            run = "dragon \"$@\"";
            orphan = true;
            for = "unix";
            desc = "Play";
          }
        ];
        open = [
          {
            run = "xdg-open \"$1\"";
            desc = "Open";
            for = "linux";
          }
        ];
      };
      open = {
        rules = [
          { mime = "text/*"; use = "edit"; }
          { mime = "video/*"; use = "play"; }
          { mime = "image/*"; use = "open"; }
          { name = "*.json"; use = "edit"; }
          { name = "*.html"; use = [ "edit" ]; }
          { name = "*/javascript"; use = [ "edit" ]; }
          { name = "*"; use = [ "open" ]; }
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [ 
        {
          on = [ "g" "d" ];
          run = "cd ~/downloads";
          desc = "Go to downloads";
        }
        {
          on = [ "g" "D" ];
          run = "cd ~/documents";
          desc = "Go to documents";
        }
        {
          on = [ "g" "." ];
          run = "cd ~/dotfiles";
          desc = "Go to dotfiles";
        }
        {
          on = [ "g" "r" ];
          run = "cd ~/repos";
          desc = "Go to repos";
        }
      ];
    };
  };
  home.file = {
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
