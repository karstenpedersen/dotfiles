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
      keys.insert = {
        "C-x" = "completion";
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
      jdt-language-server
    ];
    languages = {
      language = [
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
