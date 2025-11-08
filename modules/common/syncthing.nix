{ pkgs, ... }:
{
  services.syncthing =
    let
      username = "olegsea";
    in
    {
      enable = true;
      openDefaultPorts = true;
      user = username;
      configDir = "/home/${username}/.conifg/syncthing";
      settings = {
        folders = {
          "Share" = {
            path = "/home/olegsea/Share";
            # devices = [
            #   "oleg-laptop"
            #   "oleg-phone"
            # ];
          };
        };
      };
    };
  networking.firewall.allowedTCPPorts = [
    8384
    22000
  ];
  networking.firewall.allowedUDPPorts = [
    22000
    21027
  ];
}
