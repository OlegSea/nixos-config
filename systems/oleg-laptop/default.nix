{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../configs/desktop.nix
  ];

  # Lid
  services.logind.settings.Login.HandleLidSwitch = "suspend";
  services.logind.settings.Login.HandleLidSwitchExternalPower = "lock";
  services.logind.settings.Login.HandleLidSwitchDocked = "ignore";

  nixpkgs.config.cudaSupport = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:100:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # a hack to fix random stutters on niri
  boot.kernelParams = [
    "nvidia.NVreg_EnableGpuFirmware=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  # bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # fingerprint - disabled for now
  # services.fprintd.enable = true;
  # services.fprintd.tod.enable = true;
  # services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}
