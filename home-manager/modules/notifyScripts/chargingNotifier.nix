let
  chargingNotifier = ''
    #!/usr/bin/env bash

    ICON_DIR="$HOME/.config/dunst/assets"

    export WAYLAND_DISPLAY=wayland-0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

    BATTERY_CHARGING=$1
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    if [ "$BATTERY_CHARGING" -eq 1 ]; then
      notify-send "Charging" "$BATTERY_LEVEL% of battery charged." -u low -i "$ICON_DIR/battery-charging.png" -t 5000 -r 9991
    elif [ "$BATTERY_CHARGING" -eq 0 ]; then
      notify-send "Discharging" "$BATTERY_LEVEL% of battery remaining." -u low -i "$ICON_DIR/battery.png" -t 5000 -r 9991
    fi
  '';
in
{
  home.file.".local/bin/chargingnotify" = {
    text = chargingNotifier;
    executable = true;
  };
}
