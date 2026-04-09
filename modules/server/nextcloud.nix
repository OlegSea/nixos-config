{ config, pkgs, ... }:

let
  domain = "next.olegsea.ru";
  onlyofficeDomain = "office.olegsea.ru";
in
{
  age.secrets.nextcloud_pass.owner = "nextcloud";
  age.secrets.nextcloud_pass.group = "nextcloud";
  age.secrets.nextcloud_pass.mode = "770";

  age.secrets.nextcloud_whiteboard_jwt.owner = "nextcloud";
  age.secrets.nextcloud_whiteboard_jwt.group = "nextcloud";
  age.secrets.nextcloud_whiteboard_jwt.mode = "770";

  age.secrets.onlyoffice_jwt = { };
  age.secrets.onlyoffice_nonce = { };

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
        onlyoffice
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

  services.onlyoffice = {
    enable = true;
    hostname = onlyofficeDomain;
    port = 8888;
    jwtSecretFile = config.age.secrets.onlyoffice_jwt.path;
    securityNonceFile = config.age.secrets.onlyoffice_nonce.path;
  };

  services.nginx.virtualHosts = {
    ${domain} = {
      enableACME = true;
      forceSSL = true;
    };

    ${onlyofficeDomain} = {
      enableACME = true;
      forceSSL = true;
    };
  };
}
