{
  pkgs,
  nixpkgs-stable,
  musnix,
  ...
}:
{
  imports = [
    musnix.nixosModules.musnix
  ];
  musnix.enable = true;
  users.users.olegsea.extraGroups = [ "audio" ];

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
