{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

let
  matrixDomain = "matrix.olegsea.ru";
  elementCallDomain = "call.olegsea.ru";
  turnDomain = "turn.olegsea.ru";

  # TURN secret
  turnSecret = builtins.readFile ../../../resources/secrets/turn-secret;

  # LiveKit key file path
  livekitKeyFile = "/var/lib/livekit/livekit.key";
in
{
  # Open firewall for TURN server and LiveKit
  networking.firewall = {
    allowedTCPPorts = [
      3478 # TURN TCP
      5349 # TURN TLS
      7880 # LiveKit
      7881 # LiveKit RTC
      8080 # LiveKit JWT service
    ];
    allowedUDPPorts = [
      3478 # TURN UDP
    ];
    allowedUDPPortRanges = [
      {
        from = 49000;
        to = 50000;
      } # Coturn relay ports
      {
        from = 50100;
        to = 50200;
      } # LiveKit RTC ports
    ];
  };

  # Coturn TURN server
  services.coturn = {
    enable = true;
    no-cli = true;
    no-tcp-relay = true;
    min-port = 49000;
    max-port = 50000;
    use-auth-secret = true;
    static-auth-secret = turnSecret;
    realm = turnDomain;
    cert = "${config.security.acme.certs.${turnDomain}.directory}/full.pem";
    pkey = "${config.security.acme.certs.${turnDomain}.directory}/key.pem";

    extraConfig = ''
      # Verbose logging for debugging
      verbose

      # Security: ban private IP ranges
      no-multicast-peers
      denied-peer-ip=0.0.0.0-0.255.255.255
      denied-peer-ip=10.0.0.0-10.255.255.255
      denied-peer-ip=100.64.0.0-100.127.255.255
      denied-peer-ip=127.0.0.0-127.255.255.255
      denied-peer-ip=169.254.0.0-169.254.255.255
      denied-peer-ip=172.16.0.0-172.31.255.255
      denied-peer-ip=192.0.0.0-192.0.0.255
      denied-peer-ip=192.0.2.0-192.0.2.255
      denied-peer-ip=192.88.99.0-192.88.99.255
      denied-peer-ip=192.168.0.0-192.168.255.255
      denied-peer-ip=198.18.0.0-198.19.255.255
      denied-peer-ip=198.51.100.0-198.51.100.255
      denied-peer-ip=203.0.113.0-203.0.113.255
      denied-peer-ip=240.0.0.0-255.255.255.255
      denied-peer-ip=::1
      denied-peer-ip=64:ff9b::-64:ff9b::ffff:ffff
      denied-peer-ip=::ffff:0.0.0.0-::ffff:255.255.255.255
      denied-peer-ip=100::-100::ffff:ffff:ffff:ffff
      denied-peer-ip=2001::-2001:1ff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=2002::-2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fc00::-fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff
      denied-peer-ip=fe80::-febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff
    '';
  };

  # Add coturn user to nginx group for certificate access
  users.users.turnserver.extraGroups = [ "nginx" ];

  # LiveKit service using NixOS module
  services.livekit = {
    enable = true;
    openFirewall = true;
    settings = {
      port = 7880;
      rtc = {
        tcp_port = 7881;
        port_range_start = 50100;
        port_range_end = 50200;
        use_external_ip = true;
        enable_loopback_candidate = false;
      };
      room.auto_create = false;
    };
    keyFile = livekitKeyFile;
  };

  # Ensure livekit directory exists with correct permissions
  systemd.services.livekit.serviceConfig.StateDirectory = "livekit";
  systemd.services.livekit.serviceConfig.StateDirectoryMode = "0755";

  # LiveKit JWT service
  services.lk-jwt-service = {
    enable = true;
    port = 8080;
    livekitUrl = "wss://${elementCallDomain}";
    keyFile = livekitKeyFile;
  };

  # Generate LiveKit key if it doesn't exist
  systemd.services.livekit-key = {
    before = [
      "lk-jwt-service.service"
      "livekit.service"
    ];
    wantedBy = [ "multi-user.target" ];
    path = with pkgs; [
      livekit
      coreutils
      gawk
    ];
    script = ''
      echo "Key missing, generating key"
      echo "lk-jwt-service: $(livekit-server generate-keys | tail -1 | awk '{print $3}')" > "${livekitKeyFile}"
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    unitConfig.ConditionPathExists = "!${livekitKeyFile}";
  };

  # Restrict access to livekit room creation to our homeserver
  systemd.services.lk-jwt-service.environment.LIVEKIT_FULL_ACCESS_HOMESERVERS = matrixDomain;

  # Nginx configuration for Element Call
  services.nginx.virtualHosts.${elementCallDomain} = {
    enableACME = true;
    forceSSL = true;

    locations = {
      # LiveKit JWT service endpoints
      "^~ /livekit/jwt/" = {
        priority = 400;
        proxyPass = "http://127.0.0.1:${toString config.services.lk-jwt-service.port}/";
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-Server $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };

      "^~ /livekit/sfu/" = {
        priority = 400;
        proxyPass = "http://127.0.0.1:${toString config.services.livekit.settings.port}/";
        proxyWebsockets = true;
        extraConfig = ''
          proxy_send_timeout 120;
          proxy_read_timeout 120;
          proxy_buffering off;

          proxy_set_header Accept-Encoding gzip;
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-Server $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
        '';
      };

      # Fallback for other paths
      #   "/" = {
      #     proxyPass = "http://127.0.0.1:${toString config.services.livekit.settings.port}";
      #     proxyWebsockets = true;
      #     extraConfig = ''
      #       proxy_set_header Connection "upgrade";
      #       proxy_set_header Upgrade $http_upgrade;
      #       proxy_set_header Host $host;
      #       proxy_set_header X-Forwarded-Server $host;
      #       proxy_set_header X-Real-IP $remote_addr;
      #       proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      #       proxy_set_header X-Forwarded-Proto $scheme;

      #       # Optional timeouts per LiveKit
      #       proxy_read_timeout 300s;
      #       proxy_send_timeout 300s;
      #     '';
      #   };
    };
  };

  # Nginx configuration for TURN server (optional status page)
  services.nginx.virtualHosts.${turnDomain} = {
    enableACME = true;
    forceSSL = true;

    locations."/" = {
      return = "200 'TURN server is running'";
      extraConfig = ''
        add_header Content-Type text/plain;
      '';
    };
  };

  # ACME certificates for new domains
  security.acme.certs = {
    ${elementCallDomain} = {
      group = "nginx";
    };

    ${turnDomain} = {
      group = "nginx";
      postRun = "systemctl restart coturn.service nginx.service";
    };
  };

  # Update Tuwunel configuration to include TURN settings
  services.matrix-tuwunel.settings.global = {
    # TURN configuration
    turn_uris = [
      "turn:${turnDomain}:3478?transport=udp"
      "turn:${turnDomain}:3478?transport=tcp"
      "turns:${turnDomain}:5349?transport=tcp"
    ];
    turn_secret = turnSecret;
    turn_ttl = 86400;
  };
}
