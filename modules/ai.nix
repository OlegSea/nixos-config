{ pkgs, llama-cpp, ... }:
{
  environment.systemPackages = with pkgs; [
    lmstudio
    # (pkgs.callPackage ../packages/llamacpp.nix { })
    llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
  ];
  networking.firewall.allowedTCPPorts = [
    1234
  ];
  networking.firewall.allowedUDPPorts = [
    1234
  ];
}
