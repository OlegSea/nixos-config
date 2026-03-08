{ pkgs, ... }:
{
  imports = [ ./mcsr ];
  environment.systemPackages = with pkgs; [
    jdk17
    (prismlauncher.override {
      additionalLibs = [
        jemalloc
        libxtst
        libxkbcommon
        libxt
        libxinerama
        glfw3-minecraft
      ];
    })
  ];

  networking.firewall.allowedTCPPorts = [
    25566
  ];
  networking.firewall.allowedUDPPorts = [
    25566
  ];
}
