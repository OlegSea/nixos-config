{ nixosConfigDir, ... }:
{
  programs.niri.settings = {
    binds = {
      "Mod+Shift+Slash" = {
        action.show-hotkey-overlay = { };
      };
      "Mod+Return" = {
        hotkey-overlay.title = "Open a Terminal: kitty";
        action.spawn = [ "kitty" ];
      };
      "Mod+D" = {
        hotkey-overlay.title = "Run an Application: fuzzel";
        action.spawn = [ "fuzzel" ];
      };
      "Mod+C" = {
        hotkey-overlay.title = "Run an Application: fuzzel calc";
        action.spawn = [ "${nixosConfigDir}/scripts/fuzzel/fuzzel_calculator.sh" ];
      };
      "Mod+Escape" = {
        hotkey-overlay.title = "Power menu";
        action.spawn = [ "${nixosConfigDir}/scripts/fuzzel/fuzzel_powermenu.sh" ];
      };
      "Super+Alt+L" = {
        hotkey-overlay.title = "Lock the Screen: swaylock";
        action.spawn = [ "swaylock" ];
      };
      "Super+N" = {
        hotkey-overlay.title = "Notification daemon";
        action.spawn-sh = "swaync-client -op";
      };

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      };
      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl play-pause";
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl next";
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn-sh = "playerctl previous";
      };

      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "+10%"
        ];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = [
          "brightnessctl"
          "--class=backlight"
          "set"
          "10%-"
        ];
      };

      "Mod+O" = {
        repeat = false;
        action.toggle-overview = { };
      };
      "Mod+Shift+Q" = {
        repeat = false;
        action.close-window = { };
      };

      "Mod+Left" = {
        action.focus-column-left = { };
      };
      "Mod+Down" = {
        action.focus-window-down = { };
      };
      "Mod+Up" = {
        action.focus-window-up = { };
      };
      "Mod+Right" = {
        action.focus-column-right = { };
      };
      "Mod+H" = {
        action.focus-column-left = { };
      };
      "Mod+J" = {
        action.focus-window-or-workspace-down = { };
      };
      "Mod+K" = {
        action.focus-window-or-workspace-up = { };
      };
      "Mod+L" = {
        action.focus-column-right = { };
      };

      "Mod+Shift+Left" = {
        action.move-column-left = { };
      };
      "Mod+Shift+Down" = {
        action.move-window-down = { };
      };
      "Mod+Shift+Up" = {
        action.move-window-up = { };
      };
      "Mod+Shift+Right" = {
        action.move-column-right = { };
      };
      "Mod+Shift+H" = {
        action.move-column-left = { };
      };
      "Mod+Shift+J" = {
        action.move-window-down = { };
      };
      "Mod+Shift+K" = {
        action.move-window-up = { };
      };
      "Mod+Shift+L" = {
        action.move-column-right = { };
      };

      "Mod+Home" = {
        action.focus-column-first = { };
      };
      "Mod+End" = {
        action.focus-column-last = { };
      };
      "Mod+Ctrl+Home" = {
        action.move-column-to-first = { };
      };
      "Mod+Ctrl+End" = {
        action.move-column-to-last = { };
      };

      "Mod+Ctrl+Left" = {
        action.focus-monitor-left = { };
      };
      "Mod+Ctrl+Down" = {
        action.focus-monitor-down = { };
      };
      "Mod+Ctrl+Up" = {
        action.focus-monitor-up = { };
      };
      "Mod+Ctrl+Right" = {
        action.focus-monitor-right = { };
      };
      "Mod+Ctrl+H" = {
        action.focus-monitor-left = { };
      };
      "Mod+Ctrl+J" = {
        action.focus-monitor-down = { };
      };
      "Mod+Ctrl+K" = {
        action.focus-monitor-up = { };
      };
      "Mod+Ctrl+L" = {
        action.focus-monitor-right = { };
      };

      "Mod+Shift+Ctrl+Left" = {
        action.move-column-to-monitor-left = { };
      };
      "Mod+Shift+Ctrl+Down" = {
        action.move-column-to-monitor-down = { };
      };
      "Mod+Shift+Ctrl+Up" = {
        action.move-column-to-monitor-up = { };
      };
      "Mod+Shift+Ctrl+Right" = {
        action.move-column-to-monitor-right = { };
      };
      "Mod+Shift+Ctrl+H" = {
        action.move-column-to-monitor-left = { };
      };
      "Mod+Shift+Ctrl+J" = {
        action.move-column-to-monitor-down = { };
      };
      "Mod+Shift+Ctrl+K" = {
        action.move-column-to-monitor-up = { };
      };
      "Mod+Shift+Ctrl+L" = {
        action.move-column-to-monitor-right = { };
      };

      "Mod+Comma" = {
        action.focus-monitor-left = { };
      };
      "Mod+Period" = {
        action.focus-monitor-right = { };
      };

      "Mod+Shift+Comma" = {
        action.move-workspace-to-monitor-left = { };
      };
      "Mod+Shift+Period" = {
        action.move-workspace-to-monitor-right = { };
      };

      "Mod+Ctrl+Comma" = {
        action.move-window-to-monitor-left = { };
      };
      "Mod+Ctrl+Period" = {
        action.move-window-to-monitor-right = { };
      };

      # "Mod+Page_Down" = {
      #   action.focus-workspace-down = { };
      # };
      # "Mod+Page_Up" = {
      #   action.focus-workspace-up = { };
      # };
      "Mod+U" = {
        action.focus-workspace-down = { };
      };
      "Mod+I" = {
        action.focus-workspace-up = { };
      };
      "Mod+Shift+Page_Down" = {
        action.move-column-to-workspace-down = { };
      };
      "Mod+Shift+Page_Up" = {
        action.move-column-to-workspace-up = { };
      };
      "Mod+Shift+U" = {
        action.move-column-to-workspace-down = { };
      };
      "Mod+Shift+I" = {
        action.move-column-to-workspace-up = { };
      };

      "Mod+Page_Down" = {
        action.move-workspace-down = { };
      };
      "Mod+Page_Up" = {
        action.move-workspace-up = { };
      };
      "Mod+Ctrl+U" = {
        action.move-workspace-down = { };
      };
      "Mod+Ctrl+I" = {
        action.move-workspace-up = { };
      };

      "Mod+WheelScrollDown" = {
        cooldown-ms = 80;
        action.focus-column-right = { };
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 80;
        action.focus-column-left = { };
      };
      "Mod+Shift+WheelScrollDown" = {
        cooldown-ms = 80;
        action.focus-workspace-down = { };
      };
      "Mod+Shift+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = { };
      };

      "Mod+WheelScrollRight" = {
        action.focus-column-right = { };
      };
      "Mod+WheelScrollLeft" = {
        action.focus-column-left = { };
      };
      "Mod+Ctrl+WheelScrollRight" = {
        action.move-column-right = { };
      };
      "Mod+Ctrl+WheelScrollLeft" = {
        action.move-column-left = { };
      };

      "Mod+Ctrl+Shift+WheelScrollDown" = {
        action.move-column-right = { };
      };
      "Mod+Ctrl+Shift+WheelScrollUp" = {
        action.move-column-left = { };
      };

      "Mod+1" = {
        action.focus-workspace = 1;
      };
      "Mod+2" = {
        action.focus-workspace = 2;
      };
      "Mod+3" = {
        action.focus-workspace = 3;
      };
      "Mod+4" = {
        action.focus-workspace = 4;
      };
      "Mod+5" = {
        action.focus-workspace = 5;
      };
      "Mod+6" = {
        action.focus-workspace = 6;
      };
      "Mod+7" = {
        action.focus-workspace = 7;
      };
      "Mod+8" = {
        action.focus-workspace = 8;
      };
      "Mod+9" = {
        action.focus-workspace = 9;
      };
      "Mod+Shift+1" = {
        action.move-column-to-workspace = 1;
      };
      "Mod+Shift+2" = {
        action.move-column-to-workspace = 2;
      };
      "Mod+Shift+3" = {
        action.move-column-to-workspace = 3;
      };
      "Mod+Shift+4" = {
        action.move-column-to-workspace = 4;
      };
      "Mod+Shift+5" = {
        action.move-column-to-workspace = 5;
      };
      "Mod+Shift+6" = {
        action.move-column-to-workspace = 6;
      };
      "Mod+Shift+7" = {
        action.move-column-to-workspace = 7;
      };
      "Mod+Shift+8" = {
        action.move-column-to-workspace = 8;
      };
      "Mod+Shift+9" = {
        action.move-column-to-workspace = 9;
      };

      "Mod+BracketLeft" = {
        action.consume-or-expel-window-left = { };
      };
      "Mod+BracketRight" = {
        action.consume-or-expel-window-right = { };
      };

      # "Mod+Comma" = {
      #   action.consume-window-into-column = { };
      # };
      # "Mod+Period" = {
      #   action.expel-window-from-column = { };
      # };

      "Mod+R" = {
        action.switch-preset-column-width = { };
      };
      "Mod+Shift+R" = {
        action.switch-preset-window-height = { };
      };
      "Mod+Ctrl+R" = {
        action.reset-window-height = { };
      };
      "Mod+F" = {
        action.maximize-column = { };
      };
      "Mod+Shift+F" = {
        action.fullscreen-window = { };
      };

      "Mod+Ctrl+F" = {
        action.expand-column-to-available-width = { };
      };

      "Mod+Shift+C" = {
        action.center-column = { };
      };

      "Mod+Ctrl+C" = {
        action.center-visible-columns = { };
      };

      "Mod+Minus" = {
        action.set-column-width = "-10%";
      };
      "Mod+Equal" = {
        action.set-column-width = "+10%";
      };

      "Mod+Shift+Minus" = {
        action.set-window-height = "-10%";
      };
      "Mod+Shift+Equal" = {
        action.set-window-height = "+10%";
      };

      "Mod+V" = {
        action.toggle-window-floating = { };
      };
      "Mod+Shift+V" = {
        action.switch-focus-between-floating-and-tiling = { };
      };

      "Print" = {
        action.screenshot = { };
      };
      "Ctrl+Print" = {
        action.screenshot-screen = { };
      };
      "Alt+Print" = {
        action.screenshot-window = { };
      };

      "Mod+Shift+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = { };
      };

      "Mod+Shift+E" = {
        action.quit = { };
      };
      "Ctrl+Alt+Delete" = {
        action.quit = { };
      };

      "Mod+Shift+P" = {
        action.power-off-monitors = { };
      };
    };
  };
}
