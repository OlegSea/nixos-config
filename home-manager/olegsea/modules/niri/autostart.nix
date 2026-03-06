{
  pkgs,
  inputs,
  nixosConfigDir,
  ...
}:
{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "${pkgs.swaybg}/bin/swaybg"
          "-i"
          "${nixosConfigDir}/resources/wallpaper.png"
        ];
      }
      { argv = [ "${pkgs.vivaldi}/bin/vivaldi" ]; }
      { argv = [ "${pkgs.kitty}/bin/kitty" ]; }
      { argv = [ "${pkgs.telegram-desktop}/bin/Telegram" ]; }
      { argv = [ "spotify" ]; }
      { argv = [ "discord" ]; }
    ];
    hotkey-overlay = {
      skip-at-startup = true;
    };
  };
}
