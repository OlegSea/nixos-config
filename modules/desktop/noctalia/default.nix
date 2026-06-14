{ pkgs, noctalia, ... }:
{
  imports = [
    ./bar.nix
    ./dock.nix
    ./idle.nix
    ./lockscreen.nix
  ];

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  hm = {
    imports = [
      noctalia.homeModules.default
    ];

    programs.noctalia.settings = {

      calendar = {
        account = {
          personal_google = {
            name = "Google";
            type = "google";
          };
        };
      };

      location = {
        address = "Moscow";
      };
      lockscreen = {
      };

      nightlight = {
        enabled = true;
      };
      notification = {
        monitors = [ "HDMI-A-1" ];
      };
      shell = {
        niri_overview_type_to_launch_enabled = true;
        animation = {
          speed = 1.3;
        };
        screenshot = {
          save_to_file = false;
        };
      };
      
      
    };

    programs.noctalia.enable = true;
  };
}
