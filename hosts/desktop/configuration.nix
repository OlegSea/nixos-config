{
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common
    ../../modules/desktop
  ];

  networking.hostName = "oleg-desktop";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
