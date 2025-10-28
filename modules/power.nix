{
  config,
  pkgs,
  nixosConfigDir,
  ...
}:

{
  services.power-profiles-daemon.enable = true;

  systemd.services.power_notif = {
    description = "Battery notification";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash ${nixosConfigDir}/scripts/battery_check.sh";
      User = "root";
      Environment = [
        "PATH=${pkgs.gawk}/bin:${pkgs.upower}/bin:${pkgs.bash}/bin:${pkgs.gnugrep}/bin:${pkgs.coreutils}/bin:${pkgs.sudo}/bin"
        "BASE_DIR=${nixosConfigDir}/scripts"
      ];
    };
  };
  systemd.timers.power_notif = {
    description = "Check battery";
    wantedBy = [ "timers.target" ];
    partOf = [ "backup.service" ];
    timerConfig.Persistent = "true";
    timerConfig.OnBootSec = "5m";
    timerConfig.OnUnitActiveSec = "5m";
  };
}
