{ ... }:
{
  hm.programs.noctalia.settings = {
    bar = {
      default = {
        background_opacity = 0.8499999810010195;
        capsule = true;
        end = [
          "tray"
          "notifications"
          "clipboard"
          "network"
          "volume"
          "battery"
          "control-center"
        ];
        margin_edge = 0;
        margin_ends = 0;
        padding = 6;
        radius = 0;
        start = [
          "launcher"
          "workspaces"
          "media"
        ];
        thickness = 36;
      };
    };
    widget = {
      clock = {
        format = "{:%H:%M %a, %d %B}";
      };
      network = {
        show_label = false;
      };
      tray = {
        drawer = true;
        pinned = [
          "ibus-ui-gtk3"
          "Fcitx"
        ];
      };
      volume = {
        scroll_step = 1;
      };
    };
  };
}
