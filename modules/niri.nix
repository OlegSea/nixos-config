{ pkgs, ... }:

{
  programs.niri.package = pkgs.niri;
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    kitty
    fuzzel
    swaylock
    swayidle
    swaybg
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
  ];
}
