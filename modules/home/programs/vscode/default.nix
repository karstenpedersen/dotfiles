{ pkgs, config, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      prisma.prisma
      haskell.haskell
      eamodio.gitlens
      mikestead.dotenv
      usernamehw.errorlens
      streetsidesoftware.code-spell-checker
      svelte.svelte-vscode
      esbenp.prettier-vscode
      bradlc.vscode-tailwindcss
      tomoki1207.pdf
      ms-python.python
      ms-azuretools.vscode-docker
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-vscode-remote.remote-ssh
      arrterian.nix-env-selector
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      gruntfuggly.todo-tree
      redhat.java
      vscjava.vscode-maven
      vscjava.vscode-java-test
      vscjava.vscode-java-dependency
      vscjava.vscode-java-debug
      golang.go
      bbenoist.nix
    ];
    userSettings = {
      "workbench.startupEditor" = "none";
      "workbench.sideBar.location" = "right";
      "workbench.editor.wrapTabs" = true;
      "explorer.compactFolders" = false;
      "editor.minimap.enabled" = false;
      "editor.folding" = false;
      "editor.scrollBeyondLastLine" = true;
      "editor.cursorSurroundingLines" = 8;
      "window.menuBarVisibility" = "toggle";
      "terminal.integrated.fontFamily" = "FiraMono";
      "errorLens.enabledDiagnosticLevels" = [ "error" "warning" ];
      "workbench.colorTheme" = "Catppuccin Mocha";
      "vim.useSystemClipboard" = true;
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "[nix]" = {
        "editor.tabSize" = 2;
      };
      "[svelte]" = {
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "svelte.svelte-vscode";
      };
      "[html]" = {
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[css]" = {
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascript]" = {
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[java]" = {
        "editor.tabSize" = 4;
      };
    };
  };
}
