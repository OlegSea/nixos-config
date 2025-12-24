{ pkgs, ... }:
{
  imports = [
    ./appearance.nix
    ./autostart.nix
    ./input.nix
    ./keybinds.nix
    ./outputs.nix
    ./rules.nix

    ../fuzzel/fuzzel.nix
    ../swaync/swaync.nix
    ../waybar/waybar.nix
  ];
  home.packages = with pkgs; [
    qalculate-gtk
  ];

  programs.niri = {
    settings = {
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    };
  };
}
