{ pkgs, ... }:
{
  imports = [
    ./zed.nix
  ];
  home.packages = with pkgs; [
    # language servers
    nixd
    nil
    ruff
    tinymist
    package-version-server

    # other utils
    termius
    difftastic
    jj
    jq
    postman
  ];
}
