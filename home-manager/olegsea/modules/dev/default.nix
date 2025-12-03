{ pkgs, ... }:
{
  imports = [
    ./zed.nix
    ./nvim.nix
    ./direnv.nix
  ];
  home.packages = with pkgs; [
    # language servers
    nixd
    nil
    ruff
    tinymist
    package-version-server
    clang-tools

    # other utils
    termius
    difftastic
    jj
    jq
    postman

    vscode.fhs
  ];
}
