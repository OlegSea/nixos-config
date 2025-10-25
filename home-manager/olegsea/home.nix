{ config, pkgs, nixosConfigDir, ... }:

{
  # Базовые настройки
  home.username = "olegsea";
  home.homeDirectory = "/home/olegsea";
  home.stateVersion = "25.05";

  # Включение управления GNOME через dconf
  dconf.enable = true;

  # Настройки GNOME
  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-5 = [];
      show-screenshot-ui = ["<Shift><Super>s"];
    };

    # Обои
    # "org/gnome/desktop/background" = {
    #   # picture-uri-dark = "file://${nixosConfigDir}/home-manager/agegon/wallpaper/marine-tunnel.jpg";
    #   picture-uri-dark = "file://${nixosConfigDir}/home-manager/agegon/wallpaper/amber-l.jxl";
    # };

    # Темная тема
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };

    # Фиксированные 5 рабочих стола
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 5;
    };

    # Запуск приложений на текущем рабочем столе
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    # Настройки клавиш
    "org/gnome/desktop/wm/keybindings" = {
      # Закрытие окна
      close = ["<Shift><Super>q"];

      # Переключение между рабочими столами
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      switch-to-workspace-last = ["<Super>5"];

      # Перемещение окон
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      move-to-workspace-last = ["<Shift><Super>5"];
    };

    # Отключение аппаратного ускорения мыши
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    # Кастомные команды
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Launch Terminal";
      command = "kgx";
      binding = "<Super>Return";
    };
  };

  # Установка необходимых пакетов
  home.packages = with pkgs; [
  ];

  programs.git = {
    enable = true;
    settings = {
      user.Name = "Alex Trifonov";
      user.Email = "ta.alexashow@ya.ru";
    };
  };

  # Включение Home Manager
  programs.home-manager.enable = true;
}
