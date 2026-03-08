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
      mounts."" = {
        enable = true;
        mountPoint = "/home/olegsea/Share";
        options = {
          allow-non-empty = true;
          allow-other = true;
          nodev = true;
          nofail = true;
          buffer-size = "256M";
          cache-dir = "/home/olegsea/.cache/rclone";
          vfs-cache-mode = "full";
          vfs-read-chunk-size = "128M";
          vfs-read-chunk-size-limit = "1G";
          dir-cache-time = "5000h";
          poll-interval = "15s";
          vfs-cache-max-age = "1h";
          vfs-cache-max-size = "1G";
          umask = "000";
          gid = "100";
        };
      };
    };
  };

  fileSystems."/mnt/olegdesktop-dav" = {
    device = "olegdesktop-dav:";
    fsType = "rclone";
    options = [
      "nodev"
      "nofail"
      "allow_other"
      "args2env"
      "config=/etc/rclone-mnt.conf"
      "vfs-cache-mode=writes"
      "dir-cache-time=5s"
    ];
  };
}
