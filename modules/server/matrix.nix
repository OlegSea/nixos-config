{ inputs, pkgs, ... }:

let
  matrixRegistrationToken = builtins.readFile ../../resources/secrets/matrix-registration-token;
in
{
  services.matrix-continuwuity = {
    enable = true;
    settings = {
      global = {
        server_name = "matrix.olegsea.ru";
        # Listening on localhost by default
        # address and port are handled automatically
        allow_registration = true;
        registration_token = builtins.replaceStrings [ "\n" ] [ "" ] matrixRegistrationToken;
        allow_encryption = true;
        allow_federation = true;
        trusted_servers = [ "matrix.org" ];
        new_user_displayname_suffix = "";
      };
    };
  };
  services.nginx = {
    enable = true;

    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedProxySettings = true;

    virtualHosts = {
      "matrix.olegsea.ru" = {
        enableACME = true;
        forceSSL = true;

        listen = [
          {
            addr = "0.0.0.0";
            port = 80;
            ssl = false;
          }
          {
            addr = "[::]";
            port = 80;
            ssl = false;
          }
          {
            addr = "0.0.0.0";
            port = 443;
            ssl = true;
          }
          {
            addr = "[::]";
            port = 443;
            ssl = true;
          }
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

        locations = {
          # Matrix client and federation endpoints
          "/_matrix/" = {
            proxyPass = "http://127.0.0.1:6167";
            extraConfig = ''
              proxy_set_header Host $host;
              proxy_set_header X-Real-IP $remote_addr;
              proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
              proxy_set_header X-Forwarded-Proto $scheme;
              proxy_set_header X-Forwarded-Host $host;

              # Increase buffer sizes for large requests
              proxy_buffering off;
              proxy_request_buffering off;
              proxy_read_timeout 600s;
              proxy_send_timeout 600s;

              # Handle WebSocket connections
              proxy_http_version 1.1;
              proxy_set_header Upgrade $http_upgrade;
              proxy_set_header Connection "upgrade";
            '';
          };

          # Well-known delegation for Matrix
          "/.well-known/matrix/server" = {
            return = "200 '{\"m.server\": \"matrix.olegsea.ru:8448\"}'";
            extraConfig = ''
              add_header Content-Type application/json always;
              add_header Access-Control-Allow-Origin * always;
              add_header X-Frame-Options DENY always;
              add_header X-Content-Type-Options nosniff always;
              add_header X-XSS-Protection "1; mode=block" always;
              add_header Referrer-Policy "strict-origin-when-cross-origin" always;
            '';
          };

          "/.well-known/matrix/client" = {
            return = "200 '{\"m.homeserver\": {\"base_url\": \"https://matrix.olegsea.ru\"}}'";
            extraConfig = ''
              add_header Content-Type application/json always;
              add_header Access-Control-Allow-Origin * always;
              add_header X-Frame-Options DENY always;
              add_header X-Content-Type-Options nosniff always;
              add_header X-XSS-Protection "1; mode=block" always;
              add_header Referrer-Policy "strict-origin-when-cross-origin" always;
            '';
          };
        };

        extraConfig = ''
          # Increase client body size for file uploads
          client_max_body_size 50M;
        '';
      };
    };
  };

  networking.firewall = {
    allowedTCPPorts = [
      80
      443
      8448
    ];
  };
}
