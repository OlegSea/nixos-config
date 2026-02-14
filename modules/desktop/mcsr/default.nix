{ inputs, pkgs, ... }:
let
  mcsrPkgs = inputs.mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.mcsr-nixos.nixosModules.waywall
  ];
  programs.waywall = {
    enable = true;
    config = {
      enableWaywork = true;
      linkWithSystemd = true;
      programs = [ mcsrPkgs.ninjabrain-bot ];
      files = {
        thin_bg = ../../../resources/minecraft/mcsr/thin.png;
        wide_bg = ../../../resources/minecraft/mcsr/wide.png;
        tall_bg = ../../../resources/minecraft/mcsr/tall.png;
        eye_overlay = ../../../resources/minecraft/mcsr/eye-overlay.png;
      };

      source = ./waywall.lua;
    };
  };
}
