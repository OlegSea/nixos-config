{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    ./modules/gnome.nix
    ./modules/git.nix
    ./modules/shell.nix
    ./modules/kitty.nix
    ./modules/security.nix
    ./modules/niri
    ./modules/dev
    ./modules/work.nix
    ./modules/discord.nix
    ./modules/spotify.nix
  ];
  stylix.targets.fuzzel.enable = false;
  stylix.targets.swaync.enable = false;
  stylix.targets.waybar.enable = false;
  stylix.targets.niri.enable = false;
  stylix.targets.zed.enable = false;

  home.username = "olegsea";
  home.homeDirectory = "/home/olegsea";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    vivaldi

    telegram-desktop
    fluffychat

    obsidian

    onlyoffice-desktopeditors
    zathura

    yt-dlp
    ffmpeg
  ];

  programs.home-manager.enable = true;
}
