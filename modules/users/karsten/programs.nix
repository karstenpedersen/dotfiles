{ self, inputs, config, ... }:

{
  flake.modules.nixos.karsten = {
    imports = [
      self.modules.nixos.emacs
    ];
  };

  flake.modules.homeManager.karsten =
    { pkgs, ... }:
    {
      imports = [
        inputs.zen-browser.homeModules.twilight

        self.modules.homeManager.zed
        self.modules.homeManager.zen
        self.modules.homeManager.helix
        self.modules.homeManager.nushell
        self.modules.homeManager.emacs
        self.modules.homeManager.starship
      ];

      programs.alacritty.enable = true;
      programs.bash.enable = true;
      programs.direnv.enable = true;
      programs.zathura.enable = true;
      programs.vscode.enable = true;

      home.packages = with pkgs; [
        kdePackages.dolphin
        chromium
        zotero
        pureref
        obsidian
        vesktop

        unzip
        zip
        duckdb
        sqlite

        acpi
        pulsemixer

        devenv
      ];
    };
}
