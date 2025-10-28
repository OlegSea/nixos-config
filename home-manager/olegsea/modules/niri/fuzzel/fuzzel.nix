{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "CaskaydiaCove NF:size=14";
        line-height = 20;
        fields = "name,generic,comment,categories,filename,keywords";
        terminal = "${pkgs.kitty}/bin/kitty";
        prompt = "❯   ";
        layer = "overlay";
        lines = 10;
      };
      colors = {
        background = "3c3836e6";
        text = "d79921ff";
        match = "b16286ff";
        selection = "bdae93bf";
        selection-match = "b16286ff";
        selection-text = "fabd2fff";
        border = "FFC300ff";
      };
      border = {
        radius = 5;
        width = 1;
      };

    };
  };
}
