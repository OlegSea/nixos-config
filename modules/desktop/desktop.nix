{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kitty
    fastfetch
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.ubuntu-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    libqalculate

    nemo
    nemo-fileroller
    nemo-preview
    kdePackages.ark
    vlc
    nomacs
  ];
}
