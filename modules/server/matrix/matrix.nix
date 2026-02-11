{ inputs, pkgs, ... }:

let
  matrixRegistrationToken = builtins.readFile ../../../resources/secrets/matrix-registration-token;
  matrixDomain = "matrix.olegsea.ru";
in
{
  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      8448
    ];
  };

  services.matrix-tuwunel = {
    enable = true;
    settings = {
      global = {
        # The server_name is the pretty name of this server
        # Used as a suffix for user and room IDs/aliases
        # THIS CANNOT BE CHANGED AFTER WITHOUT A DATABASE WIPE
        server_name = matrixDomain;

        # Database path where tuwunel stores its data
        # database_path = "/var/lib/tuwunel";

        # Address and port to listen on
        address = [
          "127.0.0.1"
          "::1"
        ];
        port = [ 8008 ];

        # Max request size for file uploads (100MB to match nginx config)
        max_request_size = 104857600; # 100 MiB in bytes

        # Registration settings
        allow_registration = true;
        registration_token = matrixRegistrationToken;

        # Federation settings
        allow_federation = true;

        # Trusted servers for key verification
        trusted_servers = [ "matrix.org" ];

        allow_public_room_directory_over_federation = false;

        new_user_displayname_suffix = "";

        # Allow encryption
        allow_encryption = true;

        # Well-known configuration for clients and federation
        well_known = {
          client = "https://${matrixDomain}";
          server = "${matrixDomain}:443";
        };

        # Logging level
        log = "info";
      };
    };
  };

  services.nginx = {
    enable = true;

    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;

    virtualHosts.${matrixDomain} = {
      enableACME = true;
      forceSSL = true;

      # Nginx standard body size is 1MB, which is quite small for media uploads
      # Increase this to match the max_request_size in tuwunel settings
      extraConfig = ''
        client_max_body_size 100M;
      '';

      locations."/" = {
        proxyPass = "http://127.0.0.1:8008";
        extraConfig = ''
          # Preserve host and scheme - critical for proper Matrix operation
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $remote_addr;
          proxy_set_header X-Forwarded-Proto https;
        '';
      };

      # Serve well-known files for Matrix client/server discovery
      locations."/.well-known/matrix/server" = {
        extraConfig = ''
          default_type application/json;
          return 200 '{"m.server": "${matrixDomain}:443"}';
        '';
      };

      locations."/.well-known/matrix/client" = {
        extraConfig = ''
          default_type application/json;
          add_header Access-Control-Allow-Origin *;
          return 200 '{
            "m.homeserver": {
              "base_url": "https://${matrixDomain}"
            },
            "org.matrix.msc4143.rtc_foci": [
              {
                "type": "livekit",
                "livekit_service_url": "https://call.olegsea.ru/livekit/jwt"
              }
            ]
          }';
        '';
      };
    };

    # Matrix Federation over HTTPS (port 8448)
    # Only needed if you want to federate with other homeservers
    virtualHosts."${matrixDomain}_federation" = {
      serverName = matrixDomain;
      listen = [
        {
          addr = "0.0.0.0";
          port = 8448;
          ssl = true;
        }
        {
          addr = "[::]";
          port = 8448;
          ssl = true;
        }
      ];

      # Use the same ACME certificate as the main domain
      useACMEHost = matrixDomain;
      forceSSL = true;

      # Same body size increase for larger files
      extraConfig = ''
        client_max_body_size 100M;
      '';

      locations."/" = {
        proxyPass = "http://127.0.0.1:8008";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $remote_addr;
          proxy_set_header X-Forwarded-Proto https;
        '';
      };
    };
  };

  # ACME/Let's Encrypt configuration
  security.acme = {
    acceptTerms = true;
    defaults.email = "olegsea1334@gmail.com";
    certs.${matrixDomain} = {
      group = "nginx";
    };
  };
}
