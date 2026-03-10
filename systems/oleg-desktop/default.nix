{ config, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../configs/desktop.nix
    ../../modules/ai.nix
    ../../modules/desktop/audio.nix
  ];

  nixpkgs.config.cudaSupport = true;

  fileSystems."/mnt/external1" = {
    device = "/dev/disk/by-uuid/15c50dbf-5559-4fac-835f-049384965d6c";
    fsType = "ext4";
  };

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
