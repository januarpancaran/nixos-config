{
  systemd.user.services = {
    batterynotify = {
      Unit = {
        Description = "Battery notification service";
      };

      Service = {
        ExecStart = "%h/.local/bin/batterynotify";
      };
    };

    trash-empty = {
      Unit = {
        Description = "Empty trash older than 30 days";
      };

      Service = {
        ExecStart = "/sbin/trash-empty 30";
      };
    };
  };
}
