{ pkgs, ... }:
{
  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "${pkgs.waybar}/bin/waybar" ]; }
      { argv = [ "${pkgs.swaynotificationcenter}/bin/swaync" ]; }
      { argv = [ "${pkgs.vivaldi}/bin/vivaldi" ]; }
      { argv = [ "${pkgs.kitty}/bin/kitty" ]; }
      { argv = [ "${pkgs.spotify}/bin/spotify" ]; }
      { argv = [ "${pkgs.telegram-desktop}/bin/Telegram" ]; }
      { argv = [ "${pkgs.discord}/bin/discord" ]; }
      { argv = [ "${pkgs.nekoray}/bin/nekoray" ]; }
    ];
    hotkey-overlay = {
      skip-at-startup = true;
    };
  };
}
