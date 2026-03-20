{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-source-record

      (pkgs.callPackage ./obs-wayland-hotkeys.nix {
      })
    ];
  };
}
