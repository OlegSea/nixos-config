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
    ./modules/noctalia
    ./modules/mango
  ];
  stylix.targets.niri.enable = false;
  stylix.targets.zed.enable = false;

  home.username = "olegsea";
  home.homeDirectory = "/home/olegsea";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    vivaldi

    telegram-desktop
    fluffychat
    teamspeak6-client
    hexchat

    obsidian

    yt-dlp
    ffmpeg

    qbittorrent
  ];

  programs.home-manager.enable = true;
}
