{ pkgs, ... }:
{
  imports = [
    ./theme.nix
    ./keybinds.nix
    ./config.nix
  ];

  home.packages = with pkgs; [
    hyprshot
    brightnessctl
    playerctl
  ];

  wayland.windowManager.mango = {
    enable = true;
    systemd.enable = true;
  };
}
