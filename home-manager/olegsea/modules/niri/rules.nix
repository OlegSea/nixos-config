{ ... }:
{
  programs.niri.settings = {
    workspaces = {
      "1" = {
        name = "browser";
        open-on-output = "HDMI-A-1";
      };
      "2" = {
        name = "dev";
        open-on-output = "HDMI-A-1";
      };
      "3" = {
        name = "social";
        open-on-output = "eDP-1";
      };
      "4" = {
        name = "misc";
        open-on-output = "eDP-1";
      };
    };
    window-rules = [
      {
        matches = [ { app-id = "^vivaldi-stable$"; } ];
        open-maximized = true;
        open-on-workspace = "browser";
      }

      {
        matches = [
          { app-id = "dev.zed.Zed"; }
          { app-id = "kitty"; }
        ];
        open-on-workspace = "dev";
        open-maximized = true;
      }

      {
        matches = [
          { app-id = "^discord$"; }
          { app-id = "^org.telegram.desktop$"; }
          { app-id = "^Spotify$"; }
        ];
        open-on-workspace = "social";
        open-maximized = true;
      }

      {
        matches = [
          { app-id = "^nekoray$"; }
          { app-id = "^org.keepassxc.KeePassXC$"; }
        ];
        open-on-workspace = "misc";
      }

      {
        matches = [
          { title = "^Picture in picture$"; }
        ];
        open-floating = true;
      }

      {
        matches = [
          { app-id = "^org\\.keepassxc\\.KeePassXC$"; }
          { app-id = "^org\\.gnome\\.World\\.Secrets$"; }
        ];
        block-out-from = "screen-capture";
      }

      {
        matches = [ { app-id = "^[Mm]inecraft.*$"; } ];
        variable-refresh-rate = true;
      }

      {
        geometry-corner-radius = {
          bottom-left = 10.0;
          bottom-right = 10.0;
          top-left = 10.0;
          top-right = 10.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
