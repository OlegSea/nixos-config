{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Minecartf
    jdk17
    prismlauncher

    # recording n stuff
    obs-studio
  ];
}
