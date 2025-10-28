{ pkgs, ... }:
{
  imports = [
    ./niri/fuzzel.nix
    ./niri/swaync.nix
    ./niri/waybar.nix
  ];
  home.packages = with pkgs; [
    qalculate-gtk
  ];
}
