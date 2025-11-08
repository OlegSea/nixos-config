{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # keepassxc
  ];
  programs.keepassxc = {
    autostart = true;
    enable = true;
    settings = {
      # https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
      FdoSecrets.Enabled = true;

      Browser.Enabled = true;
      Browser.AlwaysAllowAccess = true;

      Security.LockDatabaseIdle = true;
      Security.LockDatabaseIdleSeconds = 240;

    };
  };

  xdg.autostart.enable = true;
}
