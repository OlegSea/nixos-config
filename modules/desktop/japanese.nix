{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        # fcitx5-mozc
        fcitx5-mozc-ut
        fcitx5-gtk
      ];
      settings.inputMethod = {
        GroupOrder."0" = "Default";
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0".Name = "keyboard-us";
        "Groups/0/Items/1".Name = "keyboard-ru";
        "Groups/0/Items/2".Name = "mozc";
      };
      settings.globalOptions = {
        "Hotkey/TriggerKeys" = {
          "0" = "Super+space";
        };
      };
    };
  };
}
