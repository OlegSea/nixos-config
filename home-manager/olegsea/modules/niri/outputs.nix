{ ... }:
{
  programs.niri.settings = {
    outputs."DP-1" = {
      enable = true;
      mode = {
        width = 1920;
        height = 1080;
        refresh = 165.001;
      };
      variable-refresh-rate = "on-demand";
      scale = 1;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = 0;
        y = 0;
      };
    };
    outputs."HDMI-A-1" = {
      enable = true;
      mode = {
        width = 1920;
        height = 1080;
        refresh = 180.001;
      };
      variable-refresh-rate = "on-demand";
      scale = 1;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = 1440;
        y = 0;
      };
    };
    outputs."eDP-1" = {
      enable = true;
      mode = {
        width = 2880;
        height = 1620;
        refresh = 120.002;
      };
      variable-refresh-rate = "on-demand";
      scale = 2.0;
      transform = {
        rotation = 0;
        flipped = false;
      };
      position = {
        x = 0;
        y = 0;
      };
    };
  };
}
