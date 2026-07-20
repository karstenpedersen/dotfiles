{ self, inputs, ... }:

{
  flake.meta.users.karsten = {
    email = "karstenfp.all@gmail.com";
    name = "Karsten";
    username = "karsten";
    githubName = "Karsten Pedersen";
    directory = "/home/karsten";
    extra = {
      currentSemester = "8-semester";
    };
  };

  flake.modules.nixos.karsten =
    { pkgs, ... }:
    let
      karsten = self.meta.users.karsten;

      selfpkgs = self.packages."${pkgs.system}";

      myEmacs = pkgs.emacs.pkgs.withPackages (epkgs: with epkgs; [
        evil
        evil-surround
        use-package
        evil-collection
        undo-tree
        envrc
        magit
        pdf-tools
        go-mode
        templ-ts-mode
        web-mode
        svelte-mode
        rjsx-mode
        agda2-mode
        gleam-ts-mode
        elixir-ts-mode
        erlang-ts
        uv-mode
        python-mode
      ]);

      emacsInitConfig = ''
        ;; Modes
        ;; (menu-bar-mode 0)
        ;; (tool-bar-mode 0)
        (scroll-bar-mode 0)
        (blink-cursor-mode 0)

        (column-number-mode 1)
        (show-paren-mode 1)

        ;; Disable startup screens
        (setq inhibit-startup-screen t)
        (setq inhibit-startup-echo-area-message t)
        (setq inhibit-splash-screen t)
        (setq inhibit-startup-buffer-menu t)

        ;; Line numbers
        (global-display-line-numbers-mode 1)
        (setq display-line-numbers-type 'relative)

        ;; Disable line numbers for some modes
        (dolist (mode '(org-mode-hook
                        term-mode-hook
                        eshell-mode-hook))
          (add-hook mode (lambda () (display-line-numbers-mode 0))))

        ;; Window
        (setq frame-resize-pixelwise t)
        (setq window-resize-pixelwise nil)

        ;; Initialise installed packages at this early stage, by using the available cache.
        (setq package-enable-at-startup t)

        ;; Evil
        (use-package evil
          :init
          (setq evil-want-integration t)
          (setq evil-want-keybinding nil)
          (setq evil-want-C-u-scroll t)
          (setq evil-want-C-i-jump t)
          (setq evil-want-fine-undo t)
          (setq evil-want-Y-yank-to-eol t)
          :config
          (evil-set-initial-state 'debugger-mode 'motion)
          (evil-set-initial-state 'pdf-view-mode 'motion)
          (evil-set-initial-state 'term-mode 'emacs)
          (evil-set-initial-state 'calc-mode 'emacs)
          (evil-set-undo-system 'undo-tree)
          (evil-mode))

        (use-package evil-surround
          :after evil
          :defer 2
          :config
          (global-evil-surround-mode 1))

        (use-package evil-collection
          :after evil
          :config
          (evil-collection-init))

        ;; Dired
        (use-package dired
          :config
            (evil-collection-define-key 'normal 'dired-mode-map
            "h" 'dired-up-directory
            "l" 'dired-find-file))
      '';
    in
    {
      imports = [
        inputs.hjem.nixosModules.default

        self.modules.nixos.emacs
      ];

      users.users.${karsten.username} = {
        isNormalUser = true;
        description = karsten.username;
        shell = pkgs.nushell;
        initialPassword = "";
        extraGroups = [
          "wheel"
          "networkmanager"
          "dialout"
        ];
      };

      nixpkgs.config.permittedInsecurePackages = [
        "ventoy-1.1.12"
      ];

      hjem.users.${karsten.username} = {
        directory = karsten.directory;

        files.${karsten.extra.currentSemester}.source = "${karsten.directory}/repos/cs/8-semester";

        files.".emacs".text = emacsInitConfig;

        xdg.config.files = {
          "mango".source = "${karsten.directory}/dotfiles/modules/users/karsten/configs/mango";
          "DankMaterialShell".source = "${karsten.directory}/dotfiles/modules/users/karsten/configs/dms";
          "zed".source = "${karsten.directory}/dotfiles/modules/users/karsten/configs/zed";
          "alacritty".source = "${karsten.directory}/dotfiles/modules/users/karsten/configs/alacritty";

          "user-dirs.dirs".text = ''
            XDG_DOWNLOAD_DIR="$HOME/downloads"
            XDG_DOCUMENTS_DIR="$HOME/documents"
            XDG_MUSIC_DIR="$HOME/music"
            XDG_PICTURES_DIR="$HOME/pictures"
            XDG_VIDEOS_DIR="$HOME/videos"

            XDG_NOTES_DIR="$HOME/documents/my-vault"
            XDG_PROJECTS_DIR="$HOME/repos"
          '';
        };

        packages = with pkgs; [
          alacritty
          nushell
          bash
          direnv
          # starship
          # yazi
          yaziPlugins.piper
          jjui
          # jujutsu
          zellij
          pgmodeler
          croc

          godot-mono
          # dotnet-sdk
          # dotnet-sdk_10

          (with pkgs.dotnetCorePackages; combinePackages [
            sdk_8_0
            sdk_10_0
          ])
          aseprite
          csharp-ls

          selfpkgs.helix
          selfpkgs.yazi
          selfpkgs.starship
          selfpkgs.jujutsu
          selfpkgs.zen
          vscode
          lmstudio
          zed-editor
          nixd
          color-lsp

          # emacs
          myEmacs

          kdePackages.dolphin
          chromium
          zotero
          pureref
          obsidian
          vesktop
          zathura

          unzip
          zip
          duckdb
          sqlite

          acpi
          pulsemixer

          devenv

          pass
          gnupg
          pinentry-curses

          ventoy
        ];
      };

      nix.settings.trusted-users = [
        karsten.username
      ];
    };
}
