{ pkgs, noctalia, ... }:
{
  imports = [
    noctalia.nixosModules.default
    ./bar.nix
    ./launcher.nix
    ./system.nix
    ./widgets.nix
  ];

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
  ];

  services.noctalia-shell.enable = true;

  hm = {
    imports = [
      noctalia.homeModules.default
    ];

    programs.noctalia-shell.enable = true;
  };
}
