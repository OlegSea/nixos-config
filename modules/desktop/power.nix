{
  config,
  pkgs,
  nixosConfigDir,
  ...
}:

{
  services.power-profiles-daemon.enable = true;
}
