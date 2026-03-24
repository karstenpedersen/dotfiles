{ self, inputs, ... }:

{
  flake.meta.users.karsten = {
    email = "karstenfp.all@gmail.com";
    name = "Karsten";
    username = "karsten";
  };

  flake.modules.nixos.karsten =
    { pkgs, ... }:
    {
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      users.users.${self.meta.users.karsten.username} = {
        isNormalUser = true;
        description = self.meta.users.karsten.username;
        shell = pkgs.nushell;
        initialPassword = "";
        extraGroups = [
          "wheel"
          "networkmanager"
          "dialout"
        ];
      };

      home-manager.users.${self.meta.users.karsten.username} = {
        imports = [
          self.modules.homeManager.base
          self.modules.homeManager.karsten
          self.modules.homeManager.mangowc
        ];

        home = {
          username = self.meta.users.karsten.username;
          homeDirectory = "/home/${self.meta.users.karsten.username}";
          sessionVariables = {
            EDITOR = "hx";
            VISUAL = "code";
            OPENER = "dolphin";
            TERM = "xterm-256color";
            TERMINAL = "alacritty";
            PAGER = "less";
            BROWSER = "zen";
          };
        };

        # xdg.userDirs = {
        #   enable = true;
        #   createDirectories = true;
        #   documents = "/home/documents";
        #   download = "/home/downloads";
        #   videos = "/home/videos";
        #   pictures = "/home/pictures";
        #   templates = null;
        #   desktop = null;
        #   music = "/home/music";
        #   publicShare = null;
        #   extraConfig = {
        #     XDG_REPOS_DIR = "/home/repos";
        #   };
        # };
      };

      nix.settings.trusted-users = [
        self.meta.users.karsten.username
      ];
    };
}
