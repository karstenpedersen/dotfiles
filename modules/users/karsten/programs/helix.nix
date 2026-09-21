{ ... }:
{
  flake.wrappers.helix =
    { wlib, ... }:
    {
      imports = [ wlib.wrapperModules.helix ];

      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          color-modes = true;
          scrolloff = 8;
          mouse = false;
          cursorline = true;
          true-color = true;
          lsp.display-messages = true;
          trim-trailing-whitespace = true;
          statusline = {
            left = [
              "mode"
              "spinner"
              "version-control"
              "file-name"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            right = [
              "diagnostics"
              "selections"
              "register"
              "position"
              "file-encoding"
            ];
          };
          whitespace = {
            render = {
              space = "none";
              tab = "all";
            };
            characters = {
              space = "·";
              nbsp = "⍽";
              nnbsp = "␣";
              tab = "→";
              newline = "⏎";
              tabpad = "·";
            };
          };
          end-of-line-diagnostics = "hint";
          inline-diagnostics = {
            cursor-line = "warning";
            other-lines = "disable";
          };
        };
        keys = {
          normal = {
            x = "select_line_below";
            X = "select_line_above";
            # space.o = {
            #   o = ":oil";
            #   e = ":oil-enter";
            #   b = ":oil-back";
            #   g = ":oil-root";
            #   s = ":oil-save";
            #   r = ":oil-refresh";
            #   q = ":oil-close";
            #   h = ":oil-toggle-hidden";
            #   i = ":oil-toggle-git-ignored";
            #   m = {
            #     y = ":oil-yank";
            #     x = ":oil-cut";
            #     p = ":oil-paste";
            #     c = ":oil-clipboard-clear";
            #   };
            # };
          };
          select = {
            x = "select_line_below";
            X = "select_line_above";
          };
        };
      };
    };
}
