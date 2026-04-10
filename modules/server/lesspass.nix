{ pkgs, ... }:
let
  domain = "lesspass.olegsea.ru";
in
{
  virtualisation.oci-containers.containers = {
    lesspass = {
      image = "ogarcia/rockpass";
      autoStart = true;
      ports = [
        "8000:8000"
      ];
      volumes = [
        "/srv/rockpass:/var/lib/rockpass"
      ];
    };
  };

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;

    virtualHosts."${domain}" = {
      enableACME = true;
      forceSSL = true;

      locations."/" = {
        proxyPass = "http://127.0.0.1:8000";
        extraConfig = ''
          # Preserve host and scheme - critical for proper Matrix operation
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $remote_addr;
          proxy_set_header X-Forwarded-Proto https;
        '';
      };
    };
  };
}
