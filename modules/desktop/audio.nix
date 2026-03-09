{ pkgs, nixpkgs-stable, ... }:
{
  environment.systemPackages = with pkgs; [
    # FIX ME: remove this after https://github.com/nixos/nixpkgs/issues/493717 gets fixed
    nixpkgs-stable.legacyPackages.x86_64-linux.guitarix
    reaper
    qjackctl
    crosspipe
  ];
}
