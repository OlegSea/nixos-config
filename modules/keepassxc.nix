{ ... }:
{
  hm = {
    programs.keepassxc = {
      autostart = true;
      enable = true;
      settings = {
        # https://github.com/keepassxreboot/keepassxc/blob/develop/src/core/Config.cpp
        Browser.Enabled = true;
        Browser.AlwaysAllowAccess = true;

        Security.LockDatabaseIdle = true;
        Security.LockDatabaseIdleSeconds = 240;

        GUI.ApplicationTheme = "classic";
      };
    };

    xdg.autostart.enable = true;
  };
}
