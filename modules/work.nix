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

  networking.extraHosts = ''
    10.252.207.6 engine.olegsea.local
    10.252.207.5 engine.olegsea-repl.local
    10.255.4.200 engine.ps.local
    172.25.1.100 repo-zvirt.orionsoft.ru
  '';

  security.pki.certificateFiles = [
    ../secrets/cert-1.age
    ../secrets/cert-2.age
    ../secrets/cert-3.age
    ../secrets/cert-4.age
  ];

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
