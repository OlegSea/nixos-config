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
        # disabled-on-external-mouse = true;
        # dwt = true;
        tap = true;
        natural-scroll = true;
        scroll-factor = 0.7;
      };
      mouse = {
        accel-profile = "flat";
      };
      trackpoint = { };
    };
  };
}
