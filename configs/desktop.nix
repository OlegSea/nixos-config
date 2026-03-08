{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../modules/work.nix
  ];

  # Notifications
  services.systembus-notify.enable = true;
}
