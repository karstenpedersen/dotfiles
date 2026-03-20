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

        self.modules.homeManager.nixvim
        self.modules.homeManager.emacs
        self.modules.homeManager.zed-editor
      ];

      programs.alacritty.enable = true;
      programs.zen-browser = {
        enable = true;
        profiles.default = {
          search = {
            force = true;
            default = "ddg";
            engines = {
              mynixos = {
                name = "My NixOS";
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["@mynixos"];
                urls = [
                  {
                    template = "https://mynixos.com/search?q={searchTerms}";
                  }
                ];
              };
              nixpkgs = {
                name = "nixpkgs";
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["@nixpkgs"];
                urls = [
                  {
                    template = "https://search.nixos.org/packages?channel=unstable&query={searchTerms}";
                  }
                ];
              };
            };
          };
          extensions.packages =
            with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
                ublock-origin
                proton-pass
                zotero-connector
              ];
          settings = {
            browser = {
              tabs.warnOnClose = false;
              download.panel.shown = false;
            };
          };
          bookmarks = {
            force = true;
            settings = [
              {
                name = "SDU";
                toolbar = true;
                bookmarks = [
                  {
                    name = "sso";
                    url = "https://sso.sdu.dk";
                  }
                ];
              }
              {
                name = "Nix";
                toolbar = true;
                bookmarks = [
                  {
                    name = "homepage";
                    url = "https://nixos.org/";
                  }
                  {
                    name = "wiki";
                    tags = ["wiki" "nix"];
                    url = "https://wiki.nixos.org/";
                  }
                ];
              }
            ];
          };
        };
        policies = {
          AutofillAddressEnabled = true;
          AutofillCreditCardEnabled = false;
          DisableAppUpdate = true;
          DisableFeedbackCommands = true;
          DisableFirefoxStudies = true;
          DisablePocket = true;
          DisableTelemetry = true;
          DontCheckDefaultBrowser = true;
          # NoDefaultBookmarks = true;
          OfferToSaveLogins = false;
          EnableTrackingProtection = {
            Value = true;
            Locked = true;
            Cryptomining = true;
            Fingerprinting = true;
          };
        };
      };
      programs.bash.enable = true;
      programs.nushell.enable = true;
      programs.direnv.enable = true;
      programs.helix.enable = true;
      programs.zathura.enable = true;
      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        enableNushellIntegration = true;
        settings = {
          add_newline = true;
        };
      };
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
