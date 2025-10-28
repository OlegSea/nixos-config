{
  inputs,
  config,
  pkgs,
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
    ./modules/kitty.nix
    # TODO: убрать эти две строчки, когда починят qgnomeplatform
    inputs.stylix.homeModules.stylix
    ../../modules/stylix.nix
  ];
  stylix.targets.fuzzel.enable = false;
  stylix.targets.swaync.enable = false;

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
