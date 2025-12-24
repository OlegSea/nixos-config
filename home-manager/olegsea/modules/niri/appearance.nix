{ pkgs, ... }:
{
  programs.niri.settings = {
    layout = {
      gaps = 16;
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      default-column-width = {
        proportion = 0.5;
      };
      focus-ring = {
        enable = true;
        width = 3;
        active = {
          color = "#ebdbb2";
        };
        inactive = {
          color = "#505050";
        };
      };
      border = {
        enable = false;
        width = 4;
        active = {
          color = "#ffc87f";
        };
        inactive = {
          color = "#505050";
        };
        urgent = {
          color = "#9b0000";
        };
      };
      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = {
          x = 0;
          y = 5;
        };
        color = "#0007";
      };
      struts = { };
    };

    animations = { };

    cursor = {
      theme = "Adwaita";
    };
  };
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 16;
  };
}
