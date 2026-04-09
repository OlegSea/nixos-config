{ config, pkgs, ... }:

let
  domain = "next.olegsea.ru";
in
{
  age.secrets.nextcloud_pass.owner = "nextcloud";
  age.secrets.nextcloud_pass.group = "nextcloud";
  age.secrets.nextcloud_pass.mode = "770";

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

  services.nginx.virtualHosts.${domain} = {
    enableACME = true;
    forceSSL = true;
  };
}
