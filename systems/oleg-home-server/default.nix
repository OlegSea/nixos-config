{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../configs/server.nix
    ../../modules/server/copyparty.nix
    ../../modules/server/nfs.nix
    ../../modules/server/matrix.nix
    ../../modules/server/nextcloud.nix
    ../../modules/server/minecraft/smp.nix
  ];
}
