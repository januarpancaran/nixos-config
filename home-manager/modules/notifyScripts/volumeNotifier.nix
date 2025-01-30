let
  volumeNotifier = ''
    #!/usr/bin/env bash

    ICON_DIR="$HOME/.config/dunst/assets"

    function send_notification() {
      VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
      dunstify -a "volumenotify" -u low -r 9993 -h int:value:"$VOLUME" -i "$1" "Volume: $VOLUME%" -t 2000
    }

    case $1 in
    up)
      wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      send_notification "$ICON_DIR/volume-change.png"
      ;;
    down)
      wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      send_notification "$ICON_DIR/volume-change.png"
      ;;
    mute)
      wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED; then
        dunstify -i "$ICON_DIR/volume-mute.png" -a "volumenotify" -t 2000 -r 9993 -u low "Muted"
      else
        send_notification "$ICON_DIR/volume-change.png"
      fi
      ;;
    esac
  '';
in
{
  home.file.".local/bin/volumenotify" = {
    text = volumeNotifier;
    executable = true;
  };
}
