{ ... }:
{
  imports = [
    ./ssh.nix
    ./copyparty.nix
    ./irc.nix
    ./matrix.nix
    ./minecraft
  ];

  networking.firewall.allowedTCPPorts = [
    80
    443
    3000
  ];

  networking.firewall.allowedUDPPorts = [
    80
    443
    3000
  ];

  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 0;
}
