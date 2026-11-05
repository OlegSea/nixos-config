{
  pkgs,
  nixpkgs-stable,
  musnix,
  lib,
  ...
}:
{
  imports = [
    musnix.nixosModules.musnix
  ];
  musnix.enable = true;
  users.users.olegsea.extraGroups = [ "audio" ];

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 256; # Lower values like 32 or 64 reduce latency further but risk crackles
      "default.clock.min-quantum" = 32;
      "default.clock.max-quantum" = 512;
    };
  };

  musnix.rtirq.enable = true;

  environment.systemPackages = with pkgs; [
    guitarix
    reaper
    qjackctl
    crosspipe
    easyeffects
    yabridge
    yabridgectl
  ];
}
