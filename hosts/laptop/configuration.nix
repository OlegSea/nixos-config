{
  config,
  pkgs,
  nixosConfigDir,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "oleg-laptop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Lid
  services.logind.settings.Login.HandleLidSwitch = "suspend";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "lock";
  services.logind.settings.Login.HandleLidSwitchDocked = "ignore";

  nixpkgs.config.cudaSupport = true;
}
