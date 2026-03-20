{ inputs, ... }:
{
  flake.modules.nixos.mangowc =
    { config, pkgs, ... }:
    {
      imports = [
        inputs.mangowc.nixosModules.mango
        # config.flake.modules.nixos.wayland
      ];

      programs.mango = {
        enable = true;
      };

      security.polkit.enable = true;
      services.displayManager.ly.enable = true;
      services.gnome.gnome-keyring.enable = true;
    };

  flake.modules.homeManager.mangowc =
    { config, pkgs, ... }:
    {
      home.packages = with pkgs; [
        mako
        grim
        rofi
        wlr-randr
        slurp
        wl-clipboard
        cliphist
        wl-clip-persist
        swaybg
        hyprpicker
        waybar
        brightnessctl
        wireplumber
        wev
      ];

      home.file.".config/mango" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dendritic-modules/desktops/mangowc/config";
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