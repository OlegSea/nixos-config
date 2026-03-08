{ inputs, ... }:
{
  imports = [
    ./bar.nix
    ./launcher.nix
    ./system.nix
    ./widgets.nix
  ];

  hm = {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell.enable = true;
  };
}
