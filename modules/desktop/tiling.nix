{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
  ];

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.deviceSection = ''
    Option "TearFree" "False"
    Option "VariableRefresh" "True"
  '';
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  systemd.user.services.orca.enable = false;

  services.displayManager.gdm.enable = true;

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
    swaylock
    swayidle
    xwayland-satellite
    wl-clipboard
    playerctl
    pavucontrol
    upower
    libnotify
    brightnessctl
    cliphist
    hyprshot
    swaybg
  ];
}
