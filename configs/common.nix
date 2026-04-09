{
  pkgs,
  options,
  flakeDir,
  ...
}:
{
  imports = [
    ../modules/shell.nix
    ../modules/containers.nix
    ../modules/virtualization.nix
    ../modules/bypass.nix
    ../modules/keepassxc.nix
    ../modules/git.nix
    ../modules/nix-ld.nix
  ];

  # System things
  system.stateVersion = "25.05";
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "hugepages=2048"
      "elevator=mq-deadline"
    ];
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 16 * 1024;
    }
  ];

  # User
  users.users.olegsea = {
    isNormalUser = true;
    description = "OlegSea";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Nix-related
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://niri.cachix.org"
    ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= "
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964= "
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.lixPackageSets.stable.lix;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "${flakeDir}"; # sets NH_OS_FLAKE variable for you
  };

  # Time and locale
  services.ntp.enable = true;

  networking.timeServers = options.networking.timeServers.default ++ [ "0.ru.pool.ntp.org" ];
  time.hardwareClockInLocalTime = false;
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

  # Network
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.resolved.enable = true;

  # SSH
  services.openssh = {
    enable = true;
    ports = [ 2022 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; # "yes", "without-password", "prohibit-password", "forced-commands-only", "no"
    };
  };

  # Packages that need to be on every machine
  environment.systemPackages = with pkgs; [
    cachix

    file
    tree
    eza

    zip
    unzip
    unrar
    p7zip

    vim
    git
    git-crypt
    just

    gnupg
    bc
    wget
    traceroute
    dnsutils

    htop
    btop
    psmisc
    usbutils
    lshw
  ];
}
