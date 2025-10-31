{ config, pkgs, nixosConfigDir, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "oleg-laptop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
