{ pkgs, zapret-discord-youtube, ... }:
{
  # zapret
  imports = [
    zapret-discord-youtube.nixosModules.default
    {
      services.zapret-discord-youtube = {
        enable = true;
        config = "general (SIMPLE FAKE)";
      };
    }
  ];

  # VPN
  networking.firewall.trustedInterfaces = [ "tun" ];

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
