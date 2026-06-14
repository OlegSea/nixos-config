{ ... }:
{
  hm.programs.noctalia.settings = {
    lockscreen = {
      blurred_desktop = true;
    };
    lockscreen_widgets = {
      enabled = true;
      schema_version = 2;
      widget_order = [
        "lockscreen-login-box@DP-1"
        "lockscreen-login-box@HDMI-A-1"
        "lockscreen-widget-0000000000000001"
        "lockscreen-widget-0000000000000002"
        "lockscreen-widget-0000000000000003"
      ];
      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };
      widget = {
        "lockscreen-login-box@DP-1" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 957.0;
          output = "DP-1";
          rotation = 0.0;
          type = "login_box";
        };
        "lockscreen-login-box@HDMI-A-1" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 957.0;
          output = "HDMI-A-1";
          rotation = 0.0;
          type = "login_box";
        };
        lockscreen-widget-0000000000000001 = {
          box_height = 208.0;
          box_width = 592.0;
          cx = 960.0;
          cy = 340.0;
          output = "DP-1";
          rotation = 0.0;
          type = "clock";
          settings = {
            format = "{:%H:%M}\n{:%A, %d %B}";
          };
        };
        lockscreen-widget-0000000000000002 = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 726.0;
          cy = 658.0;
          output = "DP-1";
          rotation = 0.0;
          type = "fancy_audio_visualizer";
          settings = {
            background = false;
          };
        };
        lockscreen-widget-0000000000000003 = {
          box_height = 288.0;
          box_width = 464.0;
          cx = 1128.0;
          cy = 652.0;
          output = "DP-1";
          rotation = 0.0;
          type = "media_player";
        };
      };
    };
  };
}
