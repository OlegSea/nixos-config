{ pkgs, ... }:
{
  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" ];

  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    piper
    localsend
  ];
}
