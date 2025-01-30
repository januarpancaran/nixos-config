{
  systemd.user.timers = {
    batterynotify = {
      Unit = {
        Description = "Run battery notification service every 5 minutes";
      };

      Timer = {
        OnCalendar = "*:0/5";
        Unit = "batterynotify.service";
      };

      Install = {
        WantedBy = [ "timers.target" ];
      };
    };

    trash-empty = {
      Unit = {
        Description = "Run trash checking daily";
      };

      Timer = {
        OnCalendar = "daily";
        Unit = "trash-empty.service";
      };

      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
