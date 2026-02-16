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
    claude-code
    claude-code-acp
    notepad-next

    vscode.fhs
  ];
}
