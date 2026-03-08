{ pkgs, ... }:
{
  services.ratbagd.enable = true;
  hardware.logitech.wireless.enable = true;
  environment.systemPackages = with pkgs; [
    piper
    localsend
    solaar
  ];
}
