{ inputs, ... }:
{
  imports = [
    inputs.nix-minecraft.nixosModules.minecraft-servers
    ./pvp.nix
  ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
  };
}
