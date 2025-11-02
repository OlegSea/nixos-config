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
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    GSK_RENDERER = "ngl";
  };

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
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

  nixpkgs.overlays = [
    (final: prev: {
      qgnomeplatform = inputs.qgnome-fix.legacyPackages.${pkgs.system}.qgnomeplatform;
    })
  ];

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
