{ ... }:
{
  hm.programs.noctalia-shell.settings.bar = {
    backgroundOpacity = 0.93;
    capsuleOpacity = 1;
    density = "default";
    exclusive = true;
    floating = false;
    marginHorizontal = 4;
    marginVertical = 4;
    monitors = [ ];
    outerCorners = true;
    position = "top";
    showCapsule = true;
    showOutline = false;
    useSeparateOpacity = false;
    widgets = {
      center = [
        {
          customFont = "";
          formatHorizontal = "HH:mm ddd, MMM dd";
          formatVertical = "HH mm - dd MM";
          id = "Clock";
          tooltipFormat = "HH:mm ddd, MMM dd";
          useCustomFont = false;
          usePrimaryColor = false;
        }
      ];
      left = [
        {
          icon = "rocket";
          id = "Launcher";
          usePrimaryColor = false;
        }
        {
          characterCount = 2;
          colorizeIcons = false;
          enableScrollWheel = true;
          followFocusedScreen = false;
          groupedBorderOpacity = 1;
          hideUnoccupied = false;
          iconScale = 0.8;
          id = "Workspace";
          labelMode = "index";
          showApplications = false;
          showLabelsOnlyWhenOccupied = true;
          unfocusedIconsOpacity = 1;
        }
        {
          compactMode = false;
          compactShowAlbumArt = true;
          compactShowVisualizer = false;
          hideMode = "hidden";
          hideWhenIdle = false;
          id = "MediaMini";
          maxWidth = 145;
          panelShowAlbumArt = true;
          panelShowVisualizer = true;
          scrollingMode = "hover";
          showAlbumArt = true;
          showArtistFirst = true;
          showProgressRing = true;
          showVisualizer = false;
          useFixedWidth = false;
          visualizerType = "linear";
        }
      ];
      right = [
        {
          blacklist = [ ];
          colorizeIcons = false;
          drawerEnabled = true;
          hidePassive = false;
          id = "Tray";
          pinned = [ ];
        }
        {
          compactMode = true;
          diskPath = "/";
          id = "SystemMonitor";
          showCpuTemp = true;
          showCpuUsage = true;
          showDiskUsage = false;
          showGpuTemp = false;
          showLoadAverage = false;
          showMemoryAsPercent = false;
          showMemoryUsage = true;
          showNetworkStats = false;
          useMonospaceFont = true;
          usePrimaryColor = false;
        }
        {
          defaultSettings = {
            audioCodec = "opus";
            audioSource = "default_output";
            colorRange = "limited";
            copyToClipboard = false;
            directory = "";
            filenamePattern = "recording_yyyyMMdd_HHmmss";
            frameRate = "60";
            quality = "very_high";
            showCursor = true;
            videoCodec = "h264";
            videoSource = "portal";
          };
          id = "plugin:screen-recorder";
        }
        {
          displayMode = "onhover";
          id = "Volume";
          middleClickCommand = "pwvucontrol || pavucontrol";
        }
        {
          hideWhenZero = false;
          id = "NotificationHistory";
          showUnreadBadge = true;
        }
        {
          displayMode = "onhover";
          id = "Brightness";
        }
        {
          id = "KeyboardLayout";
          displayMode = "forceOpen";
        }
        {
          deviceNativePath = "";
          displayMode = "icon-always";
          hideIfNotDetected = true;
          id = "Battery";
          showNoctaliaPerformance = false;
          showPowerProfiles = false;
          warningThreshold = 30;
        }
        {
          colorizeDistroLogo = false;
          colorizeSystemIcon = "none";
          customIconPath = "";
          enableColorization = false;
          icon = "noctalia";
          id = "ControlCenter";
          useDistroLogo = false;
        }
      ];
    };
  };
}
