{ ... }:
{
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = {
          layout = "us,ru";
          options = "grp:win_space_toggle,caps:escape";
        };
        numlock = true;
      };
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "0%";
      };
      touchpad = {
        tap = true;
        natural-scroll = true;
      };
      mouse = {
        accel-profile = "flat";
      };
      trackpoint = { };
    };
  };
}
