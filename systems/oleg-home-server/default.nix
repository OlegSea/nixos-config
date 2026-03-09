{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../configs/server.nix
    ../../modules/server/copyparty.nix
    ../../modules/server/matrix.nix
    ../../modules/server/minecraft/smp.nix
  ];
}
