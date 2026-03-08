{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
  networking.firewall.allowedTCPPorts = [
    34197
  ];
  networking.firewall.allowedUDPPorts = [
    34197
  ];
}
