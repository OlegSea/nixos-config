{ ... }:
{
  hm.stylix.targets.noctalia-shell.enable = false;
  hm.programs.noctalia-shell = {
    settings = {
      colorSchemes = {
        darkMode = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        matugenSchemeType = "scheme-fruit-salad";
        predefinedScheme = "Gruvbox";
        schedulingMode = "off";
        useWallpaperColors = false;
      };

      ui = {
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        boxBorderEnabled = false;
        fontDefault = "CaskaydiaMono NF";
        fontDefaultScale = 1;
        fontFixed = "monospace";
        fontFixedScale = 1;
        networkPanelView = "wifi";
        panelBackgroundOpacity = 0.93;
        panelsAttachedToBar = true;
        settingsPanelMode = "attached";
        tooltipsEnabled = true;
        wifiDetailsViewMode = "grid";
      };

      wallpaper = {
        directory = "/home/olegsea/Pictures/Wallpapers";
        enableMultiMonitorDirectories = false;
        enabled = false;
        fillColor = "#000000";
        fillMode = "crop";
        hideWallpaperFilenames = false;
        monitorDirectories = [ ];
        overviewEnabled = false;
        panelPosition = "follow_bar";
        randomEnabled = false;
        randomIntervalSec = 300;
        recursiveSearch = false;
        setWallpaperOnAllMonitors = true;
        solidColor = "#1a1a2e";
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
        useSolidColor = false;
        useWallhaven = false;
        wallhavenApiKey = "";
        wallhavenCategories = "111";
        wallhavenOrder = "desc";
        wallhavenPurity = "100";
        wallhavenQuery = "";
        wallhavenRatios = "";
      };

      nightLight = {
        autoSchedule = true;
        dayTemp = "6500";
        enabled = false;
        forced = false;
        manualSunrise = "07:30";
        manualSunset = "22:00";
        nightTemp = "4000";
      };
    };

    colors = {
      mError = "#fb4934";
      mHover = "#83a598";
      mOnError = "#282828";
      mOnHover = "#282828";
      mOnPrimary = "#282828";
      mOnSecondary = "#282828";
      mOnSurface = "#fbf1c7";
      mOnSurfaceVariant = "#ebdbb2";
      mOnTertiary = "#282828";
      mOutline = "#57514e";
      mPrimary = "#b8bb26";
      mSecondary = "#fabd2f";
      mShadow = "#282828";
      mSurface = "#282828";
      mSurfaceVariant = "#3c3836";
      mTertiary = "#83a598";
    };
  };
}
