{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mangohud
    vulkan-tools
    (heroic.override {
      extraPkgs = pkgs': with pkgs'; [
        gamescope
        gamemode
      ];
    })
  ];

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
