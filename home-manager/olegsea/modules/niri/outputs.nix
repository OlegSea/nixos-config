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
  };
}
