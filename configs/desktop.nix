{ pkgs, ... }:
{
  imports = [
    ./common.nix
    ../modules/work.nix
    ../modules/desktop/desktop.nix
    ../modules/desktop/niri
    ../modules/desktop/theme
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    # guitarix
    qjackctl
    reaper
    helvum
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
