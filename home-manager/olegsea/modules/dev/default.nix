{ pkgs, ... }:
{
  imports = [
    ./zed.nix
  ];
  home.packages = with pkgs; [
    termius
    nixd
    nil
    package-version-server
    difftastic
    jj
    jq
    ruff
    postman
  ];
}
