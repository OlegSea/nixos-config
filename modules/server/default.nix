{ ... }:
{
  imports = [
    ./ssh.nix
    ./copyparty.nix
    ./minecraft
  ];

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  networking.firewall.allowedUDPPorts = [
    80
    443
  ];

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
}
