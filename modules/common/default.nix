{ ... }:
{
  imports = [
    ./core.nix
    ./cachix.nix
    ./nh.nix
    ./network.nix
    ./users.nix
    ./containers.nix
    ./syncthing.nix
  ];
}
