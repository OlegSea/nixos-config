{ ... }:
{
  hm.programs.noctalia-shell.settings = {
    calendar = {
      cards = [
        {
          enabled = true;
          id = "calendar-header-card";
        }
        {
          enabled = true;
          id = "calendar-month-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
      ];
    };

    controlCenter = {
      cards = [
        {
          enabled = true;
          id = "profile-card";
        }
        {
          enabled = true;
          id = "shortcuts-card";
        }
        {
          enabled = true;
          id = "audio-card";
        }
        {
          enabled = false;
          id = "brightness-card";
        }
        {
          enabled = true;
          id = "weather-card";
        }
        {
          enabled = true;
          id = "media-sysmon-card";
        }
      ];
      diskPath = "/";
      position = "close_to_bar_button";
      shortcuts = {
        left = [
          { id = "Network"; }
          { id = "Bluetooth"; }
          { id = "WallpaperSelector"; }
        ];
        right = [
          { id = "Notifications"; }
          { id = "PowerProfile"; }
          { id = "KeepAwake"; }
          { id = "NightLight"; }
        ];
      };
    };

    desktopWidgets = {
      enabled = false;
      gridSnap = false;
      monitorWidgets = [ ];
    };

    location = {
      analogClockInCalendar = false;
      firstDayOfWeek = -1;
      hideWeatherCityName = false;
      hideWeatherTimezone = false;
      name = "Moscow";
      showCalendarEvents = true;
      showCalendarWeather = true;
      showWeekNumberInCalendar = false;
      use12hourFormat = false;
      useFahrenheit = false;
      weatherEnabled = true;
      weatherShowEffects = true;
    };

    network = {
      bluetoothDetailsViewMode = "grid";
      bluetoothHideUnnamedDevices = false;
      bluetoothRssiPollIntervalMs = 10000;
      bluetoothRssiPollingEnabled = false;
      wifiDetailsViewMode = "grid";
      wifiEnabled = true;
    };

    notifications = {
      backgroundOpacity = 1;
      criticalUrgencyDuration = 15;
      enableKeyboardLayoutToast = true;
      enabled = true;
      location = "top_right";
      lowUrgencyDuration = 3;
      monitors = [ "HDMI-A-1" ];
      normalUrgencyDuration = 8;
      overlayLayer = true;
      respectExpireTimeout = false;
      saveToHistory = {
        critical = true;
        low = true;
        normal = true;
      };
      sounds = {
        criticalSoundFile = "";
        enabled = false;
        excludedApps = "discord,firefox,chrome,chromium,edge";
        lowSoundFile = "";
        normalSoundFile = "";
        separateSounds = false;
        volume = 0.5;
      };
    };

    osd = {
      autoHideMs = 2000;
      backgroundOpacity = 1;
      enabled = true;
      enabledTypes = [
        0
        1
        2
      ];
      location = "top_right";
      monitors = [ ];
      overlayLayer = true;
    };

    systemMonitor = {
      cpuCriticalThreshold = 90;
      cpuPollingInterval = 3000;
      cpuWarningThreshold = 80;
      criticalColor = "";
      diskCriticalThreshold = 90;
      diskPollingInterval = 3000;
      diskWarningThreshold = 80;
      enableDgpuMonitoring = false;
      externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      gpuCriticalThreshold = 90;
      gpuPollingInterval = 3000;
      gpuWarningThreshold = 80;
      loadAvgPollingInterval = 3000;
      memCriticalThreshold = 90;
      memPollingInterval = 3000;
      memWarningThreshold = 80;
      networkPollingInterval = 3000;
      tempCriticalThreshold = 90;
      tempPollingInterval = 3000;
      tempWarningThreshold = 80;
      useCustomColors = false;
      warningColor = "";
    };
  };
}
