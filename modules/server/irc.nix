{ pkgs, ... }:
{
  # ACME certificate for IRC SSL
  security.acme = {
    acceptTerms = true;
    defaults.email = "admin@olegsea.ru";

    certs."irc.olegsea.ru" = {
      domain = "irc.olegsea.ru";
      dnsProvider = "cloudflare";
    };
  };

  services.ircdHybrid = {
    enable = true;

    serverName = "irc.olegsea.ru";
    description = "IRC Server by OlegSea";
    adminEmail = "ta.alexashow@ya.ru";

    sid = "001";

    certificate = "/var/lib/acme/irc.olegsea.ru/cert.pem";
    rsaKey = "/var/lib/acme/irc.olegsea.ru/key.pem";
  };

  networking.firewall = {
    allowedTCPPorts = [
      6667
      6697
      80
    ];
  };

  services.nginx = {
    enable = true;
    virtualHosts."irc.olegsea.ru" = {
      locations."/.well-known/acme-challenge/" = {
        root = "/var/lib/acme/acme-challenge";
      };
    };
  };

  users.users.ircd.extraGroups = [ "acme" ];

  systemd.services.ircd-hybrid.serviceConfig = {
    Restart = "on-failure";
    RestartSec = "5s";
  };
}
