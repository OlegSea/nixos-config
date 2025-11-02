{ config, pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.deviceSection = ''
    Option "TearFree" "False"
    Option "VariableRefresh" "True"
  '';

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };

  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };
}
