{ ... }:
{
  imports = [
    ./core.nix
    ./cachix.nix
    ./nh.nix
    ./network
    ./users.nix
    ./containers.nix
    ./syncthing.nix
    ./virtualization.nix
  ];
}
