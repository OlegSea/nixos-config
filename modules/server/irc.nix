{ pkgs, ... }:
{
  services.ircdHybrid = {
    enable = true;

    serverName = "irc.olegsea.ru";
    description = "IRC Server by OlegSea";
    adminEmail = "ta.alexashow@ya.ru";
  };

  networking.firewall = {
    allowedTCPPorts = [
      6667
      6697
      80
    ];
  };

  systemd.services.ircd-hybrid.serviceConfig = {
    Restart = "on-failure";
    RestartSec = "5s";
  };
}
