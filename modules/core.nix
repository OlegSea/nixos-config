{
  config,
  pkgs,
  inputs,
  system,
  lib,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelParams = [
    "hugepages=2048"
    "elevator=mq-deadline"
  ];

  nixpkgs.overlays = [
    (final: prev: {
      inherit (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;
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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    GSK_RENDERER = "ngl";
  };

  time.timeZone = "Europe/Moscow";

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
    pciutils
    lshw
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "25.05";
}
