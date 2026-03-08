{ ... }:
{
  hm.programs.noctalia-shell.settings = {
    appLauncher = {
      autoPasteClipboard = false;
      clipboardWrapText = true;
      customLaunchPrefix = "";
      customLaunchPrefixEnabled = false;
      enableClipPreview = true;
      enableClipboardHistory = true;
      iconMode = "tabler";
      ignoreMouseInput = false;
      pinnedApps = [ ];
      position = "center";
      screenshotAnnotationTool = "";
      showCategories = true;
      showIconBackground = false;
      sortByMostUsed = true;
      terminalCommand = "xterm -e";
      useApp2Unit = false;
      viewMode = "list";
    };

    dock = {
      animationSpeed = 1;
      backgroundOpacity = 1;
      colorizeIcons = false;
      deadOpacity = 0.6;
      displayMode = "auto_hide";
      enabled = true;
      floatingRatio = 1;
      inactiveIndicators = false;
      monitors = [ ];
      onlySameOutput = true;
      pinnedApps = [ ];
      pinnedStatic = false;
      position = "bottom";
      size = 1;
    };

    sessionMenu = {
      countdownDuration = 10000;
      enableCountdown = true;
      largeButtonsLayout = "grid";
      largeButtonsStyle = false;
      position = "center";
      powerOptions = [
        {
          action = "lock";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "suspend";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "hibernate";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "reboot";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "logout";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
        {
          action = "shutdown";
          command = "";
          countdownEnabled = true;
          enabled = true;
        }
      ];
      showHeader = true;
      showNumberLabels = true;
    };
  };
}
