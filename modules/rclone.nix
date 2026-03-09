{ config, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.rclone ];
  hm.programs.rclone.remotes = {
    olegdesktop-dav = {
      config = {
        type = "webdav";
        url = "http://46.138.252.231:3210";
        vendor = "owncloud";
        pacer_min_sleep = "0.01ms";
        user = "olegsea";
      };
      secrets = {
        pass = config.age.secrets.rclone-pass;
      };
    };
  };

  hm.systemd.user.services.rclone-webdav-mount = {
    Unit = {
      Description = "WebDAV home server mount";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };

    Service =
      let
        mountDir = "/home/olegsea/Share";
      in
      {
        Type = "simple";
        ExecStartPre = "/run/current-system/sw/bin/mkdir -p ${mountDir}";
        ExecStart = "${pkgs.rclone}/bin/rclone mount --vfs-cache-mode writes --dir-cache-time 5s olegdesktop-dav: ${mountDir}";
        ExecStop = "/run/current-system/sw/bin/fusermount -u ${mountDir}";
        Restart = "on-failure";
        RestartSec = "10s";
        Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
      };
  };
}
