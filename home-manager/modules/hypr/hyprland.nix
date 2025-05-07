{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    package = pkgs.hyprland;
    enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [
        ", preferred, auto, 1"
      ];

      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi";
      "$browser" = "firefox";

      exec-once = [
        "waybar"
        "dunst"
        "hyprpaper"
        "hypridle"
        "systemctl start --user polkit-gnome-authentication-agent-1.service"
      ];

      env = [
        "XCURSOR_THEME, Bibata-Modern-Classic"
        "XCURSOR_SIZE, 24"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "QT_QPA_PLATFORMTHEME, qt6ct"
        "QT_QPA_PLATFORM, wayland;xcb"
        "GDK_BACKEND, wayland,x11,*"
        "ELECTRON_OZONE_PLATFORM_HINT, wayland"
        "NIXOS_OZONE_WL, 1"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;

        "col.active_border" = "rgba(cba6f7ff) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint, 0.23, 1, 0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear, 0, 0, 1, 1"
          "almostLinear, 0.5, 0.5, 0.75, 1.0"
          "quick, 0.15, 0, 0.1, 1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "ctrl:nocaps";
        kb_rules = "";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = true;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      "$mainMod" = "SUPER";
      "$monitor" = "$(hyprctl monitors | grep \"Monitor\" | awk '{print $2}')";

      bind =
        [
          # Shortcuts
          "$mainMod, T, exec, $terminal"
          "$mainMod, Q, killactive"
          "$mainMod, M, exit"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating"
          "$mainMod, R, exec, $menu -show drun"
          "Alt, Tab, exec, $menu -show window"
          "$mainMod, P, pseudo"
          "$mainMod, J, togglesplit"
          "$mainMod, F, fullscreen"
          "$mainMod, B, exec, $browser"
          "$mainMod, I, exec, $browser --private-window"
          "$mainMod, C, exec, env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
          "$mainMod, SemiColon, exec, spotify"
          "$mainMod, D, exec, discord"
          "$mainMod, O, exec, obs"
          "$mainMod, L, exec, wlogout"
          "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/ -f Screenshot_$(date +'%Y%m%d_%H%M%S').png -t 2000"
          "$mainMod, Print, exec, hyprshot -m window -m active -o ~/Pictures/Screenshots/ -f Screenshot_$(date +'%Y%m%d_%H%M%S').png -t 2000"
          ", Print, exec, hyprshot -m window -m active -t 2000 --clipboard-only"
          "SHIFT, Print, exec, hyprshot -m output -m active -o ~/Pictures/Screenshots/ -f Screenshot_$(date +'%Y%m%d_%H%M%S').png -t 2000"

          # Move Focus
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          # Special Workspaces
          "$mainMod, S, togglespecialworkspace, magic"

          # Scroll Workspaces
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ]
        ++ (
          # Workspaces
          builtins.concatLists (builtins.genList (i: let
              ws = i + 1;
            in [
              "$mainMod, code:1${toString i}, workspace, ${toString ws}"
              "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ])
            10)
        );

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Brightness and Volume
      bindel = [
        ", XF86AudioRaiseVolume, exec, ~/.local/bin/volumenotify up"
        ", XF86AudioLowerVolume, exec, ~/.local/bin/volumenotify down"
        ", XF86AudioMute, exec, ~/.local/bin/volumenotify mute"
        ", XF86MonBrightnessUp, exec, ~/.local/bin/brightnessnotify up"
        ", XF86MonBrightnessDown, exec, ~/.local/bin/brightnessnotify down"
      ];

      # Playerctl
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
        "opacity 0.0 override, class:^(xwaylandvideobridge)$"
        "noanim, class:^(xwaylandvideobridge)$"
        "noinitialfocus, class:^(xwaylandvideobridge)$"
        "maxsize 1 1, class:^(xwaylandvideobridge)$"
        "noblur, class:^(xwaylandvideobridge)$"
        "nofocus, class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
