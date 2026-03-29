{ self, inputs, ... }:

{
  flake.meta.users.karsten = {
    email = "karstenfp.all@gmail.com";
    name = "Karsten";
    username = "karsten";
    directory = "/home/karsten";
    extra = {
      currentSemester = "8-semester";
    };
  };

  flake.modules.nixos.karsten =
    { pkgs, ... }:
    let
      karsten = self.meta.users.karsten;
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

      hjem.users.${karsten.username} = {
        directory = karsten.directory;

        files.${karsten.extra.currentSemester}.source = "${karsten.directory}/repos/cs/8-semester";

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
          starship
          yazi
          yaziPlugins.piper
          jjui
          jujutsu
          zellij

          helix
          vscode
          zed-editor
          nixd
          color-lsp

          emacs

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
        ];
      };

      nix.settings.trusted-users = [
        karsten.username
      ];
    };
}
