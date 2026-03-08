{ pkgs, ... }:
{
  imports = [
    ./common.nix

    ../modules/work.nix
    ../modules/rclone.nix

    ../modules/devices/tablet.nix
    ../modules/devices/logitech.nix

    ../modules/desktop/desktop.nix
    ../modules/desktop/kitty.nix
    ../modules/desktop/obs.nix
    ../modules/desktop/audio.nix
    ../modules/desktop/discord.nix
    ../modules/desktop/spotify.nix

    ../modules/desktop/niri
    ../modules/desktop/noctalia
    ../modules/desktop/theme
    ../modules/desktop/dev

    ../modules/desktop/games/tools.nix
    ../modules/desktop/games/minecraft.nix
    ../modules/desktop/games/steam.nix
    ../modules/desktop/games/osu.nix
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    networkmanagerapplet

    pciutils
    nvtopPackages.full
  ];

  # Notifications
  services.systembus-notify.enable = true;

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.noisetorch.enable = true;

  # Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.variables = {
    GSK_RENDERER = "ngl";
  };

  # Login
  services.displayManager.gdm.enable = true;

  # Xorg
  services.xserver.enable = true;
  services.xserver.deviceSection = ''
    Option "TearFree" "False"
    Option "VariableRefresh" "True"
  '';
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };
}
