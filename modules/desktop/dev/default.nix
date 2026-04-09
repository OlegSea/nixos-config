{ pkgs, ... }:
{
  imports = [
    ./zed.nix
    ./nvim.nix
  ];

  environment.systemPackages = with pkgs; [
    # language servers
    nixd
    nil
    ruff
    pyright
    tinymist
    package-version-server
    clang-tools
    lua-language-server

    # other utils
    termius
    difftastic
    jj
    jq
    postman
    notepad-next

    claude-code

    vscode.fhs
    mongodb-compass
  ];
}
