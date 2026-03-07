{ inputs, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.rclone ];
  environment.etc."rclone-mnt.conf".text = ''
    [olegdesktop-dav]
    type = webdav
    url = http://46.138.252.231:3210
    vendor = owncloud
    pacer_min_sleep = 0.01ms
    user = olegsea
    pass = ${builtins.readFile ../../resources/secrets/rclone-pass}
  '';

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
