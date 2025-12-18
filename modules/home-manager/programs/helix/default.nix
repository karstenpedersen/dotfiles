{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "term16_dark";
      editor = {
        line-number = "relative";
        scrolloff = 10;
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
      keys.insert = {
        "C-x" = "completion";
      };
    };
    extraPackages = with pkgs; [
      markdown-oxide
      nodePackages.bash-language-server
      dockerfile-language-server
      yaml-language-server
      docker-compose-language-service
      lua-language-server
      nil
      lldb
    ];
    languages = {
      language = [
        {
          name = "python";
          language-servers = [ "pylsp" "ruff" ];
          auto-format = true;
          scope = "source.python";
        }
        {
          name = "typescript";
          roots = [ "deno.json" "deno.jsonc" "package.json" ];
          file-types = [ "ts" "tsx" ];
          auto-format = true;
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "javascript";
          roots = [ "deno.json" "deno.jsonc" "package.json" ];
          file-types = [ "js" "jsx" ];
          auto-format = true;
          language-servers = [ "deno-lsp" ];
        }
        {
          name = "gleam";
          language-servers = [
            "gleam"
            "tailwindcss-ls"
          ];
          auto-format = true;
        }
      ];
      language-server = {
        ruff = {
          command = "ruff";
          args = ["server"];
        };
        pylsp.config.pylsp.plugins = {
          pylsp.mypy.enabled = true;
          pylsp.mypy.live_mode = true;
          rope_autoimport.enabled = true;
        };
        deno-lsp = {
          command = "deno";
          args = [ "lsp" ];
          config.deno.enable = true;
        };
        tailwindcss-ls = {
          command = "tailwindcss-language-server";
          args = [ "--stdio" ];
          config = {
            tailwindCSS = {
              includeLanguages = {
                gleam = "html";
              };
            };
          };
        };
      };
    };
  };
}
