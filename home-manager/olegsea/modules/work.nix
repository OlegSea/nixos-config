{ pkgs, ... }:
{
  home.packages = with pkgs; [
    remmina
    virt-viewer
  ];
}
