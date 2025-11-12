{ pkgs, ... }:

let
  commonExtensions = with pkgs.vscode-extensions; [
    vscodevim.vim
    eamodio.gitlens
    mikestead.dotenv
    usernamehw.errorlens
    streetsidesoftware.code-spell-checker
    tomoki1207.pdf
    ms-vscode-remote.remote-ssh
    ms-vscode-remote.remote-containers
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
    gruntfuggly.todo-tree
    bbenoist.nix
    arrterian.nix-env-selector
    yzhang.markdown-all-in-one
    skellock.just
    ms-vscode.makefile-tools
    adpyke.codesnap
    redhat.vscode-yaml
    mkhl.direnv
    myriad-dreamin.tinymist
    ms-vsliveshare.vsliveshare
    myriad-dreamin.tinymist
  ];

  commonUserSettings = {
    "workbench.colorTheme" = "Catppuccin Mocha";
    "workbench.iconTheme" = "catppuccin-mocha";
    "workbench.startupEditor" = "none";
    "workbench.sideBar.location" = "right";
    "workbench.editor.wrapTabs" = true;
    "workbench.activityBar.location" = "hidden";
    "workbench.navigationControl.enabled" = false;
    "workbench.layoutControl.enabled" = false;
    "workbench.editor.editorActionsLocation" = "titleBar";
    "explorer.compactFolders" = false;
    "editor.minimap.enabled" = false;
    "editor.folding" = false;
    "editor.scrollBeyondLastLine" = true;
    "editor.cursorSurroundingLines" = 8;
    "editor.fontFamily" = "'Fira Mono'";
    "window.menuBarVisibility" = "toggle";
    "terminal.integrated.fontFamily" = "'FiraMono', monospace";
    "chat.commandCenter.enabled" = false;
    "chat.experimental.statusIndicator.enabled" = false;
    "errorLens.enabledDiagnosticLevels" = [
      "error"
      "warning"
    ];
    "vim.disableExtension" = true;
    "remote.SSH.experimental.chat" = false;
    "vim.useSystemClipboard" = true;
    "vim.hlsearch" = true;
    "vim.leader" = "<space>";
    "extensions.experimental.affinity" = {
      "vscodevim.vim" = 1;
    };
    "[nix]" = {
      "editor.tabSize" = 2;
    };
    "[typ]" = {
      "editor.formatOnSave" = true;
    };
  };
in
{
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    profiles = {
      default = {
        extensions = commonExtensions;
        userSettings = commonUserSettings;
      };
      unison = {
        extensions =
          with pkgs.vscode-extensions;
          [
            unison-lang.unison
            TomSherman.unison-ui
          ]
          ++ commonExtensions;
        userSettings = commonUserSettings ;
      };
      web = {
        extensions =
          with pkgs.vscode-extensions;
          [
            prisma.prisma
            svelte.svelte-vscode
            esbenp.prettier-vscode
            bradlc.vscode-tailwindcss
            astro-build.astro-vscode
          ]
          ++ commonExtensions;
        userSettings = {
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
        }
        // commonUserSettings;
      };
      golang = {
        extensions =
          with pkgs.vscode-extensions;
          [
            golang.go
            zxh404.vscode-proto3
          ]
          ++ commonExtensions;
        userSettings = {
          "editor.formatOnSave" = true;
        }
        // commonUserSettings;
      };
      java = {
        extensions =
          with pkgs.vscode-extensions;
          [
            redhat.java
            vscjava.vscode-maven
            vscjava.vscode-java-test
            vscjava.vscode-java-dependency
            vscjava.vscode-java-debug
          ]
          ++ commonExtensions;
        userSettings = {
          "[java]" = {
            "editor.tabSize" = 4;
          };
        }
        // commonUserSettings;
      };
      python = {
        extensions =
          with pkgs.vscode-extensions;
          [
            ms-python.python
            ms-toolsai.jupyter
            ms-toolsai.jupyter-keymap
            ms-toolsai.jupyter-renderers
            charliermarsh.ruff
          ]
          ++ commonExtensions;
        userSettings = {
          "[python]" = {
            "editor.formatOnSave" = true;
            "editor.defaultFormatter" = "charliermarsh.ruff";
            "editor.codeActionsOnSave" = {
              "source.fixAll" = "explicit";
              "source.organizeImports" = "explicit";
            };
          };
          "notebook.formatOnSave.enabled" = true;
          "notebook.codeActionsOnSave" = {
            "notebook.source.fixAll" = "explicit";
            "notebook.source.organizeImports" = "explicit";
          };
        }
        // commonUserSettings;
      };
      haskell = {
        extensions =
          with pkgs.vscode-extensions;
          [
            haskell.haskell
          ]
          ++ commonExtensions;
        userSettings = {
        }
        // commonUserSettings;
      };
      beam = {
        extensions =
          with pkgs.vscode-extensions;
          [
            # JakeBecker.elixir-ls
            elixir-lsp.vscode-elixir-ls
            phoenixframework.phoenix
            gleam.gleam
            svelte.svelte-vscode
            bradlc.vscode-tailwindcss
            esbenp.prettier-vscode
          ]
          ++ commonExtensions;
        userSettings = {
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
          "emmet.includeLanguages" = {
            "phoenix-heex" = "html";
          };
          "tailwindCSS.includeLanguages" = {
            "elixir" = "html";
            "phoenix-heex" = "html";
          };
        }
        // commonUserSettings;
      };
      agda = {
        extensions =
          with pkgs.vscode-extensions;
          [
            banacorn.agda-mode
            myriad-dreamin.tinymist
          ]
          ++ commonExtensions;
        userSettings = {
          "agdaMode.connection.paths" = [
            "/nix/store/hvca02q1sz40138cqgh98mp2igkl3mah-agdaWithPackages-2.8.0/bin/agda"
            "/nix/store/9qfdrq6g4y6344wxf1az8vw7i7z5s482-agdaWithPackages-2.8.0/bin/agda"
          ];
          "[typ]" = {
            "editor.formatOnSave" = true;
          };
        }
        // commonUserSettings;
      };
    };
  };
}
