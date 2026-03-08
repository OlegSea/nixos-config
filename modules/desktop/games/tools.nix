{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mangohud
    vulkan-tools
    heroic
  ];

  programs.gamemode.enable = true;
}
