{ pkgs, ... }:
{
  stylix = with pkgs; {
    enable = true;
    base16Scheme = "${base16-schemes}/share/themes/gruvbox-dark.yaml";
    fonts = {
      serif = {
        package = dejavu_fonts;
        name = "CaskaydiaCove NF";
      };

      sansSerif = {
        package = dejavu_fonts;
        name = "CaskaydiaCove NF";
      };

      monospace = {
        package = dejavu_fonts;
        name = "CaskaydiaCove NF";
      };

      emoji = {
        package = noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
