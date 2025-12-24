{ inputs, pkgs, ... }:

{
  programs.niri.package = pkgs.niri;
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  security.pam.services.swaylock = { };

  environment.sessionVariables = {
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
  };

  environment.systemPackages = with pkgs; [
    kitty
    fuzzel
    swaylock
    swayidle
    xwayland-satellite
    wl-clipboard
    playerctl
    fastfetch
    waybar
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.ubuntu-mono
    pavucontrol
    upower
    libnotify
    swaynotificationcenter
    libqalculate
    brightnessctl
    cliphist
  ];
}
