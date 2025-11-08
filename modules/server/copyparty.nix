{
  inputs,
  pkgs,
  nixosConfigDir,
  ...
}:
{
  imports = [
    inputs.copyparty.nixosModules.default
  ];
  nixpkgs.overlays = [ inputs.copyparty.overlays.default ];
  environment.systemPackages = [ pkgs.copyparty ];
  services.copyparty = {
    enable = true;
    user = "copyparty";
    group = "copyparty";
    settings = {
      i = "0.0.0.0";
      p = [
        3210
        3211
      ];
      no-reload = true;
      ignored-flag = false;
    };

    # create users
    accounts = {
      olegsea = {
        passwordFile = "${nixosConfigDir}/resources/copyparty/password";
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
          rw = [
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
}
