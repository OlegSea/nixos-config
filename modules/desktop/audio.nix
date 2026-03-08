{ pkgs, nixpkgs-stable, ... }:
{
  environment.systemPackages = with pkgs; [
    nixpkgs-stable.legacyPackages.x86_64-linux.guitarix
    reaper
    qjackctl
    helvum
  ];
}
