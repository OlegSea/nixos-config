{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    remmina
    virt-viewer

    zathura
    onlyoffice-desktopeditors
    libreoffice
  ];
  networking.networkmanager.plugins = with pkgs; [
    networkmanager-openvpn
  ];
  # TODO: certs

  hm = {
    programs.zathura = {
      enable = true;
      options = {
        selection-clipboard = "clipboard";
        add_newlines_when_copying_text = 0;
      };
    };
  };
}
