{
  pkgs,
  niri,
  ...
}:
{
  imports = [
    niri.nixosModules.niri
    ./autostart.nix
    ./input.nix
    ./keybinds.nix
    ./outputs.nix
    ./rules.nix
  ];
  programs.niri.package = pkgs.niri;
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  security.pam.services.swaylock = { };
  systemd.user.services.orca.enable = false;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
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
    nautilus
  ];

  hm = {
    programs.niri = {
      settings = {
        screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      };
    };
  };
}
