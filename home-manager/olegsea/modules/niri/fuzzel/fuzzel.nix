{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "CaskaydiaCove NF:size=16";
        terminal = "${pkgs.kitty}/bin/kitty";
        prompt = "❯   ";
        layer = "overlay";
        lines = 15;
        width = 50;
        horizontal-pad = 20;
        vertical-pad = 10;
        inner-pad = 10;
        line-height = 24;
      };
      colors = {
        background = "282828ff";
        text = "ebdbb2ff";
        match = "fe8019ff";
        selection = "3c3836ff";
        selection-match = "fabd2fff";
        selection-text = "ebdbb2ff";
        border = "504945ff";
      };
      border = {
        radius = 8;
        width = 2;
      };

    };
  };
}
