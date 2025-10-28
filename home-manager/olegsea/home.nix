{
  config,
  pkgs,
  nixosConfigDir,
  inputs,
  system,
  ...
}:

{
  imports = [
    ./modules/gnome.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/niri.nix
    ./modules/dev.nix
    ./modules/gaming.nix
  ];

  # Базовые настройки
  home.username = "olegsea";
  home.homeDirectory = "/home/olegsea";
  home.stateVersion = "25.05";

  # Установка необходимых пакетов
  home.packages = with pkgs; [
    vivaldi

    telegram-desktop
    discord

    obsidian
    spotify
  ];

  # Включение Home Manager
  programs.home-manager.enable = true;
}
