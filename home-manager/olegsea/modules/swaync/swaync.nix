{ ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      layer = "top";
      control-center-layer = "top";
      layer-shell = true;
      layer-shell-cover-screen = true;
      notification-2fa-action = false;
      notification-inline-replies = false;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      fit-to-screen = true;
      relative-timestamps = true;
      notification-visibility = {
        state = {
          locked = false;
          muted = false;
          dnd = false;
        };
      };
      keyboard-shortcuts = true;
      notification-grouping = true;
      image-visibility = "when-available";
      hide-on-clear = true;
      hide-on-action = true;
      text-empty = "No Notifications";
      script-fail-notify = true;
      widgets = [
        "inhibitors"
        "title"
        "dnd"
        "mpris"
        "notifications"
        "volume"
        "backlight"
      ];
      widget-config = {
        inhibitors = {
          text = "Inhibitors";
          button-text = "Clear All";
          clear-all-button = true;
        };
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = "Clear All";
        };
        dnd = {
          text = "Do Not Disturb";
        };
        volume = {
          label = " ";
          show-per-app = true;
        };
        backlight = {
          label = " ";
        };
      };
    };
    style = builtins.readFile ./swaync.css;
  };
}
