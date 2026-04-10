{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    lmstudio
    (pkgs.callPackage ../packages/llamacpp.nix { })
  ];
  networking.firewall.allowedTCPPorts = [
    1234
  ];
  networking.firewall.allowedUDPPorts = [
    1234
  ];
}
