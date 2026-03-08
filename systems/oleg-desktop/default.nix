{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../configs/desktop.nix
    ../../modules/ai.nix
  ];

  nixpkgs.config.cudaSupport = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  boot.kernelParams = [
    "nvidia.NVreg_EnableGpuFirmware=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];
}
