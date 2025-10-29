{ pkgs, nixosConfigDir, ... }:
{
  stylix = with pkgs; {
    enable = true;
    base16Scheme = "${base16-schemes}/share/themes/gruvbox-dark.yaml";
    fonts = {
      serif = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaCove NF";
      };

      sansSerif = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaCove NF";
      };

      monospace = {
        package = nerd-fonts.caskaydia-mono;
        name = "CaskaydiaCove NF";
      };

      emoji = {
        package = nerd-fonts.caskaydia-mono;
        name = "Noto Color Emoji";
      };
    };
    image = ../resources/wallpaper.jpeg;
  };
}
