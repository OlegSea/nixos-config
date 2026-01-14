{
  pkgs,
  inputs,
  nixosConfigDir,
  ...
}:
let
  noctalia = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "${pkgs.swaybg}/bin/swaybg"
          "-i"
          "${nixosConfigDir}/resources/wallpaper.jpeg"
        ];
      }
      # { argv = [ "${pkgs.waybar}/bin/waybar" ]; }
      # { argv = [ "${pkgs.swaynotificationcenter}/bin/swaync" ]; }
      {
        argv = [
          "${noctalia}/bin/noctalia-shell"
        ];
      }
      { argv = [ "${pkgs.vivaldi}/bin/vivaldi" ]; }
      { argv = [ "${pkgs.kitty}/bin/kitty" ]; }
      { argv = [ "${pkgs.spotify}/bin/spotify" ]; }
      { argv = [ "${pkgs.telegram-desktop}/bin/Telegram" ]; }
      { argv = [ "${pkgs.discord}/bin/discord" ]; }
      { argv = [ "${pkgs.throne}/bin/throne" ]; }
    ];
    hotkey-overlay = {
      skip-at-startup = true;
    };
  };
}
