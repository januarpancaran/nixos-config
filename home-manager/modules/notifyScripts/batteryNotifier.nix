let
  batteryNotifier = ''
    #!/usr/bin/env bash

    ICON_DIR="$HOME/.config/dunst/assets"

    export WAYLAND_DISPLAY=wayland-0
    export DBUS_SESSION_ADDRESS="unix:path=/run/user/1000/bus"

    WARNING_LEVEL=20
    BATTERY_DISCHARGING=$(acpi -b | grep -c "Discharging")
    BATTERY_LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    EMPTY_FILE="/tmp/batteryempty"
    FULL_FILE="/tmp/batteryfull"

    if [ "$BATTERY_DISCHARGING" -eq 1 ] && [ -f "$FULL_FILE" ]; then
      rm $FULL_FILE
    elif [ "$BATTERY_DISCHARGING" -eq 0 ] && [ -f "$EMPTY_FILE" ]; then
      rm $EMPTY_FILE
    fi

    if [ "$BATTERY_LEVEL" -gt 98 ] && [ "$BATTERY_DISCHARGING" -eq 0 ] && [ ! -f "$FULL_FILE" ]; then
      notify-send "Battery Charged" "Battery is fully charged." -i "$ICON_DIR/battery.png" -r 9991
      touch $FULL_FILE
    elif [ "$BATTERY_LEVEL" -le "$WARNING_LEVEL" ] && [ "$BATTERY_DISCHARGING" -eq 1 ] && [ ! -f "$EMPTY_FILE" ]; then
      notify-send "Low Battery" "$BATTERY_LEVEL% of battery remaining." -u critical -i "$ICON_DIR/battery-low.png"
      touch $EMPTY_FILE
    fi
  '';
in 
{
  home.file.".local/bin/batterynotify" = {
    text = batteryNotifier;
    executable = true;
  };
}
