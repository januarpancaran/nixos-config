{pkgs, ...}: let
  user = "yuhshi";
  homeDir = "/home/${user}";
  script = "${homeDir}/.local/bin/chargingnotify";
  waylandDisplay = "wayland-0";
  dbus = "unix:path=/run/user/1000/bus";
in {
  services.udev.extraRules = ''
    ACTION=="change", SUBSYSTEM=="power_supply", ATTRS{type}=="Mains", ATTRS{online}=="1", ENV{WAYLAND_DISPLAY}="${waylandDisplay}", ENV{DBUS_SESSION_BUS_ADDRESS}="${dbus}" RUN+="${pkgs.su}/bin/su ${user} -c '${script} 1'"
    ACTION=="change", SUBSYSTEM=="power_supply", ATTRS{type}=="Mains", ATTRS{online}=="0", ENV{WAYLAND_DISPLAY}="${waylandDisplay}", ENV{DBUS_SESSION_BUS_ADDRESS}="${dbus}" RUN+="${pkgs.su}/bin/su ${user} -c '${script} 0'"
  '';
}
