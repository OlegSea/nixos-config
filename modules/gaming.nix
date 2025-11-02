{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    vulkan-tools
    # heroic

    # Minecartf
    jdk17
    prismlauncher

    # recording n stuff
    obs-studio

    # osu
    osu-lazer-bin
  ];
}
