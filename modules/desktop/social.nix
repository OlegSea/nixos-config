{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    teamspeak6-client
    element-desktop
  ];
}
