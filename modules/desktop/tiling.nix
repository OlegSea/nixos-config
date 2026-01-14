{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  programs.niri.package = pkgs.niri;
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  security.pam.services.swaylock = { };

  programs.mango.enable = true;
  services.noctalia-shell.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };

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
    # swaynotificationcenter
    libqalculate
    brightnessctl
    cliphist
    hyprshot
    swaybg
  ];
}
