{ inputs, pkgs, ... }:
let
  mcsrPkgs = inputs.mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.mcsr-nixos.nixosModules.waywall
  ];
  environment.systemPackages = [
    mcsrPkgs.ninjabrain-bot
  ];
  programs.waywall = {
    enable = true;
    config = {
      enableWaywork = true;
      linkWithSystemd = true;
      programs = [ mcsrPkgs.ninjabrain-bot ];
      files = {
        thin = ../../../resources/minecraft/mcsr/thin.png;
        wide = ../../../resources/minecraft/mcsr/wide.png;
        tall = ../../../resources/minecraft/mcsr/tall.png;
        eye_overlay = ../../../resources/minecraft/mcsr/eye-overlay.png;
      };

      source = ./waywall.lua;
    };
  };
}
