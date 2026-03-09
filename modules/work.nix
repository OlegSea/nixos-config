{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    remmina
    virt-viewer

    zathura
    onlyoffice-desktopeditors
    libreoffice
    obsidian
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

  security.pki.certificates =
    let
      dir = ../resources/certificates;
      files = builtins.readDir dir;
    in
    map (name: builtins.readFile (dir + "/${name}")) (
      builtins.filter (name: files.${name} == "regular") (builtins.attrNames files)
    );

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
