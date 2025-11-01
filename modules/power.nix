{
  config,
  pkgs,
  nixosConfigDir,
  ...
}:

{
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;
    };
  };

  systemd.services.power_notif = {
    description = "Battery notification";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash ${nixosConfigDir}/scripts/battery/battery_check.sh";
      User = "root";
      Environment = [
        "PATH=${pkgs.gawk}/bin:${pkgs.upower}/bin:${pkgs.bash}/bin:${pkgs.gnugrep}/bin:${pkgs.coreutils}/bin:${pkgs.sudo}/bin"
        "BASE_DIR=${nixosConfigDir}/scripts/battery"
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
