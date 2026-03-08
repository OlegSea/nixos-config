{ pkgs, noctalia, ... }:
{
  imports = [
    ./bar.nix
    ./launcher.nix
    ./system.nix
    ./widgets.nix
  ];

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
  ];

  hm = {
    imports = [
      noctalia.homeModules.default
    ];

    programs.noctalia-shell.enable = true;
  };
}
