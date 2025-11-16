{ pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    GSK_RENDERER = "ngl";
  };

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
    heroic
    pciutils
    lshw

    # Minecartf
    jdk17
    prismlauncher

    # recording n stuff
    obs-studio

    # osu
    osu-lazer-bin
  ];

  networking.firewall.allowedTCPPorts = [
    34197
  ];
  networking.firewall.allowedUDPPorts = [
    34197
  ];
}
