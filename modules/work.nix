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
    10.252.206.100 trvirt.anton.cloud
    10.252.197.111 ngh-max01.work.test
    10.252.197.112 ngh-max02.work.test
    10.252.197.115 ngh-mhe01.work.test
    10.252.197.116 ngh-max11.work.test
    10.252.197.117 ngh-max12.work.test
    10.252.197.118 ngh-max13.work.test
    10.252.197.121 ngh-host01.work.test
    10.252.197.122 ngh-host02.work.test
    10.252.197.125 ngh-he01.work.test
    10.252.197.110 ngh-nfs01.work.test
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
