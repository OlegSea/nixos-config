{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lmstudio
  ];
  networking.firewall.allowedTCPPorts = [
    1234
  ];
  networking.firewall.allowedUDPPorts = [
    1234
  ];
}
