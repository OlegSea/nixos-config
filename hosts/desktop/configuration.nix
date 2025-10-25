{ config, pkgs, nixosConfigDir, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "oleg-desktop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
