{
  pkgs,
  flakeDir,
  ...
}:
{
  hm = {
    programs.niri.settings = {
      spawn-at-startup = [
        { argv = [ "${pkgs.vivaldi}/bin/vivaldi" ]; }
        { argv = [ "${pkgs.vivaldi}/bin/vivaldi" ]; }
        { argv = [ "${pkgs.kitty}/bin/kitty" ]; }
        { argv = [ "${pkgs.telegram-desktop}/bin/Telegram" ]; }
        { argv = [ "spotify" ]; }
        { argv = [ "discord" ]; }
        { argv = [ "noctalia" ]; }
        { argv = [ "" ]; }
      ];
      hotkey-overlay = {
        skip-at-startup = true;
      };
    };
  };
}
