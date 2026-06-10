{ pkgs, noctalia, ... }:
{
  imports = [
    # ./bar.nix
    # ./launcher.nix
    # ./system.nix
    # ./widgets.nix
  ];

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  hm = {
    imports = [
      noctalia.homeModules.default
    ];

    programs.noctalia = {
      # TODO:
    };

    # programs.noctalia-shell.enable = true;
  };
}
