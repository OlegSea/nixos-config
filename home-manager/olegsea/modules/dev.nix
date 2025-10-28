{ pkgs, ... }:
{
  home.packages = with pkgs; [
    termius
    zed-editor
    nixd
    nil
    package-version-server
  ];
}
