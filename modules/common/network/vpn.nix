{
  inputs,
  pkgs,
  ...
}:
{
  networking.firewall.trustedInterfaces = [ "tun" ];

  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
  ];

  environment.systemPackages = with pkgs; [
    xray
    sing-box
    throne
  ];

  programs.throne.tunMode.enable = true;

  security.wrappers = {
    xray = {
      owner = "root";
      group = "root";
      source = "${pkgs.xray}/bin/xray";
      capabilities = "cap_net_admin=ep";
    };

    sing-box = {
      owner = "root";
      group = "root";
      source = "${pkgs.sing-box}/bin/sing-box";
      capabilities = "cap_net_admin=ep";
    };

    throne-core = {
      owner = "root";
      group = "root";
      source = "${pkgs.throne.core}/bin/Core";
      capabilities = "cap_net_admin=ep";
    };
  };
}
