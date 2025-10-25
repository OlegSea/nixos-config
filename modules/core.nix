{ config, pkgs, ... }:

{
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

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

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        tree
        zip
        unzip
        tmux
        telegram-desktop
        htop
        obsidian
        vivaldi
        xray
        nekoray
        sing-box
        qbittorrent
        python3
        go
        distrobox
        discord
        wl-clipboard
        zed-editor
        nixd
        nil
        gh
      ];

    system.stateVersion = "25.05";
}
