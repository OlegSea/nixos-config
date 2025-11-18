{ ... }:
{
  imports = [
    ./ssh.nix
    ./copyparty.nix
    ./minecraft
  ];

  networking.firewall.allowedTCPPorts = [
    3000
  ];

  networking.firewall.allowedUDPPorts = [
    3000
  ];

}
