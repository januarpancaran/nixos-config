let
  brightnessNotifier = ''
    #!/usr/bin/env bash

    ICON_DIR="$HOME/.config/dunst/assets"

    function send_notification() {
      BRIGHTNESS=$(brightnessctl get)
      MAX_BRIGHTNESS=$(brightnessctl max)
      PERCENTAGE=$(("$BRIGHTNESS" * 100 / "$MAX_BRIGHTNESS"))
      dunstify -a "brightnessnotify" -u low -r 9994 -h int:value:"$PERCENTAGE" -i "$ICON_DIR/brightness-change.png" "Brightness: $PERCENTAGE%"
    }

    case $1 in
    up)
      brightnessctl set +5%
      send_notification
      ;;
    down)
      brightnessctl set 5%- --min-value=1
      send_notification
      ;;
    esac
  '';
in {
  home.file.".local/bin/brightnessnotify" = {
    text = brightnessNotifier;
    executable = true;
  };
}
