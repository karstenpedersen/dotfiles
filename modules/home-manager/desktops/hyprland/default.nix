{ inputs, pkgs, lib, config, ... }:

let
  startup = pkgs.pkgs.writeShellScriptBin "run" ''
    ${pkgs.mako}/bin/mako &
  '';

  cfg = config.custom.desktop.hyprland;
in
{
  imports = [
    ../../programs/rofi
  ];

  options.custom.desktop.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland desktop.";
    wallpaper = lib.mkOption {
      default = ../../../../assets/nix-wallpaper.png;
      type = lib.types.path;
      description = ''
        Path to desktop wallpaper.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpaper
      hyprpicker
      grimblast
      playerctl
      pamixer
      light
      mako
      hyprsome
    ];

    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${cfg.wallpaper}" ];
        wallpaper = [ ", ${cfg.wallpaper}" ];
      };
    };

    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = false;
          grace = 2;
          hide_cursor = true;
          immediate_render = true;
        };
        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
            noise = 0.0117;
            contrast = 0.5;
            brightness = 0.5;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          }
        ];
        input-field = [
          {
            size = "100, 100";
            position = "0, 0";
            monitor = "";
            # dots_center = true;
            dots_size = 0;
            dots_fade_time = 0;
            fade_on_empty = false;
            font_color = "rgb(0, 0, 0)";
            inner_color = "rgb(0, 0, 0)";
            outer_color = "rgb(255, 255, 255)";
            outline_thickness = 4;
            placeholder_text = "<i></i>";
            rounding = -1;
            shadow_passes = 1;
            hide_input = true;
          }
        ];
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      plugins = [
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];
      settings = {
        "$mod" = "SUPER";
        "$terminal" = "alacritty";
        "$launcher" = "rofi -show drun";

        exec-once = "${startup}/bin/run";
        monitor = [
          ", preferred, auto, 1"
        ];
        general = {
          gaps_in = 5;
          gaps_out = 8;
          border_size = 2;
          layout = "dwindle";
          allow_tearing = false;
        };
        input = {
          kb_layout = "us,dk";
          kb_options = "caps:escape,grp:toggle"; #,grp:alt_shift_toggle";
          follow_mouse = true;
          touchpad.natural_scroll = true;
          sensitivity = 0;
        };
        decoration = {
          rounding = 3;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
          };
        };
        master = {
          new_status = "master";
        };
        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.0";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        windowrule = [
          "workspace 8, title:WebCord"
          "noinitialfocus, title:WebCord"
          "workspace 9, title:Spotify"
          "noinitialfocus, title:Spotify"
          # "pin, xdragon"
          # "opacity 0.5, xdragon"
          # "move 8 100%-100, xdragon"
        ];
        windowrulev2 = [
          "bordersize 0, floating:0, onworkspace:w[tv1]"
          "rounding 0, floating:0, onworkspace:w[tv1]"
          "bordersize 0, floating:0, onworkspace:f[1]"
          "rounding 0, floating:0, onworkspace:f[1]"
        ];
        workspace = [
          "w[tv1], gapsout:0, gapsin:0"
          "f[1], gapsout:0, gapsin:0"
        ];
        bind = [
          "$mod, return, exec, $terminal"
          "$mod SHIFT, q, killactive"
          "$mod, s, exec, $launcher"
          "$mod SHIFT, c, exec, hyprpicker --format=hex -a"
          "$mod SHIFT, s, exec, grimblast copy area"
          "$mod CTRL, l, exec, hyprlock --immediate"
          ", Print, exec, grimblast copysave output ~/Pictures/Screenshots/\"\`date +\"%Y-%m-%d-%H%M%S\"\`\".png"
          "$mod, f, fullscreen"
          "$mod, u, focusurgentorlast"
          "$mod, tab, focuscurrentorlast"
          ", XF86AudioMicMute, exec, pamixer --default-source -t"
          ", XF86MonBrightnessDown,exec, light -U 20"
          ", XF86MonBrightnessUp, exec, light -A 20"
          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"

          # Windows
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
          "$mod CTRL SHIFT, h, resizeactive, -50 0"
          "$mod CTRL SHIFT, l, resizeactive, 50 0"
          "$mod CTRL SHIFT, k, resizeactive, 0 -50"
          "$mod CTRL SHIFT, j, resizeactive, 0 50"
          "$mod CTRL SHIFT, r, resizeactive, exact 50% 50%"

          # Scratchpad
          "$mod, 0, togglespecialworkspace, magic"
          "$mod SHIFT, 0, movetoworkspace, special:magic"
        ] ++
        # Workspaces
        (builtins.concatLists (builtins.genList
          (
            x:
            let
              ws = builtins.toString (x + 1);
            in
            [
              "$mod, ${ws}, split-workspace, ${ws}"
              "$mod CTRL, ${ws}, split-movetoworkspace, ${ws}"
              "$mod SHIFT, ${ws}, split-movetoworkspacesilent, ${ws}"
            ]
          )
          9));
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
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
        size = 9;
      };
    };
  };
}
