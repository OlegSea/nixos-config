{ ... }:
{
  programs.niri.settings = {
    workspaces = {
      "1" = {
        name = "browser";
      };
      "2" = {
        name = "dev";
      };
      "3" = {
        name = "social";
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
          { app-id = "^nekoray$"; }
        ];
        open-on-workspace = "social";
      }

      {
        matches = [
          { app-id = "^discord$"; }
          { app-id = "^org.telegram.desktop$"; }
          { app-id = "^Spotify$"; }
        ];
        open-maximized = true;
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
