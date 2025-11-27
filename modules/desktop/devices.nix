{ pkgs, ... }:
{
  hardware.opentabletdriver.enable = true;

  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    piper
  ];
}
