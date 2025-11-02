{ inputs, ... }:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    # dorion.enable = true;
    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css"
      ];
      frameless = true;
      plugins = {
      };
    };
    # dorion = {
    #   # theme = "dark";
    #   # zoom = "1.1";
    #   blur = "acrylic"; # "none", "blur", or "acrylic"
    #   sysTray = true;
    #   # openOnStartup = true;
    #   autoClearCache = true;
    #   disableHardwareAccel = false;
    #   rpcServer = true;
    #   rpcProcessScanner = true;
    #   pushToTalk = true;
    #   pushToTalkKeys = [ "RControl" ];
    #   desktopNotifications = true;
    #   unreadBadge = true;
    # };
    extraConfig = {
      # Some extra JSON config here
      # ...
    };
  };
}
