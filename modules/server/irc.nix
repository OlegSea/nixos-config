{ pkgs, config, ... }:
{
  services.ergochat = {
    enable = true;
    settings = {
      oper-classes = {
        server-admin = {
          title = "Admin";
          capabilities = [
            "kill"
            "ban"
            "nofakelag"
            "relaymsg"
            "vhosts"
            "sajoin"
            "samode"
            "snomasks"
            "roleplay"
            "rehash"
            "accreg"
            "chanreg"
            "history"
            "defcon"
            "massmessage"
            "metadata"
          ];
        };
      };
      opers = {
        admin = {
          class = "server-admin";
          hidden = false;
          whois-line = "is the server administrator";
          vhost = "staff";
          password = "$2a$04$xrCOCMRzjBh9j4P7EabM0euyHVkdgEtAK7iAr/vXX994F53Lvv.dy";
        };
      };
      accounts = {
        authentication-enabled = true;
        multiclient = {
          allowed-by-default = true;
          always-on = "opt-out";
          auto-away = "opt-out";
          enabled = true;
        };
        nick-reservation = {
          enabled = true;
          method = "strict";
          allow-custom-enforcement = true;
          auto-ghost = true;
          timeout = "30s";
        };
        registration = {
          allow-before-connect = true;
          bcrypt-cost = 4;
          email-verification = {
            enabled = false;
          };
          enabled = true;
          throttling = {
            duration = "10m";
            enabled = true;
            max-attempts = 30;
          };
        };
      };
      channels = {
        default-modes = "+ntC";
        registration = {
          enabled = true;
        };
      };
      datastore = {
        autoupgrade = true;
        path = "/var/lib/ergo/ircd.db";
      };
      history = {
        autoreplay-on-join = 0;
        autoresize-window = "3d";
        channel-length = 2048;
        chathistory-maxmessages = 100;
        client-length = 256;
        enabled = true;
        restrictions = {
          expire-time = "1w";
          grace-period = "1h";
          query-cutoff = "none";
        };
        retention = {
          allow-individual-delete = false;
          enable-account-indexing = false;
        };
        tagmsg-storage = {
          default = false;
          whitelist = [
            "+draft/react"
            "+react"
          ];
        };
        znc-maxmessages = 2048;
      };
      limits = {
        awaylen = 390;
        channellen = 64;
        identlen = 20;
        kicklen = 390;
        nicklen = 32;
        topiclen = 390;
      };
      network = {
        name = "oleg-network";
      };
      server = {
        casemapping = "permissive";
        check-ident = false;
        enforce-utf = true;
        forward-confirm-hostnames = false;
        ip-cloaking = {
          enabled = false;
        };
        ip-limits = {
          count = false;
          throttle = false;
        };
        listeners = {
          ":6667" = { };
          ":6697" = {
            tls = {
              cert = "/var/lib/acme/irc.olegsea.ru/cert.pem";
              key = "/var/lib/acme/irc.olegsea.ru/key.pem";
            };
          };
        };
        lookup-hostnames = false;
        max-sendq = "1M";
        name = "irc.olegsea.ru";
        relaymsg = {
          enabled = false;
        };
      };
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts."irc.olegsea.ru" = {
      enableACME = true;
      forceSSL = false;
      locations."/" = {
        return = "404";
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "olegsea1334@gmail.com";
    certs."irc.olegsea.ru" = {
      group = "nginx";
      reloadServices = [
        "ergochat"
        "nginx"
      ];
    };
  };

  users.groups.ergochat = { };
  users.users.ergochat = {
    group = "ergochat";
    isSystemUser = true;
    extraGroups = [ "nginx" ];
  };

  networking.firewall.allowedTCPPorts = [
    80
    6667
    6697
  ];

  environment.systemPackages = with pkgs; [
    ergochat
  ];
}
