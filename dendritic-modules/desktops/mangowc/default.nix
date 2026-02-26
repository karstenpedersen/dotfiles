{ inputs, ... }:
{
  flake.modules.nixos.mangowc =
    { config, pkgs, ... }:
    {
      imports = [
        inputs.mangowc.nixosModules.mango
      ];
      programs.mango = {
        enable = true;
        addLoginEntry = true;
      };
      security.polkit.enable = true;
      services.displayManager.ly.enable = true;
      # services.gnome.gnome-keyring.enable = true;
      # services.displayManager.sddm.enable = true;
      # services.displayManager.sddm.wayland.enable = true;
    };

  flake.modules.homeManager.mangowc =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        mako
        grim
        rofi
        foot
        wlr-randr
      ];

      home.file.".config/mango/config.conf" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dendritic-modules/desktops/mangowc/config.conf";
      };

      home.pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 16;
      };

      gtk = {
        enable = true;

        theme = {
          package = pkgs.flat-remix-gtk;
          name = "Flat-Remix-GTK-Grey-Darkest";
        };

        iconTheme = {
          package = pkgs.adwaita-icon-theme;
          name = "Adwaita";
        };

        font = {
          name = "Sans";
          size = 11;
        };
      };
    };
}