{ nix-minecraft, ... }:
{
  imports = [
    nix-minecraft.nixosModules.minecraft-servers
  ];
  nixpkgs.overlays = [ nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;
    managementSystem.systemd-socket.enable = true;
  };

  networking.firewall.allowedUDPPorts = [ 24454 ];
}
