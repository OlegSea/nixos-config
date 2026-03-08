{ noctalia, ... }:
{
  imports = [
    ./bar.nix
    ./launcher.nix
    ./system.nix
    ./widgets.nix
  ];

  hm = {
    imports = [
      noctalia.homeModules.default
    ];

    programs.noctalia-shell.enable = true;
  };
}
