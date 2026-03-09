{
  copyparty,
  pkgs,
  config,
  ...
}:
{
  imports = [
    copyparty.nixosModules.default
  ];

  nixpkgs.overlays = [ copyparty.overlays.default ];
  environment.systemPackages = [ pkgs.copyparty ];

  age.secrets.copyparty-pass.owner = "copyparty";
  age.secrets.copyparty-pass.group = "copyparty";
  age.secrets.copyparty-pass.mode = "770";

  services.copyparty = {
    enable = true;
    user = "copyparty";
    group = "copyparty";
    settings = {
      i = "0.0.0.0";
      p = [
        3210
        3211
        # 80
        # 443
      ];
      no-reload = true;
      ignored-flag = false;
    };

    # create users
    accounts = {
      olegsea = {
        passwordFile = config.age.secrets.copyparty-pass.path;
      };
    };

    groups = {
      g1 = [
        "olegsea"
      ];
    };

    volumes = {
      "/" = {
        path = "/srv/copyparty";
        access = {
          A = [
            "olegsea"
          ];
        };
        flags = {
          fk = 4;
          scan = 60;
          e2d = true;
          d2t = true;
          nohash = "\.iso$";
        };
      };
    };
    openFilesLimit = 8192;
  };
  networking.firewall.allowedTCPPorts = [
    80
    3210
    3211
    3921
  ];
  systemd.services.copyparty.serviceConfig.AmbientCapabilities = "CAP_NET_BIND_SERVICE";
}
