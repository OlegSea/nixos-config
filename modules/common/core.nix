{
  config,
  pkgs,
  inputs,
  system,
  lib,
  options,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "hugepages=2048"
    "elevator=mq-deadline"
  ];


  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Moscow";

  services.ntp.enable = true;

  networking.timeServers = options.networking.timeServers.default ++ [ "0.ru.pool.ntp.org" ];
  time.hardwareClockInLocalTime = false;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.systembus-notify.enable = true;

  environment.systemPackages = with pkgs; [
    bc
    htop
    btop
    zip
    unzip
    tree
    wget
    vim
    git
    git-crypt
    gnupg
    just
    psmisc
    usbutils
    file
    traceroute
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "25.05";
}
