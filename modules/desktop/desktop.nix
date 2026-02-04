{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    fastfetch
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.ubuntu-mono
    libqalculate

    nemo
    nemo-fileroller
    nemo-preview
    vlc
    nomacs
  ];
}
