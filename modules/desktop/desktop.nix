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
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    libqalculate

    nemo
    nemo-fileroller
    nemo-preview
    kdePackages.ark
    vlc
    nomacs
  ];
}
