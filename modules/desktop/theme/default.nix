{ pkgs, ... }:
{
  imports = [
    ./niri.nix
    ./noctalia.nix
    ./gnome.nix
  ];

  stylix = with pkgs; {
    enable = true;
    polarity = "dark";
    targets.kmscon.enable = false;
    base16Scheme = "${base16-schemes}/share/themes/gruvbox-dark.yaml";
    fonts = {
      serif = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono NF";
      };

      sansSerif = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono NF";
      };

      monospace = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaMono NF";
      };

      emoji = {
        package = nerd-fonts.caskaydia-mono;
        name = "Noto Color Emoji";
      };
    };
  };
}
