{ inputs, pkgs, ... }:
{
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  services.resolved.enable = true;
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  imports = [
    ./vpn.nix
    ./zapret.nix
    ./extra.nix
  ];
}
