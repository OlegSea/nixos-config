{ ... }:
{
  hm.stylix.targets.noctalia-shell.enable = false;
  hm.programs.noctalia.settings = {
    theme = {
      builtin = "Gruvbox";
      source = "builtin";
      templates = {
        enable_builtin_templates = false;
        enable_community_templates = false;
      };
    };
    wallpaper = {
      directory = "/home/olegsea/nixos-config/resources/wallpapers";
      default = {
        path = "/home/olegsea/nixos-config/resources/wallpapers/wallpaper.jpg";
      };
      last = {
        path = "/home/olegsea/nixos-config/resources/wallpapers/wallpaper.jpg";
      };
      monitors = {
        DP-1 = {
          path = "/home/olegsea/nixos-config/resources/wallpapers/wallpaper.jpg";
        };
        HDMI-A-1 = {
          path = "/home/olegsea/nixos-config/resources/wallpapers/wallpaper.jpg";
        };
      };
    };
  };
}
