{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        scrolloff = 8;
        whitespace = {
          render = {
            # space = "all";
            tab = "all";
          };
        };
        soft-wrap = {
          enable = true;
        };
        true-color = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
        cursorline = true;
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
            "version-control"
          ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "file-encoding"
          ];
          mode.normal = "N";
          mode.insert = "I";
          mode.select = "S";
        };
        indent-guides = {
          enable = true;
        };
      };      
    };
    extraPackages = with pkgs; [
      markdown-oxide
      texlab
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.svelte-language-server
      haskell-language-server
      dockerfile-language-server-nodejs
      yaml-language-server
      docker-compose-language-service
      gopls
      golangci-lint-langserver
      lua-language-server
      nil
      rust-analyzer
      templ
      buf-language-server
      jdt-language-server
    ];
    languages = {
      
    };
  };
  # home.file.".config/helix/hemux.sh".source = ''
  #   #!/usr/bin/env bash

  #   PANES=$(tmux list-panes | wc -l)
  #   # echo $PANES
  #   if [ "$PANES" -gt 1 ]
  #     then
  #       tmux send-keys -t 2 $1 Enter
  #     else
  #       tmux split-window -h
  #       tmux send $1 Enter
  #   fi
  #   echo "$1" > /tmp/prev-tmux-command
  # '';
}
