{ config, pkgs, nixosConfigDir, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "oleg-desktop";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
