{
  lib,
  ...
}:

{
  hm = {
    dconf.enable = true;

    dconf.settings = {
      "org/gnome/desktop/interface".color-scheme = lib.mkForce "prefer-dark";
    };
  };
}
