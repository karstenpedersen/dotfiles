{ self, inputs, ... }:

{
  flake.meta.users.karsten = {
    email = "karstenfp.all@gmail.com";
    name = "Karsten";
    username = "karsten";
    githubName = "Karsten Pedersen";
    directory = "/home/karsten";
    extra = {
      currentSemester = "9-semester";
    };
  };

  flake.modules.nixos.karsten =
    { pkgs, ... }:
    let
      karsten = self.meta.users.karsten;

      selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
    in
    {
      imports = [
        inputs.hjem.nixosModules.default
      ];

      users.users.${karsten.username} = {
        isNormalUser = true;
        description = karsten.username;
        shell = pkgs.bash;
        initialPassword = "";
        extraGroups = [
          "wheel"
          "networkmanager"
          "dialout"
          "podman"
          "docker"
          "plugdev"
        ];
      };

      hjem.users.${karsten.username} = {
        directory = karsten.directory;

        files.${karsten.extra.currentSemester}.source = "${karsten.directory}/repos/cs/9-semester";
        files.".bashrc" = {
          clobber = true;
          text = ''
            # Bail out for non-interactive shells
            [[ $- != *i* ]] && return

            eval "$(starship init bash)"

            eval "$(direnv hook bash)"

            export ZELLIJ_AUTO_ATTACH=true
            export ZELLIJ_AUTO_EXIT=true
            eval "$(zellij setup --generate-auto-start bash)"
          '';
        };

        xdg.config.files = {
          "mango".source = "${karsten.directory}/dotfiles/modules/users/karsten/programs/mango/config/";
          "DankMaterialShell".source =
            "${karsten.directory}/dotfiles/modules/users/karsten/programs/dms/config/";
          "zed".source = "${karsten.directory}/dotfiles/modules/users/karsten/programs/zed/config/";

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
          # Development
          selfpkgs.helix
          selfpkgs.yazi
          selfpkgs.starship
          selfpkgs.jujutsu
          selfpkgs.alacritty
          bash
          selfpkgs.zellij
          nushell
          direnv
          jjui
          croc
          selfpkgs.emacs
          vscode
          zed-editor
          nixd
          nil
          color-lsp
          gh
          television

          # Apps
          selfpkgs.zen
          keymapp
          kdePackages.dolphin
          chromium
          vesktop
          zotero
          zathura
          pureref
          aseprite
          obsidian

          # Databases
          duckdb
          sqlite
          dblab
          dbeaver-bin

          # Utils
          acpi
          pulsemixer
          pass
          gnupg
          pinentry-curses
          unzip
          zip
        ];
      };

      nix.settings.trusted-users = [
        karsten.username
      ];
    };
}
