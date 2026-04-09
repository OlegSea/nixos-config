{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  environment.systemPackages = with pkgs; [
    protontricks
  ];

  networking.firewall.allowedTCPPorts = [
    34197
  ];
  networking.firewall.allowedUDPPorts = [
    34197
  ];
}
