{ inputs, ... }:

{
  flake.modules.nixos.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
        # withUWSM = true;
      };
      security.polkit.enable = true;
      # services.displayManager.sddm.enable = true;
      # services.displayManager.sddm.wayland.enable = true;
    };

  flake.modules.homeManager.hyprland =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        hyprpicker
        hyprpaper
        mako
        grimblast
        rofi
        slurp
        wl-clipboard
      ];

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = false;
        plugins = with pkgs.hyprlandPlugins; [
          hyprsplit
        #   hyprspace
        ];
        settings = {
          "$mod" = "SUPER";
          "$terminal" = "alacritty";
          "$launcher" = "rofi -show drun";

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
            repeat_rate = 20;
            repeat_delay = 200;
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
            "match:title vesktop, workspace 8"
            "match:title vesktop, no_initial_focus on"
            # "pin, xdragon"
            # "opacity 0.5, xdragon"
            # "move 8 100%-100, xdragon"
          ];
          # windowrulev2 = [
          #   "bordersize 0, floating:0, onworkspace:w[tv1]"
          #   "rounding 0, floating:0, onworkspace:w[tv1]"
          #   "bordersize 0, floating:0, onworkspace:f[1]"
          #   "rounding 0, floating:0, onworkspace:f[1]"
          # ];
          workspace = [
            "w[tv1], gapsout:0, gapsin:0"
            "f[1], gapsout:0, gapsin:0"
          ];
          plugin.hyprsplit.persistent_workspaces = true;
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

            # Hyprspace
            # "$mod, o, overview:toggle, all"

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
                "$mod, ${ws}, workspace, ${ws}"
                "$mod CTRL, ${ws}, movetoworkspace, ${ws}"
                "$mod SHIFT, ${ws}, movetoworkspacesilent, ${ws}"
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
          size = 11;
        };
      };
    };
}