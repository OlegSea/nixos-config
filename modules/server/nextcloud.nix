{ config, pkgs, ... }:

let
  domain = "next.olegsea.ru";
  collaboraDomain = "office.olegsea.ru";
in
{
  age.secrets.nextcloud_pass.owner = "nextcloud";
  age.secrets.nextcloud_pass.group = "nextcloud";
  age.secrets.nextcloud_pass.mode = "770";

  age.secrets.nextcloud_whiteboard_jwt.owner = "nextcloud";
  age.secrets.nextcloud_whiteboard_jwt.group = "nextcloud";
  age.secrets.nextcloud_whiteboard_jwt.mode = "770";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud33;
    hostName = domain;
    https = true;

    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps)
        news
        contacts
        calendar
        tasks
        forms
        integration_openai
        mail
        music
        notes
        polls
        spreed
        whiteboard
        richdocuments
        ;
    };
    extraAppsEnable = true;

    configureRedis = true;
    database.createLocally = true;

    maxUploadSize = "10G";

    config = {
      dbtype = "pgsql";
      adminuser = "admin";
      adminpassFile = config.age.secrets.nextcloud_pass.path;
    };

    settings = {
      default_phone_region = "RU";
      overwriteprotocol = "https";
    };
  };

  services.nextcloud-whiteboard-server = {
    enable = true;
    settings.NEXTCLOUD_URL = "https://${domain}";
    secrets = [ config.age.secrets.nextcloud_whiteboard_jwt.path ];
  };

  virtualisation.oci-containers.containers.collabora = {
    image = "collabora/code";
    ports = [ "127.0.0.1:9980:9980" ];
    environment = {
      aliasgroup1 = "https://${domain}:443";
      server_name = collaboraDomain;
      extra_params = "--o:ssl.enable=false --o:ssl.termination=true";
    };
    extraOptions = [ "--restart=always" ];
  };

  services.nginx.virtualHosts = {
    ${domain} = {
      enableACME = true;
      forceSSL = true;
    };

    ${collaboraDomain} = {
      enableACME = true;
      forceSSL = true;

      locations = {
        # static files
        "/browser" = {
          proxyPass = "http://127.0.0.1:9980";
          proxyWebsockets = true;
        };
        # WOPI discovery
        "/hosting/discovery" = {
          proxyPass = "http://127.0.0.1:9980";
          proxyWebsockets = true;
        };
        "/hosting/capabilities" = {
          proxyPass = "http://127.0.0.1:9980";
          proxyWebsockets = true;
        };
        # main websocket
        "/cool/" = {
          proxyPass = "http://127.0.0.1:9980";
          proxyWebsockets = true;
        };
        # Admin Console websocket
        "/cool/adminws" = {
          proxyPass = "http://127.0.0.1:9980";
          proxyWebsockets = true;
        };
      };
    };
  };
}
